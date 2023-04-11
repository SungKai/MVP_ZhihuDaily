//
//  NSDate+Day.h
//  ZhiHuDaily
//
//  Created by 宋开开 on 2022/4/6.
//

// 此分类为日期的封装
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Day)

// 得到今天日期
+ (NSDate *)today;
// 得到今天的day
- (NSString *)day;
- (NSString *)min;

// 得到今天的month
- (NSString *)month;
// 翻译为中文
- (NSString *)transformChinese;

@end

NS_ASSUME_NONNULL_END
