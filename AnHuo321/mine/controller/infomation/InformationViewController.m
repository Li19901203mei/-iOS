//
//  InformationViewController.m
//  英德格斯
//
//  Created by 吕书涛 on 2018/11/7.
//  Copyright © 2018 吕书涛. All rights reserved.
//

#import "InformationViewController.h"
#import "XiaoXiCell.h"
#import "ButtonChangeView.h"
#import "MessageModel.h"
#import "NotiMessageCell.h"
#import "MessageReplyVC.h"
#import "MessageContactVC.h"
@interface InformationViewController ()<UITableViewDelegate,UITableViewDataSource,ButtonChangeViewDelegate>
{
    UIView *dhView;
    
}

@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong) UIButton *leftBtn;
@property (nonatomic,strong) UIButton *rightBtn;
@property (nonatomic,assign) NSInteger currentSelectedIndex;
@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.currentSelectedIndex = 0;
    ButtonChangeView *changeView = [[ButtonChangeView alloc]initWithFrame:ccr(0, 0, SCREEN_WIDTH, 50) buttonArray:@[@"系统提醒",@"站内信"]];
    changeView.delegate = self;
    [self.view addSubview:changeView];
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, ccy(changeView), SCREEN_WIDTH, SCREEN_HEIGHT- 100 - NavHeight)];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.estimatedRowHeight = 90;
    self.tableview.rowHeight = UITableViewAutomaticDimension;
    [self.tableview registerNib:[UINib nibWithNibName:@"XiaoXiCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableview];
    self.tableview.tableFooterView = [UIView new];
    TableRegisterNib(self.tableview, @"XiaoXiCell");
    TableRegisterNib(self.tableview, @"NotiMessageCell");
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame = ccr(0, SCREEN_HEIGHT - 50 - NavHeight, SCREEN_WIDTH/2, 50);
    self.leftBtn.backgroundColor = BaseTheme_Colore;
    [self.leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.leftBtn setTitle:@"设置为已读" forState:UIControlStateNormal];
    Weak_Self(weakSelf);
    [[self.leftBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf readOrDelete:@"1"];
    }];
    [self.view addSubview:self.leftBtn];
    
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn.frame = ccr(SCREEN_WIDTH/2+1, SCREEN_HEIGHT - 50 - NavHeight, SCREEN_WIDTH/2, 50);
    self.rightBtn.backgroundColor = BaseTheme_Colore;
    [self.rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.rightBtn setTitle:@"删除" forState:UIControlStateNormal];
    [[self.rightBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf readOrDelete:@"0"];
    }];
    [self.view addSubview:self.rightBtn];
    self.tableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (weakSelf.currentSelectedIndex == 0) {
            [weakSelf obtainData];
        }else{
            [weakSelf obtainMessageData];
        }
        
    }];
    [self.tableview.mj_header beginRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.currentSelectedIndex == 0) {
        XiaoXiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XiaoXiCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        MessageModel *model = [self.dataArray safeObjectAtIndex:indexPath.row];
        cell.model = model;
        [[[cell.chooseBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
            model.isSelected = !model.isSelected;
            [self.tableview reloadData];
        }];
        return cell;
    }else{
        NotiMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NotiMessageCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        MessageModel *model = [self.dataArray safeObjectAtIndex:indexPath.row];
        cell.model = model;
        [[[cell.btn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
            model.isSelected = !model.isSelected;
            [self.tableview reloadData];
        }];
        [cell.replyBtn createBordersWithColor:BaseTheme_Colore withCornerRadius:3 andWidth:1];
        [[[cell.replyBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
            MessageReplyVC *vc = [MessageReplyVC new];
            [self.navigationController pushViewController:vc animated:YES];
        }];
        [cell.contactBtn createBordersWithColor:BaseTheme_Colore withCornerRadius:3 andWidth:1];
        [[[cell.contactBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:cell.rac_prepareForReuseSignal]subscribeNext:^(__kindof UIControl * _Nullable x) {
            MessageContactVC *vc = [MessageContactVC new];
            [self.navigationController pushViewController:vc animated:YES];
        }];
        return cell;
    }
}

- (void)buttonChangeViewDidSelectIdex:(NSInteger)buttonIndex{
    self.currentSelectedIndex = buttonIndex;
    [self.tableview.mj_header beginRefreshing];
}
#pragma mark-----获取系统提醒
- (void)obtainData{
    NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
    [dicM setObject:[GlobleStting getuserId] forKey:@"userid"];
    [Manager requestGETWithURLStr:KURLNSString(@"Memberapi/mysms") paramDic:dicM finish:^(id  _Nonnull dict) {
        [self.tableview.mj_header endRefreshing];
        self.dataArray = [MessageModel mj_objectArrayWithKeyValuesArray:dict[@"slist"]];
        [self.tableview reloadData];
    } enError:^(NSError * _Nonnull error) {
        [self.tableview.mj_header endRefreshing];
    }];
}
#pragma mark-----获取站内信内容
- (void)obtainMessageData{
    NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
    [dicM setObject:[GlobleStting getuserId] forKey:@"userid"];
    [dicM setObject:@"usend" forKey:@"tp"];
    [Manager requestGETWithURLStr:KURLNSString(@"Memberapi/mysms") paramDic:dicM finish:^(id  _Nonnull dict) {
        [self.tableview.mj_header endRefreshing];
        self.dataArray = [MessageModel mj_objectArrayWithKeyValuesArray:dict[@"slist"]];
        [self.tableview reloadData];
    } enError:^(NSError * _Nonnull error) {
        [self.tableview.mj_header endRefreshing];
    }];
}
#pragma mark-----已读或者删除
- (void)readOrDelete:(NSString *)type{
    NSString *ac = @"";
    if ([type isEqualToString:@"0"]) {//删除
        ac = @"del";
    }else{//读
        ac = @"read";
    }
    NSMutableArray *arrM = [NSMutableArray array];
    for (NSInteger i=0; i<self.dataArray.count; i++) {
        MessageModel *model = self.dataArray[i];
        if (model.isSelected) {
            [arrM addObject:model.sid];
        }
    }
    if (arrM.count<=0) {
        ShowToastWithText(@"请选择消息");
        return;
    }
    NSString *str = [arrM componentsJoinedByString:@","];
    NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
    [dicM setObject:str forKey:@"sid"];
    [dicM setObject:ac forKey:@"ac"];
    
    [Manager post:KURLNSString(@"Memberapi/mysms") RequestParams:dicM FinishBlock:^(NSURLResponse * _Nonnull response, NSData * _Nonnull data, NSError * _Nonnull connectionError) {
        NSDictionary *dict = [Manager returndictiondata:data];
        if ([dict[@"status"] integerValue] == 1) {
            ShowToastWithText(@"操作成功");
            [self.tableview.mj_header beginRefreshing];
        }
    }];
    
}
@end
