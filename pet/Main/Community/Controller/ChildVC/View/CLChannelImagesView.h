//
//  CLChannelImagesView.h
//  pet
//
//  Created by Apple on 2017/5/26.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CLConstrainType) {
    
    ImageConstrainItemWidth = 0,//图片大小固定
    ImageConstrainItemSpace //图片间距固定
};


@interface CLChannelImagesView : UIView

@property (nonatomic, strong) NSArray *picPathStringsArray;

- (instancetype)initWithConstrainType:(CLConstrainType )constrainType;

@end
