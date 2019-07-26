//
//  BuyOrderDetailVC.m
//  AnHuo321
//
//  Created by 123 on 2019/6/24.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "BuyOrderDetailVC.h"
#import "DeliverDetailVC.h"
@interface BuyOrderDetailVC ()
@property (weak, nonatomic) IBOutlet UILabel *addressLb;
@property (weak, nonatomic) IBOutlet UILabel *liuyanLb;
@property (weak, nonatomic) IBOutlet UILabel *orderNumberLb;
@property (weak, nonatomic) IBOutlet UILabel *orderStatusLb;
@property (weak, nonatomic) IBOutlet UILabel *timeLb;
@property (weak, nonatomic) IBOutlet UIView *buttonView;
@property (weak, nonatomic) IBOutlet UILabel *timeOne;
@property (weak, nonatomic) IBOutlet UILabel *timeTwo;
@property (weak, nonatomic) IBOutlet UILabel *timeThree;
@property (weak, nonatomic) IBOutlet UILabel *timeFour;
@property (weak, nonatomic) IBOutlet UILabel *timeFive;
@property (weak, nonatomic) IBOutlet UILabel *timeSex;
@property (weak, nonatomic) IBOutlet UIImageView *orderImg;

@end

@implementation BuyOrderDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"待收货";
    [self obtainData];
    NSString *orderStatus = @"";
    if ([self.status isEqualToString:@"2"]) {
        orderStatus = @"待收货";
        self.orderImg.image = [UIImage imageNamed:@"3order"];
        [self createBottomBtn:@[@"确认收货",@"快递查询",@"申请退货"]];
    }else if ([self.status isEqualToString:@"1"]){
        orderStatus = @"待发货";
        [self createBottomBtn:@[@"取消订单",@"催货"]];
        self.orderImg.image = [UIImage imageNamed:@"2order"];
    }
    self.orderStatusLb.text = [NSString stringWithFormat:@"订单状态:%@",orderStatus];
}
- (void)obtainData{
    NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
    [dicM setObject:self.order_no forKey:@"order_no"];
    [dicM setObject:[GlobleStting getuserId] forKey:@"userid"];
    [Manager requestGETWithURLStr:KURLNSString(@"index.php?s=/Memberapi/order_details") paramDic:dicM finish:^(id  _Nonnull dict) {
        if ([dict[@"info"][@"address"] isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dic = dict[@"info"][@"address"];
            self.addressLb.text = [NSString stringWithFormat:@"%@%@%@%@",dic[@"province"],dic[@"city"],dic[@"area"],dic[@"address"]];
        }
        self.liuyanLb.text = dict[@"info"][@"buyer_msg"];
        self.orderNumberLb.text = dict[@"info"][@"order_no"];
        self.timeOne.text = [self changeTime:dict[@"info"][@"time"]];
        self.timeTwo.text = [self changeTime:dict[@"info"][@"time1"]];
        self.timeThree.text = [self changeTime:dict[@"info"][@"time2"]];
        self.timeFour.text = [self changeTime:dict[@"info"][@"time3"]];
        self.timeFive.text = [self changeTime:dict[@"info"][@"time5"]];
        self.timeSex.text = [self changeTime:dict[@"info"][@"time11"]];
        if ([self.status isEqualToString:@"2"]) {
            self.timeLb.text = [NSString stringWithFormat:@"卖家已于%@发货",[Manager TimeCuoToTimes:dict[@"info"][@"time"]]];
        }if ([self.status isEqualToString:@"1"]) {
            self.timeLb.text = [NSString stringWithFormat:@"您的订单已于%@发货",[Manager TimeCuoToTimes:dict[@"info"][@"time"]]];
        }
    } enError:^(NSError * _Nonnull error) {
        
    }];
}
- (NSString *)changeTime:(NSString *)str{
    if ([str isEqualToString:@"0"]) {
        return @"";
    }else{
        return [Manager TimeCuoToTimes:str];
    }
}
- (void)createBottomBtn:(NSArray *)arr{
    CGFloat btnWidth = 80;
    for (NSInteger i=0; i < arr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(SCREEN_WIDTH - (btnWidth +10) * (i+1), 0, btnWidth, self.buttonView.frame.size.height);
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [btn createBordersWithColor:RGBACOLOR(188, 46, 52, 1) withCornerRadius:8 andWidth:1];
        [btn setTitleColor:RGBACOLOR(188, 46, 52, 1) forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.buttonView addSubview:btn];
        
    }
}
- (void)btnClicked:(UIButton *)sender{
    if ([sender.titleLabel.text isEqualToString:@"申请退货"]) {
        NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
        [dicM setObject:self.order_no forKey:@"order_no"];
        [dicM setObject:[GlobleStting getuserId] forKey:@"userid"];
        [Manager requestGETWithURLStr:KURLNSString(@"index.php?s=/Memberapi/returnorder") paramDic:dicM finish:^(id  _Nonnull dict) {
            [self.navigationController popViewControllerAnimated:YES];
            ShowToastWithText(@"已申请退货,等待卖家确认");
        } enError:^(NSError * _Nonnull error) {
            
        }];
    }else if ([sender.titleLabel.text isEqualToString:@"确认收货"]) {
        NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
        [dicM setObject:self.order_no forKey:@"order_no"];
        [dicM setObject:[GlobleStting getuserId] forKey:@"userid"];
        [Manager requestPOSTWithURLStr:KURLNSString(@"index.php?s=/Memberapi/receipt") paramDic:dicM finish:^(id  _Nonnull dict) {
            
            
        } enError:^(NSError * _Nonnull error) {
            
        }];
    }else if ([sender.titleLabel.text isEqualToString:@"快递查询"]){
        DeliverDetailVC *vc = [DeliverDetailVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([sender.titleLabel.text isEqualToString:@"发货"]) {
#warning 暂时缺少发货接口
        NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
        [dicM setObject:self.order_no forKey:@"order_no"];
        [dicM setObject:[GlobleStting getuserId] forKey:@"userid"];
        [Manager requestPOSTWithURLStr:KURLNSString(@"") paramDic:dicM finish:^(id  _Nonnull dict) {
            
            
        } enError:^(NSError * _Nonnull error) {
            
        }];
    }else if ([sender.titleLabel.text isEqualToString:@"快递查询"]){
        DeliverDetailVC *vc = [DeliverDetailVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([sender.titleLabel.text isEqualToString:@"取消订单"]){
        NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
        [dicM setObject:self.order_no forKey:@"order_no"];
        [dicM setObject:[GlobleStting getuserId] forKey:@"userid"];
        [Manager requestGETWithURLStr:KURLNSString(@"index.php?s=/Memberapi/cancelorder") paramDic:dicM finish:^(id  _Nonnull dict) {
            [self.navigationController popViewControllerAnimated:YES];
            ShowToastWithText(@"取消成功");
            
        } enError:^(NSError * _Nonnull error) {
            
        }];
    }
}
@end
