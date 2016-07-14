//
//  DHGuidePageHUD.m
//  DHGuidePageHUD
//
//  Created by Apple on 16/7/14.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import "DHGuidePageHUD.h"

#define HIDDEN_TIME    3.0
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface DHGuidePageHUD ()<UIScrollViewDelegate>
@property (nonatomic, strong) NSArray       *imageArray;
@property (nonatomic, strong) UIPageControl *imagePageControl;
@end

@implementation DHGuidePageHUD

- (instancetype)dh_initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray buttonIsHidden:(BOOL)isHidden {
    if ([super initWithFrame:frame]) {
        
        if (isHidden == YES) {
            self.imageArray = imageArray;
        }
        
        // 设置引导视图的scrollview
        UIScrollView *guidePageView = [[UIScrollView alloc]initWithFrame:frame];
        [guidePageView setBackgroundColor:[UIColor lightGrayColor]];
        [guidePageView setContentSize:CGSizeMake(SCREEN_WIDTH*imageArray.count, SCREEN_HEIGHT)];
        [guidePageView setBounces:NO];
        [guidePageView setPagingEnabled:YES];
        [guidePageView setShowsHorizontalScrollIndicator:NO];
        [guidePageView setDelegate:self];
        [self addSubview:guidePageView];
        
        // 设置引导页上的跳过按钮
        UIButton *skipButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*0.8, SCREEN_WIDTH*0.1, 50, 25)];
        [skipButton setTitle:@"跳过" forState:UIControlStateNormal];
        [skipButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [skipButton setBackgroundColor:[UIColor grayColor]];
        [skipButton.layer setCornerRadius:5.0];
        [skipButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:skipButton];
        
        // 添加在引导视图上的多张引导图片
        for (int i=0; i<imageArray.count; i++) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
            imageView.image = imageArray[i];
            [guidePageView addSubview:imageView];
            
            // 设置在最后一张图片上显示进入体验按钮
            if (i == imageArray.count-1 && isHidden == NO) {
                [imageView setUserInteractionEnabled:YES];
                UIButton *startButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*0.3, SCREEN_HEIGHT*0.8, SCREEN_WIDTH*0.4, SCREEN_HEIGHT*0.08)];
                [startButton setTitle:@"开始体验" forState:UIControlStateNormal];
                [startButton setTitleColor:[UIColor colorWithRed:164/255.0 green:201/255.0 blue:67/255.0 alpha:1.0] forState:UIControlStateNormal];
                [startButton.titleLabel setFont:[UIFont systemFontOfSize:21]];
                [startButton setBackgroundImage:[UIImage imageNamed:@"GuideImage.bundle/guideImage_button_backgound"] forState:UIControlStateNormal];
                [startButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
                [imageView addSubview:startButton];
            }
        }
        
        // 设置引导页上的页面控制器
        self.imagePageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*0.0, SCREEN_HEIGHT*0.9, SCREEN_WIDTH*1.0, SCREEN_HEIGHT*0.1)];
        self.imagePageControl.currentPage = 0;
        self.imagePageControl.numberOfPages = imageArray.count;
        self.imagePageControl.pageIndicatorTintColor = [UIColor grayColor];
        self.imagePageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        [self addSubview:self.imagePageControl];
        
    }
    return self;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollview {
    int page = scrollview.contentOffset.x / scrollview.frame.size.width;
    [self.imagePageControl setCurrentPage:page];
    if (self.imageArray && page == self.imageArray.count-1) {
        [self buttonClick:nil];
    }
}

- (void)buttonClick:(UIButton *)button {
    [UIView animateWithDuration:HIDDEN_TIME animations:^{
        self.alpha = 0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(HIDDEN_TIME * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self performSelector:@selector(removeGuidePageHUD) withObject:nil afterDelay:1];
        });
    }];
}

- (void)removeGuidePageHUD {
    [self removeFromSuperview];
}

@end
