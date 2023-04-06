//
//  DateHeaderView.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/6.
//

#import "DateHeaderView.h"
#import "Masonry.h"

@implementation DateHeaderView

- (instancetype)initWithDateHeaderViewWithDate:(NSString *)date{
    self = [super init];
    if (self){
        [self addSubview:self.dateLabel];
        [self addSubview:self.line];
        self.dateLabel.text = date;
        [self setPosition];
    }
    return self;
}

#pragma mark - Method

- (void)setPosition{
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(18);
        make.size.mas_equalTo(CGSizeMake(70, 15));
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self);
        make.left.equalTo(self.dateLabel.mas_right).offset(6);
        make.height.mas_equalTo(1);
    }];
}

#pragma mark - Getter

- (UILabel *)dateLabel{
    if (_dateLabel == nil){
        _dateLabel = [[UILabel alloc]init];
        _dateLabel.textColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0];
        _dateLabel.font = [UIFont boldSystemFontOfSize:16];
    }
    return _dateLabel;
}

- (UIView *)line{
    if (_line == nil){
        _line = [[UIView alloc]init];
        _line.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0];
    }
    return _line;
}

@end
