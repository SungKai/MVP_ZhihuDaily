//
//  MainProtocol.h
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/4.
//

#ifndef MainProtocol_h
#define MainProtocol_h

#import "DayModel.h"

@protocol MainProtocol <NSObject>

/// 展示最新新闻
- (void)showLatestNews:(DayModel)latestModel;

/// 展示过往新闻
- (void)showBeforeNews:(DayModel)beforeModel;

@end

#endif /* MainProtocol_h */
