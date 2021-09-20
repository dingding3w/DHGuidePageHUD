//
//  DHMainViewController.m
//  DHGuidePageHUDExample
//
//  Created by Apple on 16/7/14.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import "DHMainViewController.h"
#import "DHGuidePageHUD.h"

@interface DHMainViewController ()

@end

@implementation DHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the viewO(∩_∩)O.
    // 设置APP引导页
    if (![[NSUserDefaults standardUserDefaults] boolForKey:BOOLFORKEY]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:BOOLFORKEY];
        // 静态引导页
        [self setStaticGuidePage];
        
        // 动态引导页
        // [self setDynamicGuidePage];
        
        // 视频引导页
        // [self setVideoGuidePage];
    }
    
    // 设置该控制器背景图片
    UIImageView *bg_imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [bg_imageView setImage:[UIImage imageNamed:@"view_bg_image"]];
    [self.view addSubview:bg_imageView];
    
    [self setTitle:@"Come On 2018"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 设置APP静态图片引导页
- (void)setStaticGuidePage {
    NSArray *imageNameArray = @[@"guideImage1.jpg",@"guideImage2.jpg",@"guideImage3.jpg",@"guideImage4.jpg",@"guideImage5.jpg"];
    DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.frame imageNameArray:imageNameArray buttonIsHidden:NO];
    guidePage.slideInto = YES;
    [self.navigationController.view addSubview:guidePage];
}

#pragma mark - 设置APP动态图片引导页
- (void)setDynamicGuidePage {
    NSArray *imageNameArray = @[@"guideImage6.gif",@"guideImage7.gif",@"guideImage8.gif"];
    DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.frame imageNameArray:imageNameArray buttonIsHidden:YES];
    guidePage.slideInto = YES;
    [self.navigationController.view addSubview:guidePage];
}

#pragma mark - 设置APP视频引导页
- (void)setVideoGuidePage {
    NSURL *videoURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"guideMovie1" ofType:@"mov"]];
    DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.bounds videoURL:videoURL];
    [self.navigationController.view addSubview:guidePage];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
