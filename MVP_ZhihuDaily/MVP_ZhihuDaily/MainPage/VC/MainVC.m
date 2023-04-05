//
//  MainVC.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/3.
//

#import "MainVC.h"

@interface MainVC () <
    MainProtocol
>

/// Presenter
@property (nonatomic, strong) MainPresenter *presenter;

/// 新闻列表
@property (nonatomic, strong) MainTableView *tableView;

/// banner新闻数据
@property (nonatomic, copy) NSArray *bannerNewsList;

/// 列表新闻数据
@property (nonatomic, strong) NSMutableArray *newsList;

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bannerNewsList = [NSArray array];
    self.newsList = [NSMutableArray array];
    // 请求最新信息
    [self.presenter fetchLatestNewsData];
    
}

#pragma mark - Delegate



// MARK: <MainProtocol>

/// 展示最新新闻
- (void)showLatestNews:(DayModel *)latestModel {
    // 处理最新信息的展示
    NSArray *latestNewsArray = latestModel.stories;
    [self.newsList removeAllObjects];
    [self.newsList addObject:latestModel];
    
    self.bannerNewsList = latestModel.top_stories;
    // TODO: Banner reloadData
    
    [self.tableView reloadData];
}

/// 展示过往新闻
- (void)showBeforeNews:(DayModel *)beforeModel {
    // 处理过往信息的展示
    [self.newsList addObject:beforeModel];
    [self.tableView reloadData];
}

#pragma mark - Getter

- (MainPresenter *)presenter {
    if (_presenter == nil) {
        _presenter = [[MainPresenter alloc] initWithView:self];
    }
    return _presenter;
}

@end
