//
//  EvaluationVC.m
//  AnHuo321
//
//  Created by 123 on 2019/5/29.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "EvaluationVC.h"
#import "RatingBar.h"
#import "BaseModel.h"
@interface EvaluationVC ()
@property (weak, nonatomic) IBOutlet UILabel *goodsTitle;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *bargainTime;
@property (weak, nonatomic) IBOutlet UILabel *endTime;
@property (weak, nonatomic) IBOutlet UILabel *updateTime;
@property (weak, nonatomic) IBOutlet UILabel *salePeople;
@property (weak, nonatomic) IBOutlet UITextView *evaluateGoodsTV;
@property (weak, nonatomic) IBOutlet UITextView *evaluateServiceTV;
@property (weak, nonatomic) IBOutlet RatingBar *describeRate;
@property (weak, nonatomic) IBOutlet RatingBar *saleRate;
@property (weak, nonatomic) IBOutlet RatingBar *logisticsRate;
@end

@implementation EvaluationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"评价";
    self.evaluateGoodsTV.placeholder = @"评价商品";
    self.evaluateServiceTV.placeholder = @"评价服务";
    [self.evaluateGoodsTV createBordersWithColor:backGroundCorlor withCornerRadius:0 andWidth:1];
    [self.evaluateServiceTV createBordersWithColor:backGroundCorlor withCornerRadius:0 andWidth:1];
    [self updateContent];
    if (self.isSeeEvalution) {//查看评价
        self.evaluateGoodsTV.editable = NO;
        self.evaluateServiceTV.editable = NO;
        self.describeRate.enable = NO;
        self.saleRate.enable = NO;
        self.logisticsRate.enable = NO;
        [self obtainEvaluationDetail];
    }else{//发表评价
        Weak_Self(weakSelf);
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]bk_initWithTitle:@"确定" style:UIBarButtonItemStylePlain handler:^(id sender) {
            if (weakSelf.describeRate.starNumber<=0) {
                ShowToastWithText(@"请对描述相符进行评价");
                return ;
            }
            if (weakSelf.saleRate.starNumber<=0) {
                ShowToastWithText(@"请对卖家服务进行评价");
                return ;
            }
            if (weakSelf.logisticsRate.starNumber<=0) {
                ShowToastWithText(@"请对物流服务进行评价");
                return ;
            }
            NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
            [dicM setObject:self.model.order_no forKey:@"order_no"];
            [dicM setObject:[GlobleStting getuserId] forKey:@"userid"];
            [dicM safeSetObject:weakSelf.evaluateGoodsTV.text forKey:@"service_evaluate"];
            [dicM safeSetObject:weakSelf.evaluateServiceTV.text forKey:@"conform_evaluate"];
            [dicM safeSetObject:@(weakSelf.describeRate.starNumber) forKey:@"conform"];
            [dicM safeSetObject:@(weakSelf.saleRate.starNumber) forKey:@"service"];
            [dicM safeSetObject:@(weakSelf.logisticsRate.starNumber) forKey:@"express"];
            [Manager requestPOSTWithURLStr:KURLNSString(@"index.php?s=/Memberapi/evaluate") paramDic:dicM finish:^(id  _Nonnull dict) {
                NSLog(@"---------%@",dict);
                if ([dict[@"status"] integerValue] == 0) {
                    ShowToastWithText(dict[@"info"]);
                }else{
                    ShowToastWithText(@"评价成功");
                    [self.navigationController popViewControllerAnimated:YES];
                }
            } enError:^(NSError * _Nonnull error) {
                
            }];
        }];
    }

}
- (void)updateContent{
    self.goodsTitle.text = self.model.pname;
    self.number.text = [NSString stringWithFormat:@"[物品编号: %@]",self.model.bidinfo[@"bidnb"]];
    NSString *url = KURLNSString(self.model.pictures);
    [self.img sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
    self.price.text = self.model.danjia;
    self.salePeople.text = self.model.organization;
    self.bargainTime.text = [Manager TimeCuoToTime:self.model.losetime];
    self.endTime.text =[Manager TimeCuoToTime:self.model.losetime];
    self.updateTime.text =self.model.updata_time;
}
- (void)obtainEvaluationDetail{
    NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
    [dicM setObject:self.model.order_no forKey:@"order_no"];
    [dicM setObject:[GlobleStting getuserId] forKey:@"userid"];
    [Manager requestGETWithURLStr:KURLNSString(@"index.php?s=/Memberapi/evaluate_show") paramDic:dicM finish:^(id  _Nonnull dict) {
        NSLog(@"---------%@",dict);
        BaseModel *model = [BaseModel mj_objectWithKeyValues:dict[@"info"]];
        self.evaluateGoodsTV.text = model.conform_evaluate;
        self.evaluateServiceTV.text = model.service_evaluate;
        self.describeRate.starNumber = model.conform;
        self.saleRate.starNumber = model.service;
        self.logisticsRate.starNumber = model.express;
    } enError:^(NSError * _Nonnull error) {
        
    }];
}

@end
