//
//  CLLoginTableCell.h
//  pet
//
//  Created by Apple on 2017/6/2.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLLoginTableCell : UITableViewCell

- (void)setupViews;

- (void)setupConstraints;

@end

@interface CLConturyTableCell : CLLoginTableCell

@end

@interface CLUserNameTableCell : CLLoginTableCell

@end

@interface CLPasswordTableCell : CLLoginTableCell

@end
