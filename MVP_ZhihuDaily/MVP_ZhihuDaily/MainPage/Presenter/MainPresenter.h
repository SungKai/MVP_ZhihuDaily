//
//  MainPresenter.h
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainPresenter : NSObject

/// 初始化View
- (instancetype)initWithView:(id)view;

/// 请求最新信息
- (void)fetchLatestNewsData;

/// 请求过往列表
- (void)fetchBeforeNewsData:(NSString *)date;

@end

NS_ASSUME_NONNULL_END
