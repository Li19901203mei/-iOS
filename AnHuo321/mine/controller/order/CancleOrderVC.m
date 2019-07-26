//
//  CancleOrderVC.m
//  AnHuo321
//
//  Created by 123 on 2019/6/14.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "CancleOrderVC.h"

@interface CancleOrderVC ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewWidth;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *liuyan;
@property (weak, nonatomic) IBOutlet UILabel *orderNumber;
@property (weak, nonatomic) IBOutlet UILabel *orderStatus;
@property (weak, nonatomic) IBOutlet UIView *reasonOneView;
@property (weak, nonatomic) IBOutlet UIView *reasonTwoView;
@property (weak, nonatomic) IBOutlet UIView *reasonThreeView;
@property (weak, nonatomic) IBOutlet UIView *reasonFourView;
@property (weak, nonatomic) IBOutlet UIView *reasonFiveView;
@property (weak, nonatomic) IBOutlet UIButton *reasonBtnOne;
@property (weak, nonatomic) IBOutlet UIButton *reasonBtnTwo;
@property (weak, nonatomic) IBOutlet UIButton *reasonBtnThree;
@property (weak, nonatomic) IBOutlet UIButton *reasonBtnFour;
@property (weak, nonatomic) IBOutlet UIButton *reasonBtnFive;
@property (weak, nonatomic) IBOutlet UIScrollView *bgScroll;
@property (nonatomic,assign) NSInteger reasonIndex;
@end

@implementation CancleOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"取消订单";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确认" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarClicked)];
    //获取收货地址数据
    [self obtainData];
    LRWeakSelf(self);
    [self.reasonOneView whenTapped:^{
        weakSelf.reasonIndex = 0;
        [weakSelf.reasonBtnOne setImage:[UIImage imageNamed:@"choise2-press"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnTwo setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnThree setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnFour setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnFive setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
    }];
    [self.reasonTwoView whenTapped:^{
        weakSelf.reasonIndex = 1;
        [weakSelf.reasonBtnOne setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnTwo setImage:[UIImage imageNamed:@"choise2-press"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnThree setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnFour setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnFive setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
    }];
    [self.reasonThreeView whenTapped:^{
        weakSelf.reasonIndex = 2;
        [weakSelf.reasonBtnOne setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnTwo setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnThree setImage:[UIImage imageNamed:@"choise2-press"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnFour setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnFive setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
    }];
    [self.reasonFourView whenTapped:^{
        weakSelf.reasonIndex = 3;
        [weakSelf.reasonBtnOne setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnTwo setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnThree setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnFour setImage:[UIImage imageNamed:@"choise2-press"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnFive setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
    }];
    [self.reasonFiveView whenTapped:^{
        weakSelf.reasonIndex = 4;
        [weakSelf.reasonBtnOne setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnTwo setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnThree setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnFour setImage:[UIImage imageNamed:@"choise-1"] forState:UIControlStateNormal];
        [weakSelf.reasonBtnFive setImage:[UIImage imageNamed:@"choise2-press"] forState:UIControlStateNormal];
    }];
}
- (void)obtainData{
    NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
    [dicM setObject:self.order_no forKey:@"order_no"];
    [dicM setObject:[GlobleStting getuserId] forKey:@"userid"];
    [Manager requestGETWithURLStr:KURLNSString(@"index.php?s=/Memberapi/cancelorder") paramDic:dicM finish:^(id  _Nonnull dict) {
        if ([dict[@"info"][@"address"] isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dic = dict[@"info"][@"address"];
            self.address.text = [NSString stringWithFormat:@"%@%@%@%@",dic[@"province"],dic[@"city"],dic[@"area"],dic[@"address"]];
        }
        self.liuyan.text = dict[@"info"][@"buyer_msg"];
        self.liuyan.text = dict[@"info"][@"order_no"];
        
    } enError:^(NSError * _Nonnull error) {
        
    }];
}
- (void)rightBarClicked{
    NSString *str;
    if (self.reasonIndex == 0) {
        str = @"我不想买了";
    }else if (self.reasonIndex == 1){
        str = @"信息填写错误";
    }else if (self.reasonIndex == 2){
        str = @"卖家缺货";
    }else if (self.reasonIndex == 3){
        str = @"同城见面交易";
    }else{
        str = @"其他原因";
    }
    NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
    [dicM setObject:str forKey:@"ly"];
    [dicM setObject:self.order_no forKey:@"order_no"];
    [dicM setObject:[GlobleStting getuserId] forKey:@"userid"];
    [Manager requestPOSTWithURLStr:KURLNSString(@"index.php?s=/Memberapi/cancelorder") paramDic:dicM finish:^(id  _Nonnull dict) {
        NSLog(@"---------%@",dict);
         ShowToastWithText(@"取消订单成功");
        [self.navigationController popViewControllerAnimated:YES];
    } enError:^(NSError * _Nonnull error) {
        
    }];
}


@end
