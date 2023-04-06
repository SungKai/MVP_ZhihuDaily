//
//  TopView.h
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TopView : UIView

@property (nonatomic, strong) UILabel *dayLab;

@property (nonatomic, strong) UILabel *monthLab;

@property (nonatomic, strong) UIView *divider;

@property (nonatomic, strong) UILabel *mainTitle;

@property (nonatomic, strong) UIButton *personButton;

@end

NS_ASSUME_NONNULL_END
