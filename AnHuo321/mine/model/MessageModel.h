//
//  MessageModel.h
//  AnHuo321
//
//  Created by 123 on 2019/7/22.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageModel : NSObject
@property (nonatomic,copy)NSString *sid;
@property (nonatomic,copy)NSString *uid;
@property (nonatomic,copy)NSString *rsid;
@property (nonatomic,copy)NSString *sendid;
@property (nonatomic,copy)NSString *aid;
@property (nonatomic,copy)NSString *pid;
@property (nonatomic,copy)NSString *type;
@property (nonatomic,copy)NSString *status;//0表示未读
@property (nonatomic,copy)NSString *delmark;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,copy)NSString *time;
//@property (nonatomic,copy)NSString *user;
@property (nonatomic,assign) NSInteger isSelected;
@property (nonatomic,strong) NSDictionary *user;
@property (nonatomic,copy) NSString *pick;
@end

NS_ASSUME_NONNULL_END
