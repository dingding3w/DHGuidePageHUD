//
//  DHGifImageOperation.m
//  DHGuidePageHUDExample
//
//  Created by Apple on 16/10/10.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import "DHGifImageOperation.h"
#import <ImageIO/ImageIO.h>
#import <QuartzCore/QuartzCore.h>

@interface DHGifImageOperation ()
{
    CGImageSourceRef gif;
    NSDictionary *gifProperties;
    size_t index;
    size_t count;
    NSTimer *timer;
}
@end

@implementation DHGifImageOperation
#pragma mark - 通过图片Data数据第一个字节来获取图片扩展名
+ (NSString *)dh_contentTypeForImageData:(NSData *)data {
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"jpeg";
        case 0x89:
            return @"png";
        case 0x47:
            return @"gif";
        case 0x49:
        case 0x4D:
            return @"tiff";
        case 0x52:
            if ([data length] < 12) {
                return nil;
            }
            NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                return @"webp";
            }
            return nil;
    }
    return nil;
}

#pragma mark - 通过图片字符串的截取来获取图片的扩展名
+ (NSString *)dh_contentTypeForImageURL:(NSString *)url {
    NSString *extensionName = url.pathExtension;
    if ([extensionName.lowercaseString isEqualToString:@"jpeg"]) {
        return @"jpeg";
    }
    if ([extensionName.lowercaseString isEqualToString:@"gif"]) {
        return @"gif";
    }
    if ([extensionName.lowercaseString isEqualToString:@"png"]) {
        return @"png";
    }
    return nil;
}

#pragma mark - 自定义播放Gif图片(Path)
- (id)initWithFrame:(CGRect)frame gifImagePath:(NSString *)gifImagePath {
    self = [super initWithFrame:frame];
    if (self) {
        gifProperties = [NSDictionary dictionaryWithObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount] forKey:(NSString *)kCGImagePropertyGIFDictionary];
        gif = CGImageSourceCreateWithURL((CFURLRef)[NSURL fileURLWithPath:gifImagePath], (CFDictionaryRef)gifProperties);
        count =CGImageSourceGetCount(gif);
        timer = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(play) userInfo:nil repeats:YES];/**< 0.12->0.06 */
        [timer fire];
    }
    return self;
}

#pragma mark - 自定义播放Gif图片(Data)(本地+网络)
- (id)initWithFrame:(CGRect)frame gifImageData:(NSData *)gifImageData {
    self = [super initWithFrame:frame];
    if (self) {
        gifProperties = [NSDictionary dictionaryWithObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount] forKey:(NSString *)kCGImagePropertyGIFDictionary];
        gif = CGImageSourceCreateWithData((CFDataRef)gifImageData, (CFDictionaryRef)gifProperties);
        count =CGImageSourceGetCount(gif);
        timer = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(play) userInfo:nil repeats:YES];/**< 0.12->0.06 */
        [timer fire];
    }
    return self;
}

- (void)play {
    if (count > 0) {
        index ++;
        index = index%count;
        CGImageRef ref = CGImageSourceCreateImageAtIndex(gif, index, (CFDictionaryRef)gifProperties);
        self.layer.contents = (__bridge id)ref;
        CFRelease(ref);
    } else {
        static dispatch_once_t onceToken;
        // 只执行一次
        dispatch_once(&onceToken, ^{
            NSLog(@"[DHGifImageOperation]:请检测网络或者http协议");
        });
    }
}

- (void)removeFromSuperview {
    [timer invalidate];
    timer = nil;
    [super removeFromSuperview];
}

#pragma mark - 加载本地GIF图片无需设置NSTimer(自定义播放Gif图片(Name))
/**< 使用案例: [self.XXX addSubview:[[DHGifImageOperation alloc] initWithFrame:self.adFrame gifImageName:@"XXX.gif"]]; */
- (id)initWithFrame:(CGRect)frame gifImageName:(NSString *)gifImageName {
    self = [super initWithFrame:frame];
    if (self) {
        NSString *gifImgName = [gifImageName stringByReplacingOccurrencesOfString:@".gif" withString:@""];
        NSData *gifData      = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:gifImgName ofType:@"gif"]];
        UIWebView *webView   = [[UIWebView alloc] initWithFrame:frame];
        [webView setBackgroundColor:[UIColor clearColor]];
        [webView setScalesPageToFit:YES];
        [webView.scrollView setScrollEnabled:NO];
        [webView loadData:gifData MIMEType:@"image/gif" textEncodingName:@"" baseURL:[NSURL URLWithString:@""]];
        
        UIButton *clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [clearButton setFrame:webView.frame];
        [clearButton setBackgroundColor:[UIColor clearColor]];
        [clearButton addTarget:self action:@selector(activiTap:) forControlEvents:UIControlEventTouchUpInside];
        [webView addSubview:clearButton];
        [self addSubview:webView];
    }
    return self;
}

- (void)activiTap:(UITapGestureRecognizer*)recognizer{
    NSLog(@"[DHGifImageOperation.h]:activiTap:recognizer");
}
@end
