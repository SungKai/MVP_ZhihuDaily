//
//  MainVC.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/3.
//

#import "MainVC.h"
#import <UIImageView+AFNetworking.h>

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
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
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
- (void)showBeforeNews:(NSArray *)beforeModel {
    // 处理过往信息的展示
    [self.newsList addObject:beforeModel];
    [self.tableView reloadData];
}

// MARK: <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.newsList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsList.count == 0 ? 0 : 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell *cell = [MainTableViewCell creatCellDefault:tableView];
    if (self.newsList.count != 0) {
        [cell setNormalBackground];
    }
    NewsData *newsData = self.newsList[indexPath.section][indexPath.row];
    cell.titleLab.text = newsData.title;
    cell.hintLab.text = newsData.hint;
    [cell.imgView setImageWithURL:[NSURL URLWithString:newsData.imageURL] placeholderImage:[UIImage imageNamed:@"defaultImage"]];
    return cell;
}

// MARK: <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    //要设置日期
    if (section == 0){
        return 0;
    }else{
        return 30;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 105;
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
