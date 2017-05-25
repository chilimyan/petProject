//
//  CLMenuItem.h
//  pet
//
//  Created by Apple on 2017/5/25.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CLMenuItem;

@protocol CLMenuItemDelegate <NSObject>

- (void)menuItemDidClicked:(CLMenuItem *)menuItem;

@end

@interface CLMenuItem : UIView

@property (nonatomic, weak) id <CLMenuItemDelegate> delegate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong)UIImage *topImage;

- (instancetype)initWithTitle:(NSString *)title withImage:(UIImage *)image;
- (instancetype)initWithTitle:(NSString *)title withContent:(NSString *)content;

@end
