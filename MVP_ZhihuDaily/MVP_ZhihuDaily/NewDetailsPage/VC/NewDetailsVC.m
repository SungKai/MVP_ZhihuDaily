//
//  NewDetailsVC.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/9.
//

#import "NewDetailsVC.h"

@interface NewDetailsVC () <
    NewDetailsVCProtocol,
    WKNavigationDelegate
>

/// Presenter
@property (nonatomic, strong) NewDetailsPresenter *presenter;

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation NewDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.presenter fetchNewsDetailsModel];
}

- (instancetype)initWithPresenter:(NewDetailsPresenter *)presenter {
    self = [super init];
    if (self) {
        self.presenter = presenter;
        self.presenter.view = self;
    }
    return self;
}

#pragma mark - NewDetailsVCProtocol

- (void)loadWebViewWithURL:(NSString *)url {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.webView = [[WKWebView alloc] init];
        self.webView.frame = CGRectMake(0, STATUS_HEIGHT, DEVICESCREENWIDTH, DEVICESCREENHEIGHT - STATUS_HEIGHT);
        self.webView.navigationDelegate = self;
        [self.view addSubview:self.webView];
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
        self.webView.hidden = YES;
    });
}

#pragma mark - <WKNavigationDelegate>

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    // 屏蔽最顶部打开知乎日报和最底部进入知乎（去除页面”广告“元素）
    [webView evaluateJavaScript:@"document.getElementsByClassName('Daily')[0].remove();document.getElementsByClassName('    view-more')[0].remove();" completionHandler:nil];
// 移除控件有一个动画，会出现一闪而过的移除的动画，体验不太好。可以在WKWebView加载内容之前先进行隐藏，然后在block中显示，并且显示的时候要做一个延时
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(50/*延迟执行时间*/*NSEC_PER_MSEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        self.webView.hidden = NO;//展示页面
    });
// PS： 时间对于单位换算
// NSEC_PER_SEC 1000000000ull     多少纳秒 = 1秒         1秒 = 10亿纳秒
// NSEC_PER_MSEC 1000000ull       多少纳秒 = 1毫秒       1毫秒 = 100万纳秒
// USEC_PER_SEC 1000000ull        多少微秒 = 1秒         1秒 = 100万微秒
// NSEC_PER_USEC 1000ull          多少纳秒 = 1微秒       1微秒 = 1000 纳秒
}


@end
