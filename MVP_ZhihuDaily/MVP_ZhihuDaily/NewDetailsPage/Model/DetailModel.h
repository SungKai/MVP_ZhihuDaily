//
//  DetailModel.h
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailModel : NSObject

/// WebView 的URL
@property (nonatomic, copy) NSString *url;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
