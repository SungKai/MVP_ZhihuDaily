//
//  NewDetailsModel.h
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/10.
//

#import <Foundation/Foundation.h>

// Model
#import "DetailModel.h"

// Tool
#import "NetworkManager.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NewDetailsModelDelegate <NSObject>

- (void)didReceiveNewsDetail:(DetailModel *)model;

@end

@interface NewDetailsModel : NSObject

/// 代理
@property (nonatomic, weak) id<NewDetailsModelDelegate> delegate;

- (void)fetchNewDetails:(NSString *)idStr;

@end

NS_ASSUME_NONNULL_END
