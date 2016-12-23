//
//  CategoryAndExtension.m
//  someTools
//
//  Created by chinargb on 2016/12/23.
//  Copyright © 2016年 myself. All rights reserved.
//

#import "CategoryAndExtension.h"

@implementation UIColor(Hex)

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
    
}

@end

#define activityViewTag                 0x401
#define aViewTag                        0x402

@implementation UIView(Ex)


- (void)createActivityViewAtCenter:(UIActivityIndicatorViewStyle)style{
    
    static int size = 30;
    UIView* aView = [[UIView alloc] init];
    aView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 50/2, ([UIScreen mainScreen].bounds.size.height-113) /2 - 50/2, 50, 50);
    aView.backgroundColor = [UIColor blackColor];
    aView.layer.cornerRadius = 5;
    aView.layer.masksToBounds = YES;
    aView.tag = aViewTag;
    
    UIActivityIndicatorView* activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
    activityView.frame = CGRectMake(10, 10, size, size);
    activityView.tag = activityViewTag;
    [aView addSubview:activityView];
    
    [self addSubview:aView];
    [self bringSubviewToFront: aView];
}
- (void)showActivityViewAtCenter{
    
    UIActivityIndicatorView* activityView = [self getActivityViewAtCenter];
    if (activityView == nil) {
        [self createActivityViewAtCenter:UIActivityIndicatorViewStyleWhiteLarge];
        activityView = [self getActivityViewAtCenter];
    }
    [activityView startAnimating];
}

- (void)hideActivityViewAtCenter{
    
    UIActivityIndicatorView* activityView = [self getActivityViewAtCenter];
    if (activityView != nil){
        [activityView stopAnimating];
    }
    for (UIView *view in [self subviews]) {
        if (view != nil && view.tag == aViewTag){
            [view removeFromSuperview];
            return;
        }
    }
}

- (UIActivityIndicatorView*)getActivityViewAtCenter{
    
    for (UIView *view in [self subviews]) {
        if (view.tag == aViewTag) {
            [self bringSubviewToFront:view];
            for (UIView *inview in [view subviews]) {
                if (inview != nil && [inview isKindOfClass:[UIActivityIndicatorView class]]){
                    return (UIActivityIndicatorView*)inview;
                }
            }
        }
        
    }
    return nil;
}

@end
