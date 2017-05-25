//
//  CLShareObject.m
//  pet
//
//  Created by chilim on 2017/5/19.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLShareObject.h"

@implementation CLShareObject

+(instancetype) shared{
    static CLShareObject *sharedObj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedObj = [[CLShareObject alloc] init];
    });
    return sharedObj;
}

- (CLUser *)loginUser{
    CLUser *user = [CLUser userWithName:@"桃儿" userPhoto:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495546208563&di=9d1f1d9860affcc136f856f8b949ae1d&imgtype=0&src=http%3A%2F%2Fscimg.jb51.net%2Ftouxiang%2F201705%2F20170504215356105.jpg" userId:@"桃儿"];
    user.nickName = @"2172058";
    return user;
}

///文字高度
- (CGFloat )getStringSize:(NSString *)string placeHolde:(CGSize)size withFont:(CGFloat)font{
    CGSize titleMaxSize = CGSizeMake(size.width,MAXFLOAT);
    CGRect titleSize = [string boundingRectWithSize:titleMaxSize
                                            options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                         attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}
                                            context:nil];
    return titleSize.size.height <= size.height ? size.height : titleSize.size.height;
}


@end
