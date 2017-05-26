//
//  CLChildCommunityViewModel.m
//  pet
//
//  Created by chilim on 2017/5/20.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLChildCommunityViewModel.h"
#import "CLCommunityModel.h"

@implementation CLChildCommunityViewModel

- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)getSelectVCScrollImages:(void (^)())finished{
    self.scrollImages = [NSMutableArray arrayWithArray:@[@"Banner.png",@"Banner02.png",@"Banner03.png"]];
    if (finished) {
        finished();
    }
}

- (void)getSelectDataList:(void (^)())finished{
    
    self.selectList = [NSMutableArray arrayWithArray:[self getSelectData]];
    if (finished) {
        finished();
    }
}

- (void)getDynamicDataList:(void (^)())finished{
    
    self.dynamicList = [NSMutableArray arrayWithArray:[self getDynamicData]];
    if (finished) {
        finished();
    }
}

- (void)getChannelDataList:(void (^)())finished{
    self.channelList = [NSMutableArray arrayWithArray:[self getChannelDataList]];
    if (finished) {
        finished();
    }
}

- (NSMutableArray *)selectList{
    if (!_selectList) {
        _selectList = [NSMutableArray array];
    }
    return _selectList;
}

- (NSMutableArray *)dynamicList{
    if (!_dynamicList) {
        _dynamicList = [NSMutableArray array];
    }
    return _dynamicList;
}

- (NSMutableArray *)scrollImages{
    if (!_scrollImages) {
        _scrollImages = [NSMutableArray array];
    }
    return _scrollImages;
}


- (NSMutableArray *)getChannelDataList{
     NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    CLChannelModel *channel = [[CLChannelModel alloc] init];
    channel.createName = @"爱你永不变";
    channel.createPhoto = @"http://img2.imgtn.bdimg.com/it/u=4049571369,2234374785&fm=11&gp=0.jpg";
    channel.imageUrls = @[@"32309AE9E06B00C1E40984FEF07C3C13.jpg"];
    channel.content = @"有很多人问我美女养这么大狗 你不害怕吗，我想这是你们对大型犬的一种误解，在我眼里它还是个孩子";
    channel.themeContent = @"#求关注#";
    channel.likesNum = @"6";
    channel.commentNum = @"2";
    
    CLChannelModel *channel1 = [[CLChannelModel alloc] init];
    channel1.createName = @"旺仔牛奶不是奶";
    channel1.createPhoto = @"http://img3.imgtn.bdimg.com/it/u=513745235,939838858&fm=23&gp=0.jpg";
    channel1.imageUrls = @[@"A2B2A36A846BF4065FAF03DEBA993422.jpg",@"6376BD7F91770FFE2EF9AAB3C32FBD9B.jpg",@"E6211B634112B60F1AD9FEC391D1D96A.jpg",@"E91BB40B71793FFCC5783428F562E564.jpg",@"8AFFFC0723FC0D56726926B5E04C1385.jpg",@"91467F5AD88F7DA0B5636164CCF23A06.jpg",@"70C97AE030710503B15AA9694993F4DF.jpg",@"BEEA1D51C3610CAFFE3D9FB86FF19D0C.jpg",@"435086D44A0211F394F07558DF61C302.jpg"];
    channel1.content = @"端午节快乐！";
    channel1.themeContent = @"#情有独“粽”#";
    channel1.likesNum = @"24";
    channel1.commentNum = @"10";
    
    CLChannelModel *channel2 = [[CLChannelModel alloc] init];
    channel2.createName = @"子小文";
    channel2.createPhoto = @"http://img5.imgtn.bdimg.com/it/u=2061799849,1241098384&fm=23&gp=0.jpg";
    channel2.imageUrls = @[@"78A7C90463B435BCC07F06AC5B210D55.jpg"];
    channel2.content = @"今晚用喷壶教训了他吃纸，结果小家伙还是抱着喷壶睡着了，不记仇哇！";
    channel2.themeContent = @"#他的奇葩睡姿#";
    channel2.likesNum = @"17";
    channel2.commentNum = @"6";
    
    CLChannelModel *channel3 = [[CLChannelModel alloc] init];
    channel3.createName = @"徐小胖";
    channel3.createPhoto = @"http://imgtu.5011.net/uploads/content/20170406/5799851491450978.jpg";
    channel3.imageUrls = @[@"DA29B5D0C19AC558D7FDC5076E474BD8.jpg",@"E5DA662A3D3D4FA222092A0AD6933538.jpg",@"F2A70F9E9D4FBD499D932346A221D318.jpg",@"89F01C3E1C3DC463F9B2073CDDCFDE31.jpg"];
    channel3.content = @"朋友的🐱秀，养的太好啦！，再看看我的，叫我情何以堪。。";
    channel3.themeContent = @"";
    channel3.likesNum = @"4";
    channel3.commentNum = @"3";
    
    [tempArray addObject:channel];
    [tempArray addObject:channel1];
    [tempArray addObject:channel2];
    [tempArray addObject:channel3];
    
    return tempArray;
}

