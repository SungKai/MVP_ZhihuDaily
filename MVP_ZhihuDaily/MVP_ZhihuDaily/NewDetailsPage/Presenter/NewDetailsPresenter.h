//
//  NewDetailsPresenter.h
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/9.
//

#import <Foundation/Foundation.h>

// Protocol
#import "NewDetailsVCProtocol.h"

// Model
#import "NewDetailsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewDetailsPresenter : NSObject

/// VC
@property (nonatomic, weak) id<NewDetailsVCProtocol> view;

/// 初始化,传入对应ID
- (instancetype)initWithID:(NSString *)idStr;

/// 网络请求
- (void)fetchNewsDetailsModel;

@end

NS_ASSUME_NONNULL_END
