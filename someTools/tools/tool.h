//
//  tool.h
//  someTools
//
//  Created by chinargb on 2016/12/22.
//  Copyright © 2016年 myself. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define RGBA_COLOR(R,G,B,A) [UIColor colorWithRed:((R)/255.0f) green:((G)/255.0f) blue:((B)/255.0f) alpha:A]
#define RGB_COLOR(R,G,B)   [UIColor colorWithRed:((R)/255.0f) green:((G)/255.0f) blue:((B)/255.0f) alpha:1.0f]

@interface UIColor(Hex)

+(UIColor *)colorWithHexString:(NSString *)color;
+(UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

@interface tool : NSObject

@end
