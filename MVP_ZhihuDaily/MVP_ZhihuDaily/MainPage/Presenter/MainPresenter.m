//
//  MainPresenter.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/3.
//

#import "MainPresenter.h"

// Model
#import "NewsModel.h"

// Protocol
#import "MainProtocol.h"

@interface MainPresenter () <
    NewsModelDelegate
>

/// NewsModel
@property (nonatomic, strong) NewsModel *newsModel;

/// View
@property (nonatomic, weak) id<MainProtocol> view;

@end


@implementation MainPresenter

#pragma mark - Life cycle

/// 初始化View
- (instancetype)initWithView:(id)view {
    self = [super init];
    if (self) {
        // 绑定View
        self.view = view;
        // 绑定Model
        self.newsModel = [[NewsModel alloc] init];
        self.newsModel.delegate = self;
    }
    return self;
}

#pragma mark - Method

/// 请求最新信息
- (void)fetchLatestNewsData {
    [self.newsModel fetchLatestNews];
}

/// 请求过往列表
- (void)fetchBeforeNewsData:(NSString *)date {
    [self.newsModel fetchBeforeNewsWithDate:date];
}

#pragma mark - Delegate



// MARK: <NewsModelDelegate>

/// 请求Latest 成功的回调
- (void)didReceiveLatestNews:(DayModel *)latestDayModel {
    // 获取到的用户信息传递给View层进行展示
    [self.view showLatestNews:latestDayModel];
}

/// 请求before 成功的回调
- (void)didReceiveBeforeNews:(DayModel *)beforeDayModel {
    // 获取到的用户信息传递给View层进行展示
    [self.view showBeforeNews:beforeDayModel];
}


@end
