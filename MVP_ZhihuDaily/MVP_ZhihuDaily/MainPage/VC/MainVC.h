//
//  MainVC.h
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/3.
//

#import <UIKit/UIKit.h>

// Presenter
#import "MainPresenter.h"
#import "NewDetailsPresenter.h"

// VC
#import "NewDetailsVC.h"

// View
#import "TopView.h"
#import "BannerCollectionView.h"
#import "MainTableViewCell.h"
#import "DateHeaderView.h"

// Tools
#import "NSDate+Day.h"

// Protocol
#import "MainProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainVC : UIViewController

@end

NS_ASSUME_NONNULL_END
