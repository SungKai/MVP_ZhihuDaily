//
//  BannerDataModel.h
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/3.
//

// banner 元数据
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BannerDataModel : NSObject

@property (nonatomic, copy) NSString * image_hue;

@property (nonatomic, copy) NSString * image;

@property (nonatomic, copy) NSString * title;

@property (nonatomic, copy) NSString * url;

@property (nonatomic, copy) NSString * imageURL;

@property (nonatomic, copy) NSString * hint;

@property (nonatomic, copy) NSString * ID;

/// Banner创建
/// @param dic 每天的banner数据
- (instancetype)initWithBannerDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
