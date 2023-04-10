//
//  NewDetailsPresenter.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/9.
//

#import "NewDetailsPresenter.h"

@interface NewDetailsPresenter () <
    NewDetailsModelDelegate
>

@property (nonatomic, copy) NSString *idStr;

/// Model
@property (nonatomic, strong) NewDetailsModel *model;

@end

@implementation NewDetailsPresenter

/// 初始化View
- (instancetype)initWithID:(NSString *)idStr {
    self = [super init];
    if (self) {
        self.idStr = idStr;
        self.model = [[NewDetailsModel alloc] init];
        self.model.delegate = self;
    }
    return self;
}

#pragma mark - Method

- (void)fetchNewsDetailsModel {
    [self.model fetchNewDetails:self.idStr];
}

#pragma mark - NewDetailsModelDelegate

- (void)didReceiveNewsDetail:(DetailModel *)model {
    NSString *webViewURL = model.url;
    [self.view loadWebViewWithURL:webViewURL];
}

@end
