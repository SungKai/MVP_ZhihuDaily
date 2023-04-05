//
//  DataModel.h
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/3.
//

// 每个cell 的元信息
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataModel : NSObject

@property (nonatomic, copy) NSString *image_hue;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *imageURL;

@property (nonatomic, copy) NSString *hint;

@property (nonatomic, copy) NSString *ID;

/// NewsCell创建
/// @param dic 每天的cell数据
- (instancetype)initWithNewsDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
