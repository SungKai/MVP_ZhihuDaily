//
//  DetailModel.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/10.
//

#import "DetailModel.h"

@implementation DetailModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.url = dic[@"url"];
    }
    return self;
}

@end
