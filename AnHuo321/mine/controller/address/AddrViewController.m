//
//  AddrViewController.m
//  英德格斯
//
//  Created by 吕书涛 on 2018/11/13.
//  Copyright © 2018 吕书涛. All rights reserved.
//

#import "AddrViewController.h"
#import "ADD_Address_ViewController.h"
#import "AddAddressTableViewCell.h"
#import "AddModel.h"
@interface AddrViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * addTableView;
@property(nonatomic,strong)NSMutableArray * dataArr;
@property(nonatomic,assign)int page;
@end

@implementation AddrViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

   
    self.addTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-50-NavHeight-kSafeAreaBottomHeight) style:UITableViewStyleGrouped];
    self.addTableView.backgroundColor =COLOR;
    [self.addTableView registerClass:[AddAddressTableViewCell class] forCellReuseIdentifier:@"AddAddressTableViewCell"];
    self.addTableView.delegate = self;
    self.addTableView.dataSource =self;
    [self.view addSubview:self.addTableView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
   
    btn.backgroundColor = baseColor;
    [btn setTitle:@"+收货地址" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickAdd) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.addTableView.mas_bottom);
        make.height.mas_equalTo(50);
    }];
    // Do any additional setup after loading the view.
    self.page=1;
    LRWeakSelf(self);
    self.addTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.page = 1;
        [weakSelf load_list_Address:YES];
    }];
    self.addTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.page += 1;
        [weakSelf load_list_Address:NO];
    }];
    [self.addTableView.mj_header beginRefreshing];
}
-(void)load_list_Address:(BOOL)isYes{
        NSDictionary * guanDic= @{@"page":[NSString stringWithFormat:@"%d",self.page],@"rows":@"12"};
        [HttpTool post:KURLNSString(getAddressList) dic:guanDic success:^(id  _Nonnull responce) {
            if ([responce[@"result"] integerValue]==1) {
                if (isYes==YES) {
                    self.dataArr = [AddModel mj_objectArrayWithKeyValuesArray:responce[@"data"]];
                }else{
                    [self.dataArr addObjectsFromArray:[AddModel mj_objectArrayWithKeyValuesArray:responce[@"data"]]];
                }
            }else{
                [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
                [self.addTableView.mj_footer setHidden:YES];
            }
            [SVProgressHUD dismissWithDelay:1];
            [self.addTableView.mj_footer endRefreshing];
            [self.addTableView.mj_header endRefreshing];
            [self.addTableView reloadData];
        } faile:^(NSError * _Nonnull erroe) {
            
        }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AddAddressTableViewCell * cell= [tableView dequeueReusableCellWithIdentifier:@"AddAddressTableViewCell"];
    AddModel * cellModel =self.dataArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
     [cell chuanZhiAddress:cellModel];
    [cell.emitBtn addTarget:self action:@selector(emitBtn:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return height(100);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * heardView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.0001)];
    heardView.backgroundColor =BassColor(241,241, 241);;//BassColor(10, 30, 45);
    return heardView;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.0001)];
    footView.backgroundColor = BassColor(10, 30, 45);;
    return footView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(void)emitBtn:(UIButton*)btn{
    AddModel * btModel =self.dataArr[btn.tag];
    NSDictionary * xiangDic =@{@"id":btModel.addID};
    [HttpTool post:KURLNSString(addinfoAddress) dic:xiangDic success:^(id responce) {
        if ([responce[@"result"] intValue]==1) {
            ADD_Address_ViewController *add = [[ADD_Address_ViewController alloc]init];
            add.title = @"新增";
            add.dataDic =responce[@"data"];
            add.editCount =100;
            add.addID =btModel.addID;
            [self.navigationController pushViewController:add animated:YES];
            
        }else{
            [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
        }
        [SVProgressHUD dismissWithDelay:1];
    } faile:^(NSError *erroe) {
        //        [self showToastInView:self.view message:@"网络错误" duration:0.8];
    }];
}
- (void)clickAdd{
    ADD_Address_ViewController *add = [[ADD_Address_ViewController alloc]init];
    add.title = @"新增";
    [self.navigationController pushViewController:add animated:YES];
}

@end
