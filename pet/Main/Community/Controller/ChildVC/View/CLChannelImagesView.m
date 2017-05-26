//
//  CLChannelImagesView.m
//  pet
//
//  Created by Apple on 2017/5/26.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLChannelImagesView.h"

@interface CLChannelImagesView ()

@property (nonatomic, strong) NSArray *imageViewsArray;

@end

@implementation CLChannelImagesView

- (instancetype)init
{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    NSMutableArray *temp = [NSMutableArray new];
    
    for (int i = 0; i < 9; i++) {
        UIImageView *imageView = [UIImageView new];
        [self addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        imageView.tag = i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
        [imageView addGestureRecognizer:tap];
        [temp addObject:imageView];
    }
    self.imageViewsArray = [temp copy];
}

- (void)setPicPathStringsArray:(NSArray *)picPathStringsArray{
    _picPathStringsArray = picPathStringsArray;
    if (_picPathStringsArray.count > 0) {
        if (picPathStringsArray.count > 1) {
            __block UIImageView *lastView = nil;
            // 间距为10
            int intes = 10;
            // 每行3个
            int num = 3;
            // 循环创建view
            for (int i = 0; i < self.imageViewsArray.count; i++) {
                
                UIImageView *view = self.imageViewsArray[i];
                // 添加约束
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    // 给个高度约束
                    make.height.mas_equalTo(80);
                    
                    // 1. 判断是否存在上一个view
                    if (lastView) {
                        // 存在的话宽度与上一个宽度相同
                        make.width.equalTo(lastView);
                    } else {
                        // 否则计算宽度  ！！！此处的判断条件是为了避免 最后一列约束冲突
                        /**
                         *  这里可能大家会问 为什么上面我说最后一列会有冲突？
                         *  如果不添加判断的话会造成：
                         *  1添加了宽度约束 2所有列加了左侧约束 第3步给 最后一列添加了右侧约束
                         *  这里最后一列既有左侧约束又有右侧约束还有宽度约束 会造成约束冲突
                         *  所以这里添加宽度时将最后一列剔除
                         */
                        if (i % num != 0) {
                            make.width.mas_equalTo((view.superview.frame.size.width - (num + 1)* intes)/4);
                        }
                    }
                    // 2. 判断是否是第一列
                    if (i % num == 0) {
                        // 一：是第一列时 添加左侧与父视图左侧约束
                        make.left.mas_equalTo(view.superview).offset(intes);
                    } else {
                        // 二： 不是第一列时 添加左侧与上个view左侧约束
                        make.left.mas_equalTo(lastView.mas_right).offset(intes);
                    }
                    // 3. 判断是否是最后一列 给最后一列添加与父视图右边约束
                    if (i % num == (num - 1)) {
                        make.right.mas_equalTo(view.superview).offset(-intes);
                    }
                    // 4. 判断是否为第一列
                    if (i / num == 0) {
                        // 第一列添加顶部约束
                        make.top.mas_equalTo(view.superview).offset(intes*10);
                    } else {
                        // 其余添加顶部约束 intes*10 是我留出的距顶部高度
                        make.top.mas_equalTo(intes * 10 + ( i / num )* (80 + intes));
                    }
                    
                }];
                // 每次循环结束 此次的View为下次约束的基准
                lastView = view;
                
            }
        }else{
            UIImageView *oneImage = self.imageViewsArray[0];
            oneImage.image = [UIImage imageNamed:_picPathStringsArray[0]];
            [oneImage mas_makeConstraints:^(MASConstraintMaker *make){
                make.size.mas_equalTo(CGSizeMake(230, 230));
                make.bottom.mas_equalTo(self.mas_bottom).mas_offset(0);
                make.left.mas_equalTo(self.mas_left).mas_offset(0);
            }];
        }
    }
}

//// 创建一个空view 代表上一个view
//__block UIView *lastView = nil;
//// 间距为10
//int intes = 10;
//// 每行3个
//int num = 3;
//// 循环创建view
//for (int i = 0; i < 12; i++) {
//    
//    UIView *view = [UIView new];
//    [self.view addSubview:view];
//    view.backgroundColor = [UIColor colorWithHue:(arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5
//                                      brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:0.2];
//    
//    // 添加约束
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        // 给个高度约束
//        make.height.mas_equalTo(80);
//        
//        // 1. 判断是否存在上一个view
//        if (lastView) {
//            // 存在的话宽度与上一个宽度相同
//            make.width.equalTo(lastView);
//        } else {
//            // 否则计算宽度  ！！！此处的判断条件是为了避免 最后一列约束冲突
//            /**
//             *  这里可能大家会问 为什么上面我说最后一列会有冲突？
//             *  如果不添加判断的话会造成：
//             *  1添加了宽度约束 2所有列加了左侧约束 第3步给 最后一列添加了右侧约束
//             *  这里最后一列既有左侧约束又有右侧约束还有宽度约束 会造成约束冲突
//             *  所以这里添加宽度时将最后一列剔除
//             */
//            if (i % num != 0) {
//                make.width.mas_equalTo((view.superview.frame.size.width - (num + 1)* intes)/4);
//            }
//        }
//        // 2. 判断是否是第一列
//        if (i % num == 0) {
//            // 一：是第一列时 添加左侧与父视图左侧约束
//            make.left.mas_equalTo(view.superview).offset(intes);
//        } else {
//            // 二： 不是第一列时 添加左侧与上个view左侧约束
//            make.left.mas_equalTo(lastView.mas_right).offset(intes);
//        }
//        // 3. 判断是否是最后一列 给最后一列添加与父视图右边约束
//        if (i % num == (num - 1)) {
//            make.right.mas_equalTo(view.superview).offset(-intes);
//        }
//        // 4. 判断是否为第一列
//        if (i / num == 0) {
//            // 第一列添加顶部约束
//            make.top.mas_equalTo(view.superview).offset(intes*10);
//        } else {
//            // 其余添加顶部约束 intes*10 是我留出的距顶部高度
//            make.top.mas_equalTo(intes * 10 + ( i / num )* (80 + intes));
//        }
//        
//    }];
//    // 每次循环结束 此次的View为下次约束的基准
//    lastView = view;
//    
//}

- (void)tapImageView:(UITapGestureRecognizer *)tap{
    
}

@end
