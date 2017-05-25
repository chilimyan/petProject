//
//  CLShareObject.h
//  pet
//
//  Created by chilim on 2017/5/19.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLShareObject : NSObject

@property(nonatomic, strong) CLUser *loginUser;

+(instancetype) shared;

@end
