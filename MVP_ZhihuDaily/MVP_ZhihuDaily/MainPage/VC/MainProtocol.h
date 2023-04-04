//
//  MainProtocol.h
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/4.
//

#ifndef MainProtocol_h
#define MainProtocol_h

@protocol MainProtocol <NSObject>

/// 展示最新新闻
- (void)showLatestNews:(id)latestModel;

/// 展示过往新闻
- (void)showBeforeNews:(id)beforeModel;

@end

#endif /* MainProtocol_h */
