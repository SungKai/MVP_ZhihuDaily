//
//  NewsData.h
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/5.
//

// 一个能让View直接使用的数据模型, 包含View需要的所有信息
// 新闻列表
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsData : NSObject

@property (nonatomic, copy) NSString *imageURL;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *hint;

@property (nonatomic, copy) NSString *date;

@property (nonatomic, copy) NSString *idStr;

@end

@interface BannerData : NSObject

@property (nonatomic, copy) NSString *imageURL;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *hint;

@property (nonatomic, copy) UIColor *image_hue;

@property (nonatomic, copy) NSString *idStr;

@end
NS_ASSUME_NONNULL_END
