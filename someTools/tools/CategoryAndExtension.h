//
//  CategoryAndExtension.h
//  someTools
//
//  Created by chinargb on 2016/12/23.
//  Copyright © 2016年 myself. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define RGBA_COLOR(R,G,B,A) [UIColor colorWithRed:((R)/255.0f) green:((G)/255.0f) blue:((B)/255.0f) alpha:A]
#define RGB_COLOR(R,G,B)   [UIColor colorWithRed:((R)/255.0f) green:((G)/255.0f) blue:((B)/255.0f) alpha:1.0f]


///UIColor 类别
@interface UIColor(Hex)

/*利用16进制的表示生成颜色
 * 如：白色输入参数#FFFFFF或者FFFFFF
 *颜色转换小工具：http://rgb.pin5i.com
 */
+(UIColor *)colorWithHexString:(NSString *)color;
+(UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

///UIView 类别
@interface UIView(Ex)

/*
 *  网络请求等待时在屏幕的中心绘制小菊花
 */
- (void)showActivityViewAtCenter;
- (void)hideActivityViewAtCenter;
- (void)createActivityViewAtCenter:(UIActivityIndicatorViewStyle)style;

@end
