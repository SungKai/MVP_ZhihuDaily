//
//  TopView.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/6.
//

#import "TopView.h"
#import "Masonry.h"

@implementation TopView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        [self addSubview:self.dayLab];
        [self addSubview:self.monthLab];
        [self addSubview:self.mainTitle];
        [self addSubview:self.divider];
        [self addSubview:self.personButton];
        [self setPosition];
    }
    return self;
}

#pragma mark - Method

- (void)setPosition{
    [self.monthLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-6);
        make.left.equalTo(self).offset(12);
        make.size.mas_equalTo(CGSizeMake(35, 15));
    }];
    
    [self.dayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.monthLab.mas_top).offset(-3);
        make.centerX.equalTo(self.monthLab);
        make.left.right.equalTo(self.monthLab);
        make.height.mas_equalTo(17);
    }];
    
    [self.divider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(1);
        make.bottom.equalTo(self.monthLab).offset(1);
        make.top.equalTo(self.dayLab).offset(-2);
        make.left.equalTo(self.monthLab.mas_right).offset(10);
    }];
    
    [self.mainTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.divider).offset(12);
        make.centerY.equalTo(self.divider);
        make.size.mas_equalTo(CGSizeMake(110, 30));
    }];
    
    [self.personButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.divider);
        make.right.equalTo(self).offset(-20);
        make.size.mas_equalTo(CGSizeMake(38, 38));
    }];
}

#pragma mark - Getter

- (UILabel *)dayLab{
    if (_dayLab == nil) {
        _dayLab = [[UILabel alloc] init];
        _dayLab.textAlignment = NSTextAlignmentCenter;
        _dayLab.font = [UIFont boldSystemFontOfSize:20];
        _dayLab.textColor = [UIColor colorWithRed:68/255.0 green:68/255.0 blue:68/255.0 alpha:1.0];
    }
    return _dayLab;
}

- (UILabel *)monthLab {
    if (_monthLab == nil) {
        _monthLab = [[UILabel alloc] init];
        _monthLab.font = [UIFont systemFontOfSize:13];
        _monthLab.textAlignment = NSTextAlignmentCenter;
        _monthLab.textColor = [UIColor colorWithRed:68/255.0 green:68/255.0 blue:68/255.0 alpha:1.0];
    }
    return _monthLab;
}

- (UIView *)divider {
    if (_divider == nil) {
        _divider = [[UIView alloc] init];
        _divider.backgroundColor = UIColor.lightGrayColor;
    }
    return _divider;
}

- (UIButton *)personButton {
    if (_personButton == nil) {
        _personButton = [[UIButton alloc] init];
        _personButton.layer.masksToBounds = YES;
        _personButton.layer.cornerRadius = 19;
        [_personButton setBackgroundImage:[UIImage imageNamed:@"Account_Avatar"] forState:UIControlStateNormal];
    }
    return _personButton;
}

- (UILabel *)mainTitle{
    if (_mainTitle == nil) {
        _mainTitle = [[UILabel alloc] init];
        _mainTitle.text = @"知乎日报";
        _mainTitle.textColor = UIColor.blackColor;
        _mainTitle.textAlignment = NSTextAlignmentLeft;
        _mainTitle.font = [UIFont boldSystemFontOfSize:24];
    }
    return _mainTitle;
}

@end
