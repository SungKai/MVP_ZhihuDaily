//
//  BannerDataModel.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/3.
//

#import "BannerDataModel.h"

@implementation BannerDataModel

- (instancetype)initWithBannerDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.title = dic[@"title"];
        self.hint = dic[@"hint"];
        self.image = dic[@"image"];
        self.image_hue = dic[@"image_hue"];
        self.ID = dic[@"id"];
        self.url = dic[@"url"];
    }
    return self;
}

@end
