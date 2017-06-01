//
//  CLServiceModel.h
//  pet
//
//  Created by Apple on 2017/5/25.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FosterCareModel : NSObject

@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *money;
@property (nonatomic, copy) NSString *scoreCount;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *distance;

@end

@interface CLDoctor : NSObject

@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *postName;

@end

@interface CLServiceModel : NSObject

@end
