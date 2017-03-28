# DHGuidePageHUD
### 一键合成APP引导页,包含不同状态下的引导页样式,省掉冗余的代码,集成性高,使用方便;
#### 声明: 部分图片来源于网络,如有涉及版权会马上删除,敬请谅解;
### 效果图展示:
#### APP静态图片引导页(上) | APP动态图片引导页(下)
<table>
	<tr>
		<th>有导航栏手动进入体验</th>
		<th>有导航栏自动进入体验</th>
		<th>无导航栏手动进入体验</th>
		<th>无导航栏自动进入体验</th>
	</tr>
	<tr>
		<td><img src="https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DesignSketchGIF/Untitled-1.gif" width="300"></td>
		<td><img src="https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DesignSketchGIF/Untitled-2.gif" width="300"></td>
		<td><img src="https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DesignSketchGIF/Untitled-3.gif" width="300"></td>
		<td><img src="https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DesignSketchGIF/Untitled-4.gif" width="300"></td>
	</tr>
	<tr>
		<th>有导航栏手动进入体验</th>
		<th>有导航栏自动进入体验</th>
		<th>无导航栏手动进入体验</th>
		<th>无导航栏自动进入体验</th>
	</tr>
	<tr>
		<td><img src="https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DesignSketchGIF/Untitled-6.gif" width="300"></td>
		<td><img src="https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DesignSketchGIF/Untitled-7.gif" width="300"></td>
		<td><img src="https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DesignSketchGIF/Untitled-8.gif" width="300"></td>
		<td><img src="https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DesignSketchGIF/Untitled-9.gif" width="300"></td>
	</tr>	
</table>

## V3.0.0版(添加视频引导页)
### 新增方法说明:
```objc
/**
 *  DHGuidePageHUD(视频引导页)
 *
 *  @param frame    位置大小
 *  @param videoURL 引导页视频地址
 *
 *  @return DHGuidePageHUD对象
 */
- (instancetype)dh_initWithFrame:(CGRect)frame videoURL:(NSURL *)videoURL;
```

### 使用方式:
#### 1.下载项目或者下载项目中DHGuidePageHUD这个文件,将下载好的文件拖拽到自己的工程文件夹中,并在自己添加APP引导页的类中导入#import "DHGuidePageHUD.h"头文件;

#### 2.初始化图片数组和DHGuidePageHUD库的使用,代码如下:
```objc
// 初始化视频URL
NSURL *videoURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"guideMovie1" ofType:@"mov"]];
// 创建并添加引导页
DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.bounds videoURL:videoURL];
[self.navigationController.view addSubview:guidePage];
```
## V2.1.0版
### 新增方法说明:
```objc
// 设置再次滑动进入APP (注意只有在buttonIsHidden:为YES的时候才有效, 因为为NO是用户可以直接点击按钮进入APP, 增强用户体验)
guidePage.slideInto = YES;
```
#### 一点点小的改动效果图就不上了,详细可以看代码;

## V2.0.0版(添加动态图片引导页)
### 方法说明:
```objc
/**
 *  DHGuidePageHUD
 *
 *  @param frame      位置大小
 *  @param imageArray 引导页图片数组(NSString)
 *  @param isHidden   开始体验按钮是否隐藏(YES:隐藏-引导页完成自动进入APP首页; NO:不隐藏-引导页完成点击开始体验按钮进入APP主页)
 *
 *  @return DHGuidePageHUD对象
 */
- (instancetype)dh_initWithFrame:(CGRect)frame imageNameArray:(NSArray<NSString *> *)imageNameArray buttonIsHidden:(BOOL)isHidden;
```

### 使用方式:
#### 1.下载项目或者下载项目中DHGuidePageHUD这个文件,将下载好的文件拖拽到自己的工程文件夹中,并在自己添加APP引导页的类中导入#import "DHGuidePageHUD.h"头文件;

#### 2.初始化图片数组和DHGuidePageHUD库的使用,代码如下:
```objc
// 静态引导图片数组初始化
NSArray *imageNameArray = @[@"guideImage1.jpg",@"guideImage2.jpg",@"guideImage3.jpg",@"guideImage4.jpg",@"guideImage5.jpg"];
// 动态引导图片数组初始化
NSArray *imageNameArray = @[@"guideImage6.gif",@"guideImage7.gif",@"guideImage8.gif"];
// 创建并添加引导页
DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.frame imageNameArray:imageNameArray buttonIsHidden:YES];
[self.navigationController.view addSubview:guidePage];
```

#### 3.如果在首次进入项目时没有UINavigationController,也可以在[self.window makeKeyAndVisible]之后添加初始化图片数组和DHGuidePageHUD库的操作,代码如下:
```objc
// 在window初始化并显示后([self.window makeKeyAndVisible]后)初始化图片数组并添加引导页;
// 静态引导图片数组初始化
NSArray *imageNameArray = @[@"guideImage1.jpg",@"guideImage2.jpg",@"guideImage3.jpg",@"guideImage4.jpg",@"guideImage5.jpg"];
// 动态引导图片数组初始化
NSArray *imageNameArray = @[@"guideImage6.gif",@"guideImage7.gif",@"guideImage8.gif"];
// 创建并添加引导页
DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.window.frame imageNameArray:imageNameArray buttonIsHidden:YES];
[self.window addSubview:guidePage];
```

## V1.0.0版(添加静态图片引导页)
### 方法说明:
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

### 使用方式:
#### 1.下载项目或者下载项目中DHGuidePageHUD这个文件,将下载好的文件拖拽到自己的工程文件夹中,并在自己添加APP引导页的类中导入#import "DHGuidePageHUD.h"头文件;

#### 2.初始化图片数组和DHGuidePageHUD库的使用,代码如下:
```objc
// 初始化图片数组
NSArray *imageArray = @[[UIImage imageNamed:@"guideImage1.jpg"],[UIImage imageNamed:@"guideImage2.jpg"],[UIImage imageNamed:@"guideImage3.jpg"],[UIImage imageNamed:@"guideImage4.jpg"],[UIImage imageNamed:@"guideImage5.jpg"]];
// 创建并添加引导页
DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.frame imageArray:imageArray buttonIsHidden:YES];
[self.navigationController.view addSubview:guidePage];
```

#### 3.如果在首次进入项目时没有UINavigationController,也可以在[self.window makeKeyAndVisible]之后添加初始化图片数组和DHGuidePageHUD库的操作,代码如下:
```objc
// 在window初始化并显示后([self.window makeKeyAndVisible]后)初始化图片数组并添加引导页;
NSArray *imageArray = @[[UIImage imageNamed:@"guideImage1.jpg"],[UIImage imageNamed:@"guideImage2.jpg"],[UIImage imageNamed:@"guideImage3.jpg"],[UIImage imageNamed:@"guideImage4.jpg"],[UIImage imageNamed:@"guideImage5.jpg"]];
DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.window.frame imageArray:imageArray buttonIsHidden:YES];
[self.window addSubview:guidePage];
```

### 可能会用到的代码说明:
```objc
// 使用NSUserDefaults判断程序是否第一次启动(其他方法也可以)
if (![[NSUserDefaults standardUserDefaults] boolForKey:BOOLFORKEY]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:BOOLFORKEY];
        // 在这里写初始化图片数组和DHGuidePageHUD库引导页的代码
}
```
## <<分享是一种美德,Star是一种鼓励![image](https://github.com/dingding3w/DHGuidePageHUD/blob/master/DHGuidePageHUD/DHGuidePageHUDExample/DHGuidePageHUDExampleUITests/Untitled-star/Untitled-star.png)>>