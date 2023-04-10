//
//  MainTableViewCell.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/5.
//

#import "MainTableViewCell.h"
#import "Masonry.h"

@implementation MainTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.hintLab];
        [self.contentView addSubview:self.imgView];
        [self setPosition];
    }
    return self;
}

#pragma mark - Method

// 未加载完数据状态下的cell
+ (MainTableViewCell *)creatCellDefault:(UITableView *)tableView {
    static NSString *newsID = @"newsID";
    MainTableViewCell *newsCell = [tableView dequeueReusableCellWithIdentifier:newsID];
    if (newsCell == nil) {
        newsCell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:newsID];
    }
    return newsCell;
}

- (void)setNormalBackground {
    self.titleLab.backgroundColor = UIColor.clearColor;
    self.hintLab.backgroundColor = UIColor.clearColor;
}

- (void)setPosition{
    // imgView
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-18);
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(76, 76));
    }];
}

#pragma mark - Getter

- (UILabel *)titleLab{
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.textColor = UIColor.blackColor;
        _titleLab.font = [UIFont boldSystemFontOfSize:17];
        _titleLab.backgroundColor = UIColor.lightGrayColor;
        _titleLab.frame = CGRectMake(20, 15, WIDTH, 43);
        _titleLab.numberOfLines = 0;
        _titleLab.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLab;
}

- (UILabel *)hintLab{
    if (_hintLab == nil) {
        _hintLab = [[UILabel alloc]init];
        _hintLab.textColor = [UIColor lightGrayColor];
        _hintLab.font = [UIFont systemFontOfSize:14];
        _hintLab.backgroundColor = UIColor.lightGrayColor;
        _hintLab.frame = CGRectMake(20, 64, WIDTH, 16);
        _hintLab.numberOfLines = 0;
        _hintLab.textAlignment = NSTextAlignmentLeft;
    }
    return _hintLab;
}

- (UIImageView *)imgView{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc]init];
        _imgView.backgroundColor = UIColor.grayColor;
        _imgView.layer.masksToBounds = YES;
        _imgView.layer.cornerRadius = 4;
        _imgView.backgroundColor = [UIColor lightGrayColor];
    }
    return _imgView;
}

@end

