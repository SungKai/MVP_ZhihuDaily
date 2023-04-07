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
    UITableViewDelegate,
    UICollectionViewDelegate,
    UICollectionViewDataSource
>

/// Presenter
@property (nonatomic, strong) MainPresenter *presenter;

/// 顶部View
@property (nonatomic, strong) TopView *topView;

/// 新闻列表
@property (nonatomic, strong) BannerCollectionView *bannerCollectionView;

/// 新闻列表
@property (nonatomic, strong) UITableView *tableView;

/// banner新闻数据
@property (nonatomic, copy) NSArray *bannerNewsList;

/// 列表新闻数据
@property (nonatomic, strong) NSMutableArray *newsList;

/// 定时器
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.bannerNewsList = [[NSArray alloc] init];
    self.newsList = [NSMutableArray array];
    [self.view addSubview:self.topView];
    [self setTodayDateString];
    // 请求最新信息
    [self.presenter fetchLatestNewsData];
    // banner
    self.bannerCollectionView.dataSource = self;
    self.bannerCollectionView.delegate = self;
    // list
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    // 创建定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
}


#pragma mark - Method

/// 翻页
- (void)nextPage {
    // 计算下一页的位置
    NSInteger nextPage = (self.bannerCollectionView.contentOffset.x + self.bannerCollectionView.bounds.size.width) / self.bannerCollectionView.bounds.size.width;
    if (nextPage == self.bannerNewsList.count) {
        nextPage = 0;
    }
    [self.bannerCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:nextPage inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

/// 设置日期文本
- (void)setTodayDateString {
    self.topView.monthLab.text = [[NSDate today] transformChinese];
    self.topView.dayLab.text = [[NSDate today]day];
}

#pragma mark - Delegate



// MARK: <MainProtocol>

/// 展示最新新闻
- (void)showLatestNews:(NSDictionary *)latestModel {
    [self.newsList removeAllObjects];
    [self.newsList addObject:latestModel[@"listData"]];
    self.bannerNewsList = latestModel[@"bannerData"];
    // TODO: Banner reloadData
    [self.bannerCollectionView reloadData];
    [self.tableView reloadData];
}


/// 展示过往新闻
- (void)showBeforeNews:(NSArray *)beforeModel {
    // 处理过往信息的展示
    [self.newsList addObject:beforeModel];
    [self.tableView reloadData];
}

// MARK: <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.bannerNewsList.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *bannerID = @"bannerID";
    BannerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:bannerID forIndexPath:indexPath];
    BannerData *bannerData = self.bannerNewsList[indexPath.row];
    cell.titleLab.text = bannerData.title;
    cell.hintLab.text = bannerData.hint;
    [cell.imgView setImageWithURL:[NSURL URLWithString:bannerData.imageURL] placeholderImage:[UIImage imageNamed:@"defaultImage"]];
    // 图片宽高适配
    cell.imgView.clipsToBounds = YES;
    [cell.imgView setContentMode:UIViewContentModeScaleAspectFill];    
    return cell;
}

// MARK: <UICollectionViewDelegate>


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

// 每当拉到每个section的FooterView就加载Before数据
- (void)tableView:(UITableView *)tableView willDisplayFooterView:(nonnull UIView *)view forSection:(NSInteger)section {
    if (self.newsList.count == section + 1) {
        NewsData *data = self.newsList.lastObject[0];
        NSString *date = data.date;
        [self.presenter fetchBeforeNewsData:date];
    }
}

// 设置footerView
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = UIColor.whiteColor;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    //要设置日期
    if (section == 0) {
        return 0;
    } else {
        return 30;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 105;
}

// 设置DateView为TableView的headerView
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NewsData *data = self.newsList[section - 1][0];
    NSString *date = data.date;
    NSInteger month = [[date substringWithRange:NSMakeRange(4, 2)] integerValue];
    NSInteger day = [[date substringFromIndex:6] integerValue];
    DateHeaderView *dateHeaderView = [[DateHeaderView alloc] initWithDateHeaderViewWithDate:[NSString stringWithFormat:@"%ld月%ld日", month, day]];
    return dateHeaderView;
}

#pragma mark - Getter

- (MainPresenter *)presenter {
    if (_presenter == nil) {
        _presenter = [[MainPresenter alloc] initWithView:self];
    }
    return _presenter;
}

- (TopView *)topView {
    if (_topView == nil) {
        _topView = [[TopView alloc] initWithFrame:CGRectMake(0, STATUS_HEIGHT, DEVICESCREENWIDTH, 60)];
    }
    return _topView;
}

- (BannerCollectionView *)bannerCollectionView {
    if (_bannerCollectionView == nil) {
        _bannerCollectionView = [[BannerCollectionView alloc] initWithFrame:CGRectMake(0, STATUS_HEIGHT + self.topView.frame.size.height, DEVICESCREENWIDTH, DEVICESCREENWIDTH)];
        _bannerCollectionView.showsHorizontalScrollIndicator = NO;
    }
    return _bannerCollectionView;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, STATUS_HEIGHT + 60, DEVICESCREENWIDTH, DEVICESCREENHEIGHT - (STATUS_HEIGHT + 60)) style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableHeaderView = self.bannerCollectionView;
    }
    return _tableView;
}

@end
