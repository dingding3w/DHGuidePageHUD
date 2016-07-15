# DHGuidePageHUD
###一键合成APP引导页,包含不同状态下的引导页样式,省掉冗余的代码,集成性高,使用方便;
## 效果图展示:
![image](https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DesignSketchGIF/Untitled-1.gif) ![image](https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DesignSketchGIF/Untitled-4.png) ![image](https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DesignSketchGIF/Untitled-2.gif)

## 方法说明:
```objc
/**
 *  DHGuidePageHUD
 *
 *  @param frame      位置大小
 *  @param imageArray 引导页图片数组
 *  @param isHidden   开始体验按钮是否隐藏(YES:隐藏-引导页完成自动进入APP首页; NO:不隐藏-引导页完成点击开始体验按钮进入APP主页)
 *
 *  @return DHGuidePageHUD
 */
- (instancetype)dh_initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray buttonIsHidden:(BOOL)isHidden;
```


## 使用方式:
####1.下载项目或者下载项目中DHGuidePageHUD这个文件,将下载好的文件拖拽到自己的工程文件夹中,并在自己添加APP引导页的类中导入#import "DHGuidePageHUD.h"头文件;

####2.初始化图片数组和DHGuidePageHUD库的使用,代码如下:
```objc
// 初始化图片数组
NSArray *imageArray = @[[UIImage imageNamed:@"guideImage1.jpg"],[UIImage imageNamed:@"guideImage2.jpg"],[UIImage imageNamed:@"guideImage3.jpg"],[UIImage imageNamed:@"guideImage4.jpg"],[UIImage imageNamed:@"guideImage5.jpg"]];
// 创建并添加引导页
DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.frame imageArray:imageArray buttonIsHidden:YES];
[self.navigationController.view addSubview:guidePage];
```

## 可能会用到的代码说明:
```objc
// 使用NSUserDefaults判断程序是否第一次启动(其他方法也可以)
if (![[NSUserDefaults standardUserDefaults] boolForKey:BOOLFORKEY]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:BOOLFORKEY];
        // 在这里写初始化图片数组和DHGuidePageHUD库引导页的代码
}
```
## <<分享是一种美德,Star是一种鼓励![image](https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DHGuidePageHUDExample/DHGuidePageHUDExampleUITests/Untitled-star/Untitled-star.png)>>