- (NSMutableArray *)getChannelHeadList{
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    CLChannelList *list = [[CLChannelList alloc] init];
    list.headImage = @"Rectangle 4";
    list.title = @"花样铲屎官";
    list.content = @"新增46条内容";
    
    CLChannelList *list1 = [[CLChannelList alloc] init];
    list1.headImage = @"Rectangle 4 Copy";
    list1.title = @"剁手败家";
    list1.content = @"新增38条内容";
    
    CLChannelList *list2 = [[CLChannelList alloc] init];
    list2.headImage = @"Rectangle 4 Copy 2";
    list2.title = @"养宠心得";
    list2.content = @"新增66条内容";
    
    [tempArray addObject:list];
    [tempArray addObject:list1];
    [tempArray addObject:list2];
    
    return tempArray;
}

- (NSMutableArray *)getDynamicData{
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    CLDynamicModel *dynamic = [[CLDynamicModel alloc] init];
    dynamic.createName = @"子非鱼Andy";
    dynamic.content = @"出门前看到我准备带他出门。开心的转圈圈。叫上车的时候犹豫了3秒。车上一直用“你为什么要骗我的眼神看了我一路”下车的时候怎么叫都不肯下";
    dynamic.likesNum = @"12";
    dynamic.commentNum = @"3";
    dynamic.createPhoto = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495432779057&di=59897deca20bdb99a4a691580d6437a0&imgtype=0&src=http%3A%2F%2Fwww.cnxmld.com%2Ftupians%2Fbd14171151.jpg";
    dynamic.createTime = @"12分钟前";
    dynamic.imageUrls = @[@"5345651BD274DFFB326F6C016FAAF45F.jpg"];
    
    CLDynamicModel *dynamic1 = [[CLDynamicModel alloc] init];
    dynamic1.createName = @"浮水似流年";
    dynamic1.content = @"麻麻该起床啦～～～！";
    dynamic1.likesNum = @"50";
    dynamic1.commentNum = @"8";
    dynamic1.createPhoto = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495432913172&di=cd5929ff51082d474aff8c29a076a04f&imgtype=0&src=http%3A%2F%2Fwww.jf258.com%2Fuploads%2F2013-08-23%2F233100976.jpg";
    dynamic1.createTime = @"1小时前";
    dynamic1.imageUrls = @[@"5345651BD274DFFB326F6C016FAAF45F.jpg"];
    
    CLDynamicModel *dynamic2 = [[CLDynamicModel alloc] init];
    dynamic2.createName = @"我是猫";
    dynamic2.content = @"被偷拍";
    dynamic2.likesNum = @"68";
    dynamic2.commentNum = @"23";
    dynamic2.createPhoto = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495432956650&di=45237573558ae70d6682fa0184e65913&imgtype=0&src=http%3A%2F%2Fimgs.daxi123.com%2F20160108%2Fsmalld5fefddf69773bfd651174ea76234aea1452224586.png";
    dynamic2.createTime = @"一个月前";
    dynamic2.imageUrls = @[@"5345651BD274DFFB326F6C016FAAF45F.jpg"];
    
    CLDynamicModel *dynamic3 = [[CLDynamicModel alloc] init];
    dynamic3.createName = @"波比麻麻";
    dynamic3.content = @"很喜欢拍照呦～";
    dynamic3.likesNum = @"106";
    dynamic3.commentNum = @"32";
    dynamic3.createPhoto = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495432956650&di=6e0c9e6478ec9e08a72185ae66942512&imgtype=0&src=http%3A%2F%2Fwww.zhiyinmusic.cn%2Fcimg%2Fbd116270675.jpg";
    dynamic3.createTime = @"2017-2-18";
    dynamic3.imageUrls = @[@"5345651BD274DFFB326F6C016FAAF45F.jpg"];
    
    [tempArray addObject:dynamic];
    [tempArray addObject:dynamic1];
    [tempArray addObject:dynamic2];
    [tempArray addObject:dynamic3];
    
    return tempArray;
}

