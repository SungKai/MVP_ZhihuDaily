//
//  MainPresenter.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/3.
//

#import "MainPresenter.h"

// Model
#import "NewsModel.h"

// Protocol
#import "MainProtocol.h"

// Tools
#import "UIColor+Hex.h"

@interface MainPresenter () <
    NewsModelDelegate
>

/// NewsModel
@property (nonatomic, strong) NewsModel *newsModel;

/// View
@property (nonatomic, weak) id<MainProtocol> view;

@end


@implementation MainPresenter

#pragma mark - Life cycle

/// 初始化View
- (instancetype)initWithView:(id)view {
    self = [super init];
    if (self) {
        // 绑定View
        self.view = view;
        // 绑定Model
        self.newsModel = [[NewsModel alloc] init];
        self.newsModel.delegate = self;
    }
    return self;
}

#pragma mark - Method

/// 请求最新信息
- (void)fetchLatestNewsData {
    [self.newsModel fetchLatestNews];
}

/// 请求过往列表
- (void)fetchBeforeNewsData:(NSString *)date {
    [self.newsModel fetchBeforeNewsWithDate:date];
}

#pragma mark - Delegate



// MARK: <NewsModelDelegate>

/// 请求Latest 成功的回调
- (void)didReceiveLatestNews:(DayModel *)latestDayModel {
    // 获取到的用户信息传递给View层进行展示
    // 这个app比较幸运，直接请求到的model数据和UI所要展示的数据基本一致，不需要进行过多换转
    // banner 数据
    NSMutableArray *bannerMa = [NSMutableArray array];
    for (BannerDataModel *model in latestDayModel.top_stories) {
        BannerData *data = [[BannerData alloc] init];
        data.title = model.title;
        data.hint = model.hint;
        data.imageURL = model.image;
        data.image_hue = [UIColor colorWithHexString:model.image_hue];
        [bannerMa addObject:data];
    }
    // 为了实现轮播效果
    // 尾部插入第一张
    [bannerMa addObject:bannerMa[0]];
    NSArray *bannerData = [NSArray array];
    bannerData = bannerMa;
    
    // 列表数据
    NSMutableArray *listMa = [NSMutableArray array];
    for (DataModel *model in latestDayModel.stories) {
        NewsData *data = [[NewsData alloc] init];
        data.title = model.title;
        data.hint = model.hint;
        data.imageURL = model.imageURL;
        data.date = latestDayModel.date;
        [listMa addObject:data];
    }
    NSArray *listData = [NSArray array];
    listData = listMa;
    NSDictionary *dict = @{@"bannerData": bannerData,
                           @"listData": listData
    };
    [self.view showLatestNews:dict];

}

/// 请求before 成功的回调
- (void)didReceiveBeforeNews:(DayModel *)beforeDayModel {
    // 获取到的用户信息传递给View层进行展示
    NSMutableArray *listMa = [NSMutableArray array];
    for (DataModel *model in beforeDayModel.stories) {
        NewsData *data = [[NewsData alloc] init];
        data.title = model.title;
        data.hint = model.hint;
        data.imageURL = model.imageURL;
        data.date = beforeDayModel.date;
        [listMa addObject:data];
    }
    [self.view showBeforeNews:listMa];
}


@end




