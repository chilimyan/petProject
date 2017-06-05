//
//  AipOcrService.m
//  pet
//
//  Created by Apple on 2017/6/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "AipOcrService.h"

#import "AipBase/AipOcrManager.h"

@implementation AipOcrService {
    
    AipOcrManager *_aipOcrManager;
    
}

- (instancetype)init {
    if (self = [super init]) {
        self.retry = NO;
    }
    return self;
}

- (void)authWithAK:(NSString *)ak andSK:(NSString *)sk {
    _aipOcrManager = [[AipOcrManager alloc] initWithAK:ak andSK:sk];
}

- (void)authWithLicenseFileData:(NSData *)licenseFileContent {
    _aipOcrManager = [[AipOcrManager alloc] initWithLicenseFileData:licenseFileContent];
}

- (void)authWithToken:(NSString *)token {
    _aipOcrManager = [[AipOcrManager alloc] initWithToken:token];
}

- (void)detectTextFromImage:(UIImage *)image
                withOptions:(NSDictionary *)options
             successHandler:(void (^)(id result))successHandler
                failHandler:(void (^)(NSError *err))failHandler {
    [_aipOcrManager detectTextFromImage:image withOptions:options successHandler:successHandler failHandler:^(NSError *error){
        if(self.retry){
            [_aipOcrManager detectTextFromImage:image withOptions:options successHandler:successHandler failHandler:failHandler];
        }else{
            if (failHandler) failHandler(error);
        }
    }];
}

- (void)detectTextBasicFromImage:(UIImage *)image
                     withOptions:(NSDictionary *)options
                  successHandler:(void (^)(id result))successHandler
                     failHandler:(void (^)(NSError *err))failHandler {
    [_aipOcrManager detectTextBasicFromImage:image withOptions:options successHandler:successHandler failHandler:^(NSError *error){
        if(self.retry){
            [_aipOcrManager detectTextBasicFromImage:image withOptions:options successHandler:successHandler failHandler:failHandler];
        }else{
            if (failHandler) failHandler(error);
        }
    }];
}

- (void)detectTextEnhancedFromImage:(UIImage *)image
                        withOptions:(NSDictionary *)options
                     successHandler:(void (^)(id result))successHandler
                        failHandler:(void (^)(NSError *err))failHandler {
    [_aipOcrManager detectTextEnhancedFromImage:image withOptions:options successHandler:successHandler failHandler:^(NSError *error){
        if(self.retry){
            [_aipOcrManager detectTextEnhancedFromImage:image withOptions:options successHandler:successHandler failHandler:failHandler];
        }else{
            if (failHandler) failHandler(error);
        }
    }];
}

- (void)detectBankCardFromImage:(UIImage *)image
                 successHandler:(void (^)(id result))successHandler
                    failHandler:(void (^)(NSError *err))failHandler {
    [_aipOcrManager detectBankCardFromImage:image successHandler:successHandler failHandler:^(NSError *error){
        if(self.retry){
            [_aipOcrManager detectBankCardFromImage:image successHandler:successHandler failHandler:failHandler];
        }else{
            if (failHandler) failHandler(error);
        }
    }];
}

- (void)detectIdCardFromImage:(UIImage *)image
                  withOptions:(NSDictionary *)options
               successHandler:(void (^)(id result))successHandler
                  failHandler:(void (^)(NSError *err))failHandler {
    
    [_aipOcrManager detectIdCardFromImage:image withOptions:options successHandler:successHandler failHandler:^(NSError *error){
        if(self.retry){
            [_aipOcrManager detectIdCardFromImage:image withOptions:options successHandler:successHandler failHandler:failHandler];
        }else{
            if (failHandler) failHandler(error);
        }
    }];
}


- (void)detectIdCardFrontFromImage:(UIImage *)image
                       withOptions:(NSDictionary *)options
                    successHandler:(void (^)(id result))successHandler
                       failHandler:(void (^)(NSError *err))failHandler {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:options];
    dictionary[@"id_card_side"] = @"front";
    [self detectIdCardFromImage:image withOptions:dictionary successHandler:successHandler failHandler:failHandler];
}

- (void)detectIdCardBackFromImage:(UIImage *)image
                      withOptions:(NSDictionary *)options
                   successHandler:(void (^)(id result))successHandler
                      failHandler:(void (^)(NSError *err))failHandler {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:options];
    dictionary[@"id_card_side"] = @"back";
    [self detectIdCardFromImage:image withOptions:dictionary successHandler:successHandler failHandler:failHandler];
}


- (void)detectWebImageFromImage:(UIImage *)image
                    withOptions:(NSDictionary *)options
                 successHandler:(void (^)(id result))successHandler
                    failHandler:(void (^)(NSError *err))failHandler {
    [_aipOcrManager detectWebImageFromImage:image withOptions:options successHandler:successHandler failHandler:^(NSError *error){
        if(self.retry){
            [_aipOcrManager detectWebImageFromImage:image withOptions:options successHandler:successHandler failHandler:failHandler];
        }else{
            if (failHandler) failHandler(error);
        }
    }];
}

- (void)clearCache {
    [_aipOcrManager clearCache];
}

+ (instancetype)shardService {
    static AipOcrService *sharedService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedService = [[self alloc] init];
    });
    return sharedService;
}

@end
