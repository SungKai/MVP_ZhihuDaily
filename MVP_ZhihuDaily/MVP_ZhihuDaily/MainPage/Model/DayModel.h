//
//  DayModel.h
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/3.
//

#import <Foundation/Foundation.h>
#import "DataModel.h"
#import "BannerDataModel.h"

// Tools
#import "NetworkManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface DayModel : NSObject

@property (nonatomic, copy) NSString * date;

@property (nonatomic, strong) NSArray<BannerDataModel *> *top_stories;

@property (nonatomic, strong) NSArray<DataModel *> *stories;

/// 请求Latest数据
/// @param LatestDayModel 当天的新闻数据
+ (void)getLatest:(void(^)(DayModel *))LatestDayModel;
                        
/// 请求Before数据
/// @param date 日期
/// @param beforeModel 一天的新闻数据
+ (void)getBeforeDate:(NSString *)date AndModel:(void(^)(DayModel *))beforeModel;

@end

NS_ASSUME_NONNULL_END
