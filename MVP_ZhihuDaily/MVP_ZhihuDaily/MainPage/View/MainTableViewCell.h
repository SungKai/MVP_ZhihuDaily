//
//  MainTableViewCell.h
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLab;

@property (nonatomic, strong) UILabel *hintLab;

@property (nonatomic, strong) UIImageView *imgView;

// 未加载完数据状态下的cell
+ (MainTableViewCell *)creatCellDefault:(UITableView *)tableView;

// 消除背景颜色
- (void)setNormalBackground;

@end

NS_ASSUME_NONNULL_END
