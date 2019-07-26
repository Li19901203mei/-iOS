//
//  HomeDetailsViewController.m
//  AnHuo321
//
//  Created by 吕书涛 on 2019/3/30.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "HomeDetailsViewController.h"
#import "HomeModel.h"
#import "MorePriceViewController.h"
#import "PublisherDetailsViewController.h"
#import "ProductInfoView.h"
#import "UIView+ZCFrame.h"
#import "AHControll.h"
#import "SDAutoLayout.h"
#import "MorePriceListViewController.h"

@interface HomeDetailsViewController ()<SDCycleScrollViewDelegate>
{
    NSString *sidStr;
}
@property (nonatomic ,strong)UIWebView *webView;
@property (nonatomic ,strong)UIView *headView;
@property (nonatomic ,strong)NSMutableArray *bannerArr;
@property (nonatomic ,strong)SDCycleScrollView *cycleScrollView;
@property (nonatomic ,strong)ProductInfoView *infoView;
@property (nonatomic ,strong)HomeModel *sellerModel;
@property (nonatomic ,strong)HomeModel *buyModel;
@property(nonatomic,strong)UIButton *maichuBtn;
@property(nonatomic,strong)UIButton *mairuBtn;
@end

@implementation HomeDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bannerArr = [NSMutableArray array];
    [self creatWebView];
    [self creatHeadView];
    [self creatBottomView];
    [self loadData];
}

- (void)creatWebView {
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 50)];
    [self.view addSubview:self.webView];

}

- (void)creatHeadView {
    self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 770)];
    self.headView.backgroundColor = [UIColor whiteColor];
    [self.headView addSubview:self.cycleScrollView];
    self.infoView =  [[[NSBundle mainBundle] loadNibNamed:@"ProductInfoView" owner:self options:nil] lastObject];
    self.infoView.backgroundColor = [UIColor whiteColor];
    [self.headView addSubview:self.infoView];
    self.infoView.sd_layout.leftSpaceToView(self.headView, 0).widthIs(SCREEN_WIDTH).topSpaceToView(self.headView, 310).heightIs(440);
    
    [self.webView.scrollView addSubview:self.headView];
    self.webView.scrollView.userInteractionEnabled = YES;
    _webView.scrollView.subviews[0].frame = CGRectMake(0, 770, [UIScreen mainScreen].bounds.size.width, SCREEN_HEIGHT  - 50);
LRWeakSelf(self);
    [[self.infoView.attentionButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"====");
        [HttpTool post:KURLNSString(guanzhu) dic:@{@"pid":[NSString stringWithFormat:@"%@",weakSelf.idString]} success:^(id  _Nonnull responce) {
            if ([responce[@"result"] intValue]==1) {
                [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
            }else if ([responce[@"result"] intValue]==2){
              [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
            }else{
             [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
            }
             [SVProgressHUD dismissWithDelay:1];
        } faile:^(NSError * _Nonnull erroe) {
            
        }];
    }];
    UIButton *sellerDetailButton = [[UIButton alloc]initWithFrame:self.infoView.sellerDetailLabel.bounds];
    [self.infoView.sellerDetailLabel addSubview:sellerDetailButton];
    [sellerDetailButton addTarget:self action:@selector(handleTapSellerAction) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapSellerAction)];
    [self.infoView.sellerRightImage addGestureRecognizer:tap1];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleMoreSeller)];
    [self.infoView.moreSellerLabel addGestureRecognizer:tap2];
    [self.infoView.moreSellerRightImage addGestureRecognizer:tap2];
    
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleMoreBuy)];
    [self.infoView.moreBuyLabel addGestureRecognizer:tap3];
    [self.infoView.moreBuyRightImage addGestureRecognizer:tap3];
    
}

- (void)handleMoreSeller {
    MorePriceListViewController *vc = [[MorePriceListViewController alloc]init];
    vc.title = @"更多出价";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)handleMoreBuy {
    MorePriceListViewController *vc = [[MorePriceListViewController alloc]init];
    vc.title = @"更多出价";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)creatBottomView {
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 50, SCREEN_WIDTH, 50)];
    bottomView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:bottomView];
    [bottomView addSubview:self.maichuBtn];
    [bottomView addSubview:self.mairuBtn];
}

