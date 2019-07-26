//
//  ChongZhiViewController.m
//  AnHuo321
//
//  Created by mac on 2019/6/25.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import "ChongZhiViewController.h"
#import "CZTableViewCell.h"
#import "TiRecordModel.h"
@interface ChongZhiViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * tiRecordView;
@property(nonatomic,strong)NSMutableArray * dataArr;
@property(nonatomic,assign)int page;

@end

@implementation ChongZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.page=1;
    self.view.backgroundColor =BassColor(241, 241, 241);
    self.tiRecordView =[[UITableView alloc]initWithFrame:CGRectMake(0,0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    self.tiRecordView.backgroundColor = BassColor(241, 241, 241);
    self.tiRecordView.dataSource =self;
    self.tiRecordView.delegate =self;
    self.tiRecordView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tiRecordView registerClass:[CZTableViewCell class] forCellReuseIdentifier:@"CZTableViewCell"];
    [self.view addSubview:self.tiRecordView];
    LRWeakSelf(self);
    self.tiRecordView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.page = 1;
        [weakSelf load_getUserPledgeTake:YES];
    }];
    self.tiRecordView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.page += 1;
        [weakSelf load_getUserPledgeTake:NO];
    }];
    [self.tiRecordView.mj_header beginRefreshing];
}
-(void)load_getUserPledgeTake:(BOOL)isYes{
    [HttpTool post:KURLNSString(UserRecharge) dic:@{@"rows":@"15",@"page":[NSString stringWithFormat:@"%d",self.page]} success:^(id  _Nonnull responce) {
        if ([responce[@"result"] integerValue]==1) {
            if (isYes==YES) {
                self.dataArr =[TiRecordModel mj_objectArrayWithKeyValuesArray:responce[@"data"]];
            }else{
                [self.dataArr addObjectsFromArray:[TiRecordModel mj_objectArrayWithKeyValuesArray:responce[@"data"]]];
            }
            
        }else{
            [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
        }
        [SVProgressHUD dismissWithDelay:1];
        [self.tiRecordView.mj_footer endRefreshing];
        [self.tiRecordView.mj_header endRefreshing];
        [self.tiRecordView reloadData];
    } faile:^(NSError * _Nonnull erroe) {
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CZTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"CZTableViewCell"];
    cell.backgroundColor =[UIColor whiteColor];
    TiRecordModel * model =self.dataArr[indexPath.section];
    [cell chuanZhiTiRecordModel:model];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return height(90);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * heardView =[[UIView alloc]init];
    
    heardView.frame =CGRectMake(0, 0, kScreenWidth,0.0001);
    
    return heardView;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footerView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 5)];
    return footerView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
