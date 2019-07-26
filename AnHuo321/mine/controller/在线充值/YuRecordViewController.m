//
//  YuRecordViewController.m
//  AnHuo321
//
//  Created by mac on 2019/6/20.
//  Copyright © 2019年 macbookpro. All rights reserved.
//

#import "YuRecordViewController.h"
#import "RecordTableViewCell.h"
#import "YuModel.h"
@interface YuRecordViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * recordView;
@property(nonatomic,strong)NSMutableArray * dataArr;
@property(nonatomic,assign)int page;
@end

@implementation YuRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page=1;
    // Do any additional setup after loading the view.
    self.view.backgroundColor =BassColor(241, 241, 241);
    self.recordView =[[UITableView alloc]initWithFrame:CGRectMake(0,0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    self.recordView.backgroundColor = BassColor(241, 241, 241);
    self.recordView.dataSource =self;
    self.recordView.delegate =self;
    self.recordView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.recordView registerClass:[RecordTableViewCell class] forCellReuseIdentifier:@"RecordTableViewCell"];
    [self.view addSubview:self.self.recordView];
    LRWeakSelf(self);
    self.recordView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.page = 1;
        [weakSelf load_getUserPledgeTake:YES];
    }];
    self.recordView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.page += 1;
        [weakSelf load_getUserPledgeTake:NO];
    }];
    [self.recordView.mj_header beginRefreshing];
}
-(void)load_getUserPledgeTake:(BOOL)isYes{
    [HttpTool post:KURLNSString(GetUserMoneyDetails) dic:@{@"rows":@"15",@"page":[NSString stringWithFormat:@"%d",self.page]} success:^(id  _Nonnull responce) {
        if ([responce[@"result"] integerValue]==1) {
            if (isYes==YES) {
                self.dataArr =[YuModel mj_objectArrayWithKeyValuesArray:responce[@"data"]];
            }else{
                [self.dataArr addObjectsFromArray:[YuModel mj_objectArrayWithKeyValuesArray:responce[@"data"]]];
            }
            
        }else{
            [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
        }
        [SVProgressHUD dismissWithDelay:1];
        [self.recordView.mj_footer endRefreshing];
        [self.recordView.mj_header endRefreshing];
        [self.recordView reloadData];
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
    RecordTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"RecordTableViewCell"];
    cell.backgroundColor =[UIColor whiteColor];
    YuModel  * model =self.dataArr[indexPath.section];
    [cell chuanZhiYuModel:model];
    return cell;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return height(90);
//}
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
