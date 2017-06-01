//
//  CLPetColor.h
//  pet
//
//  Created by chilim on 2017/5/19.
//  Copyright © 2017年 chilim. All rights reserved.
//
#import <UIColor+Hex.h>
#ifndef CLPetColor_h
#define CLPetColor_h

//项目中所用到的颜色色值

/**
 
 @return 底部Tab选中
 */
#define COLOR_TAB_SEL [UIColor colorWithCSS:@"#4b25d8"]
/**
 
 @return 底部Tab背景
 */
#define COLOR_TAB_BACK [UIColor colorWithCSS:@"#ffffff"]
/**
 
 @return 底部Tab未选中
 */
#define COLOR_TAB_DESEL [UIColor colorWithCSS:@"#9393fb"]
/**
 
 @return 名字
 */
#define COLOR_NAME [UIColor colorWithCSS:@"#6e94bd"]
/**
 
 @return 灰色
 */
#define COLOR_GRAY [UIColor colorWithCSS:@"#a8a8a8"]
/**
 
 @return 浅黑色
 */
#define COLOR_BLACK_LIGHT [UIColor colorWithCSS:@"#515151"]
/**
 
 @return 黑色
 */
#define COLOR_BLACK [UIColor colorWithCSS:@"#2f2f2f"]
/**
 
 @return 浅黑色
 */
#define COLOR_LIGHT_BLACK [UIColor colorWithCSS:@"#4c4c4c"]
/**
 
 @return 按钮
 */
#define COLOR_BTN [UIColor colorWithCSS:@"#6460fc"]

/**
 
 @return 灰色背景
 */
#define COLOR_BACK_GRAY [UIColor colorWithCSS:@"#f4f4f4"]

/**
 
 @return 分割线灰色
 */
#define COLOR_SEPLINE_GRAY [UIColor colorWithCSS:@"#f3f3f3"]
/**
 
 @return 蓝色
 */
#define COLOR_BLUE [UIColor colorWithHex:0x3399ff]
/**
 
 @return 红色
 */
#define COLOR_RED [UIColor colorWithHex:0xff5857]
/**
 
 @return 绿色
 */
#define COLOR_GREEN [UIColor colorWithHex:0x02c579]
/**
 
 @return 黄色
 */
#define COLOR_YELLOR [UIColor colorWithHex:0xffbd0d]
/**
 底部Tabbar背景色
 @return 浅灰色
 */
#define COLOR_LIGHTGRAY_TAB [UIColor colorWithHex:0xf1f4f8]

/**
 
 @return 灰色
 */
#define COLOR_LIGHT [UIColor colorWithHex:0xe6e6e6]
/**
 
 @return 灰色
 */
#define COLOR_LIGHTBLACK [UIColor colorWithHex:0x707070]


// 颜色

#define HM_COLOR(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define HM_COLOR_RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

// 随机色

#define HM_RANDOM_COLOR HM_COLOR(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define TABLE_SEPATOR_COLOR [UIColor colorWithCSS:@"#f3f3f3"];

#endif /* CLPetColor_h */
