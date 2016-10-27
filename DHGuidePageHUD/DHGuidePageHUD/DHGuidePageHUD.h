//
//  DHGuidePageHUD.h
//  DHGuidePageHUD
//
//  Created by Apple on 16/7/14.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BOOLFORKEY @"dhGuidePage"

@interface DHGuidePageHUD : UIView
/**
 *  是否支持滑动进入APP(默认为NO-不支持滑动进入APP | 只有在buttonIsHidden为YES-隐藏状态下可用; buttonIsHidden为NO-显示状态下直接点击按钮进入)
 *  新增视频引导页同样不支持滑动进入APP
 */
@property (nonatomic, assign) BOOL slideInto;
/**
 *  DHGuidePageHUD(图片引导页 | 可自动识别动态图片和静态图片)
 *
 *  @param frame      位置大小
 *  @param imageArray 引导页图片数组(NSString)
 *  @param isHidden   开始体验按钮是否隐藏(YES:隐藏-引导页完成自动进入APP首页; NO:不隐藏-引导页完成点击开始体验按钮进入APP主页)
 *
 *  @return DHGuidePageHUD对象
 */
- (instancetype)dh_initWithFrame:(CGRect)frame imageNameArray:(NSArray<NSString *> *)imageNameArray buttonIsHidden:(BOOL)isHidden;
/**
 *  DHGuidePageHUD(视频引导页)
 *
 *  @param frame    位置大小
 *  @param videoURL 引导页视频地址
 *
 *  @return DHGuidePageHUD对象
 */
- (instancetype)dh_initWithFrame:(CGRect)frame videoURL:(NSURL *)videoURL;
@end
