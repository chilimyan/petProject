//
//  CLUser.h
//  pet
//
//  Created by chilim on 2017/5/19.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLUser : NSObject

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *userPhoto;
@property (nonatomic, copy) NSString *userId;

+ (CLUser *)userWithName:(NSString *)userName userPhoto:(NSString *)userPhoto userId:(NSString *)userId;

@end
