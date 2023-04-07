//
//  BannerCollectionView.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/7.
//

#import "BannerCollectionView.h"


@implementation BannerCollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    // 实例化UICollectionViewFlowLayout对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置UICollectionViewFlowLayout的属性
    layout.itemSize = CGSizeMake(DEVICESCREENWIDTH, DEVICESCREENWIDTH); // 指定单元格大小
    layout.minimumLineSpacing = 0; // 设置行间距
    layout.minimumInteritemSpacing = 0; // 设置列间距
    //可能会被强制调整,取决于UIEdgeInsetsMake
//    layout.sectionInset = UIEdgeInsetsMake(10, 25, 10, 25);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal; // 设置滚动方向为横向
    self.pagingEnabled = YES;
    return [self initWithFrame:frame collectionViewLayout:layout];
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self registerClass:[BannerCollectionViewCell class] forCellWithReuseIdentifier:@"bannerID"];
    }
    return self;
}

@end
