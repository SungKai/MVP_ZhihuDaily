//
//  BannerCollectionViewCell.h
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BannerCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *titleLab;

@property (nonatomic, strong) UILabel *hintLab;

@property (nonatomic, strong) UIImageView *imgView;

/// 控制图像色调
@property (nonatomic, strong) CAGradientLayer *grandLayer;

@end

NS_ASSUME_NONNULL_END
