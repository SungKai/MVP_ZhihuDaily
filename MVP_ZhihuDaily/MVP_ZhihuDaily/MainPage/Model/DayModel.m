//
//  DayModel.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/3.
//

#import "DayModel.h"

@implementation DayModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.top_stories = [NSArray array];
        self.stories = [NSArray array];
    }
    return self;
}

+ (void)getLatest:(void (^)(DayModel * _Nonnull))lastestDayModel {
    [[NetworkManager shareManager]
     requestURL:latestNews
     type:NetworkManagerRequestTypeGet
     parameters:nil
     progress:nil
     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // cell 新闻
        DayModel *dayModel = [[DayModel alloc] init];
        dayModel.date = responseObject[@"date"];
        dayModel.stories = [dayModel cellNewsArray:responseObject[@"stories"]];
        dayModel.top_stories = [dayModel bannerNewsArray:responseObject[@"top_stories"]];
        lastestDayModel(dayModel);
    }
     failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"latest 数据请求失败");
    }];
}

/// 请求Before数据
+ (void)getBeforeDate:(NSString *)date AndModel:(void(^)(DayModel *))beforeModel {
    [[NetworkManager shareManager]
     requestURL:[NSString stringWithFormat:beforeNews, date]
     type:NetworkManagerRequestTypeGet
     parameters:nil
     progress:nil
     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        DayModel *dayModel = [[DayModel alloc] init];
        dayModel.date = responseObject[@"date"];
        dayModel.stories = [dayModel cellNewsArray:responseObject[@"stories"]];
        beforeModel(dayModel);
    }
     failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"Before 数据请求失败");
    }];
}

/// cell
- (NSArray *)cellNewsArray:(NSArray *)array {
    NSMutableArray *ma = [NSMutableArray array];
    for (NSDictionary *dic in array){
        DataModel *dataModel = [[DataModel alloc] initWithNewsDic:dic];
        [ma addObject:dataModel];
    }
    return ma;
}

/// banner
- (NSArray *)bannerNewsArray:(NSArray *)array {
    NSMutableArray *ma = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        BannerDataModel *bannerModel = [[BannerDataModel alloc] initWithBannerDic:dic];
        [ma addObject:dic];
    }
    return ma;
}
@end