- (SDCycleScrollView *)cycleScrollView {
    if (!_cycleScrollView) {
        _cycleScrollView =[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder@2x"]];
        _cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
        _cycleScrollView.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    }
    return _cycleScrollView;
}

- (UIButton *)maichuBtn{
    if (!_maichuBtn) {
        _maichuBtn = [AHControll createButtonNormalFrame:CGRectMake(0, 0, SCREEN_WIDTH/2, 50) Target:self Action:@selector(clickbtnmaichu) Title:@"我要卖出" TitleColor:UIColor.whiteColor Font:16 BackGColor:UIColor.orangeColor];
    }
    return _maichuBtn;
}

- (void)clickbtnmaichu{
    MorePriceViewController *vc = [[MorePriceViewController alloc]init];
    vc.title = @"卖家出价";
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIButton *)mairuBtn{
    if (!_mairuBtn) {
        _mairuBtn = [AHControll createButtonNormalFrame:CGRectMake(SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2, 50) Target:self Action:@selector(clickbtnmairu) Title:@"我要买入" TitleColor:UIColor.whiteColor Font:16 BackGColor:baseColor];
    }
    return _mairuBtn;
}

- (void)clickbtnmairu{
    MorePriceViewController *vc = [[MorePriceViewController alloc]init];
    vc.title = @"买家出价";
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)loadData {
    LRWeakSelf(self);
    NSDictionary *dic = @{@"pid":self.idString,
                          };
    [Manager post:KURLNSString(productDetails) RequestParams:dic FinishBlock:^(NSURLResponse * _Nonnull response, NSData * _Nonnull data, NSError * _Nonnull connectionError) {
        NSDictionary *dict = [Manager returndictiondata:data];
        NSLog(@"=======%@",dict);
        if ([dict[@"result"] intValue]==1) {
            NSDictionary *dictions = [[dict objectForKey:@"data"] firstObject];
            self->sidStr = [dictions objectForKey:@"sellerHref"];
            for (NSDictionary *dicc in [dictions objectForKey:@"imgSrc"]) {
                HomeModel *model = [HomeModel mj_objectWithKeyValues:dicc];
                [self.bannerArr addObject:model.img];
            }
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                CGFloat sellViewHeight = 0;
                CGFloat buyViewHeight = 0;
                if ([[dictions objectForKey:@"sell"] isKindOfClass:[NSString class]]) {
                    self.infoView.sellViewHeight.constant = 0;
                    self.infoView.sellBottomHeight.constant = 0;
                    self.infoView.sellView.hidden = YES;
                    self.infoView.sellBottomView.hidden = YES;
                    sellViewHeight = 165;
                } else {
                    self.infoView.sellViewHeight.constant = 145;
                    self.infoView.sellBottomHeight.constant = 20;
                    self.infoView.sellView.hidden = NO;
                    self.infoView.sellBottomView.hidden = NO;
                    sellViewHeight = 0;
                    NSMutableArray *arr = [NSMutableArray array];
                    for (NSDictionary *dis in [dictions objectForKey:@"sell"]) {
                        HomeModel *model = [HomeModel mj_objectWithKeyValues:dis];
                        [arr addObject:model];
                    }
                    weakSelf.sellerModel  = arr.firstObject;
                }
                
                if ([[dictions objectForKey:@"buy"] isKindOfClass:[NSString class]]) {
                    self.infoView.buyViewHeight.constant = 0;
                    self.infoView.buyBottomHeight.constant = 0;
                    self.infoView.buyView.hidden = YES;
                    self.infoView.buyBottomVIew.hidden = YES;
                    buyViewHeight = 165;
                } else {
                    self.infoView.buyViewHeight.constant = 145;
                    self.infoView.buyBottomHeight.constant = 20;
                    self.infoView.buyView.hidden = NO;
                    self.infoView.buyBottomVIew.hidden = NO;
                    buyViewHeight = 0;
                    NSMutableArray *arr1 = [NSMutableArray array];
                    for (NSDictionary *dis in [dictions objectForKey:@"buy"]) {
                        HomeModel *model = [HomeModel mj_objectWithKeyValues:dis];
                        [arr1 addObject:model];
                    }
                    weakSelf.buyModel = arr1.firstObject;
                }
                
                self.infoView.sd_layout.heightIs(440 - sellViewHeight - buyViewHeight);
                NSLog(@"====%lf",self.infoView.frame.size.height);
                self.headView.sd_layout.heightIs(770 - sellViewHeight - buyViewHeight);
                NSLog(@"====%lf",self.headView.frame.size.height);
                
                self.webView.scrollView.subviews[0].frameY = 770 - sellViewHeight - buyViewHeight;
                [weakSelf.webView loadHTMLString:[dictions objectForKey:@"desc"] baseURL:nil];
                weakSelf.cycleScrollView.imageURLStringsGroup = weakSelf.bannerArr;
                weakSelf.infoView.titleLabel.text = [NSString stringWithFormat:@"%@",[dictions objectForKey:@"title"]];
                weakSelf.infoView.sellerLabel.text = [NSString stringWithFormat:@"发布人：%@",[dictions objectForKey:@"seller"]];
                
                if (weakSelf.sellerModel) {
                    weakSelf.infoView.sellerNickNameLabel.text = [NSString stringWithFormat:@"报价人：%@",weakSelf.sellerModel.nickName];
                    weakSelf.infoView.sellerPriceLabel.text = [NSString stringWithFormat:@"单价：%@",weakSelf.sellerModel.unitPrice];
                    weakSelf.infoView.sellerCountLabel.text = [NSString stringWithFormat:@"数量：%@",weakSelf.sellerModel.number];
                }
                
                if (weakSelf.buyModel) {
                    weakSelf.infoView.buyNickNameLabel.text = [NSString stringWithFormat:@"报价人：%@",weakSelf.buyModel.nickName];
                    weakSelf.infoView.buyPrice.text = [NSString stringWithFormat:@"单价：%@",weakSelf.buyModel.unitPrice];
                    weakSelf.infoView.buyNumberLabel.text = [NSString stringWithFormat:@"数量：%@",weakSelf.buyModel.number];
                }
            });
        }else{
            [SVProgressHUD showSuccessWithStatus:@"没有相关数据"];
        }
       
    }];
}

- (void)handleTapSellerAction {
    PublisherDetailsViewController *vc = [[PublisherDetailsViewController alloc]init];
    vc.title = @"发布人详情";
    vc.sidStr = sidStr;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
