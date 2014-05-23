//
//  MJAboutViewController.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJAboutViewController.h"
#import "MJSettingArrowItem.h"
#import "MJSettingGroup.h"

@interface MJAboutViewController ()
//@property (nonatomic, strong) UIWebView *webView;
@end

@implementation MJAboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = CGRectZero;
    [self.view addSubview:webView];
    
    // 1.具体数据
    MJSettingItem *mark = [MJSettingArrowItem itemWithTitle:@"评分支持" destVcClass:nil];
    mark.option = ^{
        NSString *appid = @"725296055";
        NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id%@?mt=8", appid];
        NSURL *url = [NSURL URLWithString:str];
        [[UIApplication sharedApplication] openURL:url];
    };
    
    MJSettingItem *call = [MJSettingArrowItem itemWithTitle:@"客户电话" destVcClass:nil];
    call.subtitle = @"10010";
    call.option = ^{
        NSURL *url = [NSURL URLWithString:@"tel://10010"];
        [webView loadRequest:[NSURLRequest requestWithURL:url]];
    };
    
    MJSettingGroup *group = [[MJSettingGroup alloc] init];
    group.items = @[mark, call];
    [self.data addObject:group];
    
    // 2.header
    self.tableView.tableHeaderView = [UIButton buttonWithType:UIButtonTypeContactAdd];
}
@end
