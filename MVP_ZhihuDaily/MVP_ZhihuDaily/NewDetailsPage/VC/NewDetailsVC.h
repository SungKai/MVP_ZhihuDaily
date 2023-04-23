//
//  NewDetailsVC.h
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/9.
//

#import <UIKit/UIKit.h>

// Protocol
#import "NewDetailsVCProtocol.h"

// Presenter
#import "NewDetailsPresenter.h"

// View
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewDetailsVC : UIViewController

- (instancetype)initWithPresenter:(NewDetailsPresenter *)presenter;

@end

NS_ASSUME_NONNULL_END
