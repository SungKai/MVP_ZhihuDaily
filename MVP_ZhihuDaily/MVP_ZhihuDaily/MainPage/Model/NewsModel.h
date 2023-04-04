//
//  NewsModel.h
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/4.
//

#import <Foundation/Foundation.h>
#import "DayModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NewsModelDelegate <NSObject>

@optional

/// 请求Latest 成功的回调
/// - Parameter latestDayModel: 最新新闻的model
- (void)didReceiveLatestNews:(DayModel *)latestDayModel;

/// 请求before 成功的回调
/// - Parameter beforeDayModel: 最新新闻的model
- (void)didReceiveBeforeNews:(DayModel *)beforeDayModel;

@end

@interface NewsModel : NSObject

/// 代理
@property (nonatomic, weak) id<NewsModelDelegate> delegate;

/// 获取最新新闻
- (void)fetchLatestNews;

- (void)feachBeforeNewsWithDate:(NSString *)date;


@end

NS_ASSUME_NONNULL_END
