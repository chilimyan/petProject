//
//  CLIntroductionBaseVC.h
//  pet
//
//  Created by chilim on 2017/5/20.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DidSelectedEnter)();

@interface CLIntroductionBaseVC : UIViewController

@property (nonatomic, strong) UIScrollView *pagingScrollView;
@property (nonatomic, strong) UIButton *enterButton;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, copy) DidSelectedEnter didSelectedEnter;

/**
 @[@"image1", @"image2"]
 */
@property (nonatomic, strong) NSArray *backgroundImageNames;

/**
 @[@"coverImage1", @"coverImage2"]
 */
@property (nonatomic, strong) NSArray *coverImageNames;

- (id)initWithCoverImageNames:(NSArray*)coverNames;

- (id)initWithCoverImageNames:(NSArray*)coverNames backgroundImageNames:(NSArray*)bgNames;

- (id)initWithCoverImageNames:(NSArray*)coverNames backgroundImageNames:(NSArray*)bgNames button:(UIButton*)button;

@end
