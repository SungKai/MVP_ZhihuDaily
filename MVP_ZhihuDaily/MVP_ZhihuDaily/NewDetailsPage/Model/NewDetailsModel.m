//
//  NewDetailsModel.m
//  MVP_ZhihuDaily
//
//  Created by 宋开开 on 2023/4/10.
//

#import "NewDetailsModel.h"

@implementation NewDetailsModel


- (void)fetchNewDetails:(NSString *)idStr {
    [self getNewsDetailsWithID:idStr Model:^(DetailModel * _Nonnull model) {
        [self.delegate didReceiveNewsDetail:model];
    }];
    
}

- (void)getNewsDetailsWithID:(NSString *)idStr Model:(void (^)(DetailModel * _Nonnull))model {
    NSString *url = [NSString stringWithFormat:ArticleNew, idStr];
    [[NetworkManager shareManager]
     requestURL:url
     type:NetworkManagerRequestTypeGet
     parameters:nil
     progress:nil
     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        DetailModel *newsModel = [[DetailModel alloc] initWithDic:responseObject];
        if (model) {
            model(newsModel);
        }
    }
     failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                
    }];
}

@end
