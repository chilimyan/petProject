//
//  CLCommunityModel.h
//  pet
//
//  Created by chilim on 2017/5/20.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import <Foundation/Foundation.h>

//精选
@interface CLSelectModel : NSObject
//发布人头像
@property (nonatomic, copy) NSString *createPhoto;
//发布人用户名
@property (nonatomic, copy) NSString *createName;
//发布人ID
@property (nonatomic, copy) NSString *createId;
//发布人地址
@property (nonatomic, copy) NSString *createAddress;
//发布的图片
@property (nonatomic, strong) NSArray *imageUrls;
//发布的内容
@property (nonatomic, copy) NSString *content;
//是否关注
@property (nonatomic, assign) BOOL isFocus;
//点赞人数
@property (nonatomic, strong) NSArray *likes;
//评论
@property (nonatomic, strong) NSArray *comments;


@end

//动态
@interface CLDynamicModel : NSObject
//发布人头像
@property (nonatomic, copy) NSString *createPhoto;
//发布人用户名
@property (nonatomic, copy) NSString *createName;
//发布人ID
@property (nonatomic, copy) NSString *createId;
//发布人地址
@property (nonatomic, copy) NSString *createAddress;
//发布时间
@property (nonatomic, copy) NSString *createTime;
//发布的图片
@property (nonatomic, strong) NSArray *imageUrls;
//发布的内容
@property (nonatomic, copy) NSString *content;
//点赞数量
@property (nonatomic, copy) NSString *likesNum;
//评论数量
@property (nonatomic, copy) NSString *commentNum;
//是否关注
@property (nonatomic, assign) BOOL isFocus;
//点赞人数
@property (nonatomic, strong) NSArray *likes;
//评论
@property (nonatomic, strong) NSArray *comments;


@end

//动态
@interface CLChannelModel : NSObject
//发布人头像
@property (nonatomic, copy) NSString *createPhoto;
//发布人用户名
@property (nonatomic, copy) NSString *createName;
//发布人ID
@property (nonatomic, copy) NSString *createId;
//发布人地址
@property (nonatomic, copy) NSString *createAddress;
//发布时间
@property (nonatomic, copy) NSString *createTime;
//发布的图片
@property (nonatomic, strong) NSArray *imageUrls;
//发布的内容
@property (nonatomic, copy) NSString *content;
//点赞数量
@property (nonatomic, copy) NSString *likesNum;
//评论数量
@property (nonatomic, copy) NSString *commentNum;
//是否关注
@property (nonatomic, assign) BOOL isFocus;
//点赞人数
@property (nonatomic, strong) NSArray *likes;
//评论
@property (nonatomic, strong) NSArray *comments;


@end

@interface CLChannelList : NSObject

@property (nonatomic, copy) NSString *headImage;
@property (nonatomic, copy) NSString *channelId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;

@end

@interface CLComment : NSObject

//发布人头像
@property (nonatomic, copy) NSString *createPhoto;
//发布人用户名
@property (nonatomic, copy) NSString *createName;
//发布人ID
@property (nonatomic, copy) NSString *createId;
//发布的内容
@property (nonatomic, copy) NSString *content;


@end

@interface CLCommunityModel : NSObject


@end
