//
//  SendGoodsVC.m
//  AnHuo321
//
//  Created by 123 on 2019/5/26.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "SendGoodsVC.h"
#import "RightPullDownMenu.h"
#import "UITextView+category.h"
#import "UIView+Border.h"
#import "UIView+XPKit.h"
#import "ChooseDeliverVC.h"
@interface SendGoodsVC ()<RightPullDownMenuDelegate>
@property (weak, nonatomic) IBOutlet UILabel *people;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *emailCode;
@property (weak, nonatomic) IBOutlet UITextField *goodsNumber;
@property (weak, nonatomic) IBOutlet UITextView *note;
@property (weak, nonatomic) IBOutlet UIButton *submit;
@property (weak, nonatomic) IBOutlet UIView *goodNumberView;
@property (weak, nonatomic) IBOutlet UIView *pullMeauBgView;
@property (weak, nonatomic) IBOutlet UILabel *kuaidi;
@property (nonatomic,copy) NSString *deliverId;
@property (nonatomic,strong) NSDictionary *deliverDic;
@end

@implementation SendGoodsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"发货";
    [self.pullMeauBgView boredWidth:1 boredColor:backGroundCorlor borderRadio:3];
    [self.goodNumberView boredWidth:1 boredColor:backGroundCorlor borderRadio:3];
    [self.note boredWidth:1 boredColor:backGroundCorlor borderRadio:3];
    self.note.placeholder = @"有哪些需要给卖家说明的";
    LRWeakSelf(self);
    [self.pullMeauBgView whenTapped:^{
        ChooseDeliverVC *vc = [ChooseDeliverVC new];
        vc.deliverDic = self.deliverDic;
        vc.chooseDeliver = ^(NSString * _Nonnull name, NSString * _Nonnull id) {
            weakSelf.deliverId = id;
            weakSelf.kuaidi.text = name;
        };
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
   
    [self obtainData];
    
    [[self.submit rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        if (kISNullString(weakSelf.deliverId)) {
            //ShowToastWithText(@"请选择快递");
            return ;
        }
        if (kISNullString(weakSelf.goodsNumber.text)) {
            //ShowToastWithText(@"请填写快递单号");
            return ;
        }
        NSString *tt = self.note.text;
        if (kISNullString(tt)) {
            tt = @"";
        }
        NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
        [dicM setObject:self.deliverId forKey:@"express"];
        [dicM setObject:self.goodsNumber.text forKey:@"express_no"];
        [dicM setObject:tt forKey:@"remark"];
        [dicM setObject:self.orderId forKey:@"order_no"];
        [Manager requestPOSTWithURLStr:KURLNSString(@"?s=/Memberapi/deliver") paramDic:dicM finish:^(id  _Nonnull dict) {
            NSLog(@"---------%@",dict);
           // ShowToastWithText(dict[@"info"]);
        } enError:^(NSError * _Nonnull error) {
            
        }];
    }];
}
- (void)rightPullDownCustomMenu:(RightPullDownMenu *)menu table:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath rowTitle:(NSString *)title{
    NSLog(@"我选择了哪个===%@",title);
    self.kuaidi.text = title;
}
- (void)obtainData{
    NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
    [dicM setObject:[GlobleStting getuserId] forKey:@"uid"];
    [dicM setObject:self.orderId forKey:@"order_no"];
    [Manager requestGETWithURLStr:KURLNSString(@"?s=/Memberapi/deliver") paramDic:dicM finish:^(id  _Nonnull dict) {
        NSLog(@"---------%@",dict);
        NSDictionary *dic = dict[@"address"];
        self.people.text = [NSString stringWithFormat:@"收件人:%@",dic[@"truename"]];
        self.address.text = [NSString stringWithFormat:@"地址:%@%@%@%@",dic[@"province"],dic[@"city"],dic[@"area"],dic[@"address"]];
        self.phone.text = [NSString stringWithFormat:@"电话:%@",dic[@"mobile"]];
        self.emailCode.text = [NSString stringWithFormat:@"邮编:%@",dic[@"postalcode"]];;
        self.deliverDic = dict[@"express_list"];
    } enError:^(NSError * _Nonnull error) {
        
    }];
    
}

@end
