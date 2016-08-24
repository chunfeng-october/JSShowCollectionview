//
//  JSViewController.m
//  JSShowCollectionview
//
//  Created by JS on 16/8/23.
//  Copyright © 2016年 zhang.com. All rights reserved.
//

#import "JSViewController.h"
#import "JSCollectionView.h"
#import "JSViewManager.h"

@interface JSViewController ()
@property (nonatomic,strong)JSCollectionView *JSColleView;

@property (nonatomic,strong)JSViewManager *JSManager;


@end

@implementation JSViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.JSColleView=[JSCollectionView JSManagementCollectionView];
    //    [self.view addSubview:self.JSColleView];
    //    self.view.backgroundColor=[UIColor purpleColor];
    
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    NSArray *channelAyyay=@[@"要 闻",@"治 理"];
    
//    self.JSManager=[JSViewManager managerWithChannelAyyay:channelAyyay];
//    self.JSManager.frame=CGRectMake(0,64, screenW, screenH-64);
//    self.JSManager.layoutStyle=JSLayoutCenter;
//    [self.JSManager CollectionViewManager];
//    [self.view addSubview:self.JSManager];
    
    JSViewManager *JSManager=[JSViewManager managerWithChannelAyyay:channelAyyay];
    JSManager.frame=CGRectMake(0,64, screenW, screenH-64);
    JSManager.layoutStyle=JSLayoutCenter;
    [JSManager CollectionViewManager];
    [self.view addSubview:JSManager];

}


@end
