//
//  CLUser.m
//  pet
//
//  Created by chilim on 2017/5/19.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLUser.h"

@implementation CLUser

- (NSString *)userName{
    if (_userName) {
        return _userName;
    }
    return @"旺财";
}

- (NSString *)userId{
    if (_userId) {
        return _userId;
    }
    return @"旺财";
}
- (NSString *)userPhoto{
    if (_userPhoto) {
        return _userPhoto;
    }
    return @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495809266&di=459e590877736fc900c3284bd25e73bc&imgtype=jpg&er=1&src=http%3A%2F%2Fwww.cnxmld.com%2Ftupians%2Fbd19234244.jpg";
}

+ (CLUser *)userWithName:(NSString *)userName userPhoto:(NSString *)userPhoto userId:(NSString *)userId{
    CLUser *user = [[CLUser alloc] init];
    user.userId = userId;
    user.userName = userName;
    user.userPhoto = userPhoto;
    return user;
}


@end
