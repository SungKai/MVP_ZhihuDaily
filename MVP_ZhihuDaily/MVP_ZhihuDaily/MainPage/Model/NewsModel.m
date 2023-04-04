//
//  NewsModel.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/4.
//

#import "NewsModel.h"

@implementation NewsModel

/// 获取最新新闻
- (void)fetchLatestNews {
    [DayModel getLatest:^(DayModel * _Nonnull latestModel) {
        [self.delegate didReceiveLatestNews:latestModel];
    }];
}

- (void)fetchBeforeNewsWithDate:(NSString *)date {
    [DayModel getBeforeDate:date AndModel:^(DayModel * _Nonnull beforeModel) {
        [self.delegate didReceiveBeforeNews:beforeModel];
    }];
}




@end