- (NSMutableArray *)getSelectData{
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    CLSelectModel *select = [[CLSelectModel alloc] init];
    select.createName = @"我可以抱你吗";
    select.createPhoto = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495286954336&di=c9d3118e980d0543bb66034a28417d54&imgtype=0&src=http%3A%2F%2Fscimg.jb51.net%2Fallimg%2F170330%2F2-1F3301636200-L.jpg";
    select.createAddress = @"广西 北海";
    select.content = @"美不美～～～啦啦啦";
    select.imageUrls = @[@"2B18C2D4941421681BD6B9FBCEC48C2D.jpg"];
    select.comments = [NSArray arrayWithArray:[self getComments]];
    select.likes = [NSArray arrayWithArray:[self getComments]];
    
    CLSelectModel *select1 = [[CLSelectModel alloc] init];
    select1.createName = @"杰根大人的铲S官";
    select1.createPhoto = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495427025252&di=f2093964110ab1b732803273bcbc48f3&imgtype=0&src=http%3A%2F%2Fwww.jf258.com%2Fuploads%2F2015-05-14%2F025800578.jpg";
    select1.createAddress = @"江苏 无锡";
    select1.content = @"你们开心就好..";
    select1.imageUrls = @[@"402FD6493BFE31152566135415C9F22A.jpg",@"45C272AAE3D9309128203B6D77C10BE2.jpg",@"4E35FA4B2D9C0636815C709FBD94DF5E.jpg"];
    select1.comments = [NSArray arrayWithArray:[self getComments]];
    select1.likes = [NSArray arrayWithArray:[self getComments]];
    
    CLSelectModel *select2 = [[CLSelectModel alloc] init];
    select2.createName = @"面包馒头麻麻";
    select2.createPhoto = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495427223215&di=5547d0d909067bd74dbd9f6b0bda3714&imgtype=0&src=http%3A%2F%2Fk1.jsqq.net%2Fuploads%2Fallimg%2F151123%2F5-1511230304580-L.jpg";
    select2.createAddress = @"上海 闸北区";
    select2.content = @"傻傻..";
    select2.imageUrls = @[@"5345651BD274DFFB326F6C016FAAF45F.jpg"];
    select2.comments = [NSArray arrayWithArray:[self getComments]];
    select2.likes = [NSArray arrayWithArray:[self getComments]];
    
    [tempArray addObject:select];
    [tempArray addObject:select1];
    [tempArray addObject:select2];
    return tempArray;
}

- (NSMutableArray *)getComments{
    NSMutableArray *tempArray = [NSMutableArray array];
    CLComment *comment = [[CLComment alloc] init];
    comment.createPhoto = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495286954335&di=0fd547544010e9546d54a972c2e50eb7&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201502%2F13%2F20150213205325_SVXWE.png";
    comment.createName = @"我的小旺财";
    comment.content = @"不错，养的真肥~";
    CLComment *comment1 = [[CLComment alloc] init];
    comment1.createPhoto = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495286954335&di=b6158c0e1a95b36513d875dcde10c13c&imgtype=0&src=http%3A%2F%2Fk2.jsqq.net%2Fuploads%2Fallimg%2F1704%2F7_170402204014_9.png";
    comment1.createName = @"花儿一样";
    comment1.content = @"很帅啊。。。";
    CLComment *comment2 = [[CLComment alloc] init];
    comment2.createPhoto = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495286954335&di=d32e8ec3df320720895bb613e9ef1aa2&imgtype=0&src=http%3A%2F%2Fk2.jsqq.net%2Fuploads%2Fallimg%2F1704%2F7_170402204014_4.jpg";
    comment2.createName = @"萌猫";
    comment2.content = @"666";
    CLComment *comment3 = [[CLComment alloc] init];
    comment3.createPhoto = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495286954335&di=07ed327348d269d3504f7ff4b7ae036c&imgtype=0&src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201505%2F24%2F20150524103646_JUVwm.thumb.224_0.jpeg";
    comment3.createName = @"MDZZ~";
    comment3.content = @"520溜一波";
    CLComment *comment4 = [[CLComment alloc] init];
    comment4.createPhoto = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495286954334&di=10526a457fd0f9d07a959bbdb65fba91&imgtype=0&src=http%3A%2F%2Fpic.qqtn.com%2Fup%2F2016-12%2F2016120815141966793.png";
    comment4.createName = @"风林";
    comment4.content = @"很乖的狗狗";
    CLComment *comment5 = [[CLComment alloc] init];
    comment5.createPhoto = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495289147608&di=ced8f522917e9abebe0fd76a0ef3cd5e&imgtype=jpg&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D3041017455%2C2848343583%26fm%3D214%26gp%3D0.jpg";
    comment5.createName = @"风一样的男子";
    comment5.content = @"遛狗去";
    
    [tempArray addObject:comment];
    [tempArray addObject:comment1];
    [tempArray addObject:comment2];
    [tempArray addObject:comment3];
    [tempArray addObject:comment4];
    [tempArray addObject:comment5];
    return tempArray;
}

@end
