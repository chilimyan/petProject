//
//  CLMallTopItemView.h
//  pet
//
//  Created by Apple on 2017/6/2.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CLMallTopItemDelegate <NSObject>

- (void)mallTopItemDidSelect:(NSInteger)index;

@end

@interface CLMallTopItemView : UIView

@property (nonatomic, weak) id <CLMallTopItemDelegate> delegate;

@end
