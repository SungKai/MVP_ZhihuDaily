//
//  BannerCollectionViewCell.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/7.
//

#import "BannerCollectionViewCell.h"

@implementation BannerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imgView];
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.hintLab];
    }
    return self;
}

#pragma mark - Method



#pragma mark - Getter

- (UILabel *)titleLab {
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(30, DEVICESCREENWIDTH - 120, DEVICESCREENWIDTH - 28 - 28, 70)];
        _titleLab.textColor = UIColor.whiteColor;
        _titleLab.font = [UIFont boldSystemFontOfSize:24];
        _titleLab.numberOfLines = 0;
        _titleLab.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLab;
}

- (UILabel *)hintLab {
    if (_hintLab == nil) {
        _hintLab = [[UILabel alloc] initWithFrame:CGRectMake(30, DEVICESCREENWIDTH - 45, DEVICESCREENWIDTH - 28 - 28, 18)];
        _hintLab.textColor = [UIColor colorWithRed:214/255.0 green:208/255.0 blue:203/255.0 alpha:1.0];
        _hintLab.font = [UIFont systemFontOfSize:15];
        _hintLab.numberOfLines = 0;
        _hintLab.textAlignment = NSTextAlignmentLeft;
    }
    return _hintLab;
}

- (UIImageView *)imgView {
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imgView.backgroundColor = [UIColor grayColor];
        _imgView.layer.masksToBounds = YES;
        _imgView.layer.cornerRadius = 4;
        _imgView.backgroundColor = [UIColor lightGrayColor];
    }
    return _imgView;
}


@end
