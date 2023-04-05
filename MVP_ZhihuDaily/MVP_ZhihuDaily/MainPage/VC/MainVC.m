//
//  MainVC.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/3.
//

#import "MainVC.h"

@interface MainVC () <
    MainProtocol,
    UITableViewDataSource,
    UITableViewDelegate
>

/// Presenter
@property (nonatomic, strong) MainPresenter *presenter;

/// 新闻列表
@property (nonatomic, strong) UITableView *tableView;

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
- (void)showLatestNews:(NSDictionary *)latestModel {
    [self.newsList removeAllObjects];
    [self.newsList addObject:latestModel[@"listData"]];
    self.bannerNewsList = latestModel[@"bannerData"];
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

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, STATUS_HEIGHT + 60, DEVICESCREENWIDTH, DEVICESCREENHEIGHT - (STATUS_HEIGHT + 60)) style:UITableViewStyleGrouped];
    }
    return _tableView;
}
@end
