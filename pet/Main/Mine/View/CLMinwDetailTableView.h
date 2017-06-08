//
//  CLMinwDetailTableView.h
//  pet
//
//  Created by Apple on 2017/6/6.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CLMeTableDelegate <NSObject>

-(void)meTableDidScroll:(UIScrollView *)scrollView;

@end

@interface CLMinwDetailTableView : UITableView

@property (nonatomic, weak) id <CLMeTableDelegate> scrollDelegate;

@end
