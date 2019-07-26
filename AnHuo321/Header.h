//
//  Header.h
//  AnHuo321
//
//  Created by 吕书涛 on 2019/3/13.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#ifndef Header_h
#define Header_h


#define KURLNSString(str) [NSString stringWithFormat:@"https://321ah.com/%@",str]
#define Base_img_url   @"https://321ah.com/Uploads/"
#define productList    @"Appapi/getProductsList"//产品列表 page rows

#define topLunBotu     @"Appapi/getBannerImage"//顶部轮播图

#define productDetails @"Appapi/getProductsDetails"//商品详情 pid

#define morePrice      @"Appapi/getMoreRecord"//更多出价 pid

#define lookPingJia    @"Appapi/viewComments"//查看评价 pid  123

#define search         @"Appapi/search"//搜索 keywords

#define guanzhu        @"Appapi/setAttention"//物品关注、取消  pid result=2关注成功 =3取消成功
#define sendCode        @"Appapi/sendCode"//发送验证码
#define checkCode        @"Appapi/checkCode"//确认验证(邮箱和手机号)
#define gzJiaoYiList   @"Appapi/getAttention"//我关注的交易列表 page rows
#define YiBaoJia   @"index.php?s=/Memberapi/mybid" //已报价
#define MineFaBu   @"index.php?s=/Memberapi/auctionList" //已g发布
#define Minedel_auction   @"index.php?s=/Memberapi/del_auction" //我发布的删除
#define gzYongHu   @"Appapi/getAttentionUsers"//我关注的交易列表 page rows

#define changePwd      @"Appapi/resetPassword"//更改密码 pwd

#define baseInfo       @"Appapi/getUserInfo"//基本信息 account

#define baseInfoEdit   @"Appapi/editUserInfo"//基本信息编辑

#define addressPro     @"Appapi/getProvince"//获取省、市 province_id 可不跟，省市列表全查

#define addressCity    @"Appapi/getCity"//获取市/区县列表 province_id 必传
#define addressgetArea    @"Appapi/getArea"//获取市/区县列表 province_id 必传
#define addressnewAddress    @"Appapi/newAddress"//新增地址
#define deleteAddress    @"Appapi/deleteAddress"//删除地址
#define addinfoAddress    @"Appapi/infoAddress"//地址详情
#define editAddress    @"Appapi/editAddress"//编辑地址
#define personDetails  @"Appapi/getSellerInfo"//发布人详情 &sid=5&rows=1&page=1
#define getAddressList  @"Appapi/getAddressList"//地址列表 &sid=5&rows=1&page=1
#define Buy_All_Order_List     @"?s=/Memberapi/mysucc"

//资金明细
#define GetUserBalance @"Appapi/getUserBalance"// 用户余额
#define GetUserPledgeTake @"Appapi/getUserPledgeTake"// 用户提现记录
#define GetUserMoneyDetails @"Appapi/getUserMoneyDetails"// 物品交易记录
#define UserRecharge @"Appapi/userRecharge"//  用户充值记录


#endif /* Header_h */
