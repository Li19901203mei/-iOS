//
//  AboutViewController.m
//  AnHuo321
//
//  Created by mac on 2019/6/19.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import "AboutViewController.h"
#import "AboutTableViewCell.h"
#import "AboutXiangViewController.h"
@interface AboutViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * aboutTableView;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    self.aboutTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    _aboutTableView.delegate =self;
    _aboutTableView.dataSource= self;
    [_aboutTableView registerClass:[AboutTableViewCell class] forCellReuseIdentifier:@"AboutTableViewCell"];
    [self.view addSubview:self.aboutTableView];
    
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AboutTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"AboutTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section==0) {
        cell.leftLable.text =@"关于321AH";
    }else{
        cell.leftLable.text =@"郑州英德格斯网络科技有限公司";
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return height(45);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * heardView =[[UIView alloc]init];
    heardView.backgroundColor= BassColor(241, 241, 241);
  
        heardView.frame =CGRectMake(0, 0, kScreenWidth, 0.0001);
    
    return heardView;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footView =[[UIView alloc]init];
    footView.backgroundColor= BassColor(241, 241, 241);
    footView.frame =CGRectMake(0, 0, kScreenWidth, 1);
    return footView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        AboutXiangViewController * xiangVC =[[AboutXiangViewController alloc]init];
        xiangVC.title = @"关于321AH";
        xiangVC.xiangStr = @" 郑州英德格斯网络科技有限公司开发运营,321AH网站为动价交易网站。创始人的想法源于一次旧物整理。想要快速把一些自己不需要的，尚能够正常使用的物品处理出去，固定的价格非常不利于交易的快速达成，因此做了这个网站。您可以通过321AH买卖旧物，比如收藏品、旧车、旧衣物等。21AH同时具有其他交易网站的优点和待优化点：交易类型丰富、交易保障坚固、大型贵重物品或产权交易初步完善。";
        [self.navigationController pushViewController:xiangVC animated:YES];
    }else{
        AboutXiangViewController * VC =[[AboutXiangViewController alloc]init];
        VC.title = @"郑州英德格斯网络科技有限公司";
        VC.xiangStr = @"郑州英德格斯网络科技有限公司,成立于2016年，主要经营互联网相关业务，2017年公司将业务方向调整为全力打造321AH.com交易平台，让交易更加公平、公开、公正。\n试想这样一个平台，当我想要买北京到三亚的机票时，我只需登录平台发布这个需求。\n所有提供这张机票的商家都会主动加入交易进程，然后我只需在其中找一张最物美价廉的票。\n再也不会有大数据杀熟存在，所有的交易价格都由市场形成，真实高效。\n所有需要这个机票的买家也可以参与进来，按照我之前成交的价格再次成交，不需要担心买贵了。\n——我们就是这样一个平台。";
        [self.navigationController pushViewController:VC animated:YES];
    }
}
@end
