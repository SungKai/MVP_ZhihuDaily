//
//  DataModel.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/3.
//

#import "DataModel.h"

@implementation DataModel

- (instancetype)initWithNewsDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.title = dic[@"title"];
        self.hint = dic[@"hint"];
        self.imageURL = dic[@"images"][0];
        self.image_hue = dic[@"image_hue"];
        self.ID = dic[@"id"];
        self.url = dic[@"url"];
    }
    return self;
}

@end
