//
//  ChooseDeliverVC.m
//  AnHuo321
//
//  Created by 123 on 2019/5/29.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "ChooseDeliverVC.h"

@interface ChooseDeliverVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ChooseDeliverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"快递";
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.deliverDic.allKeys.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key =  self.deliverDic.allKeys[section];
    NSArray *arr = self.deliverDic[key];
    return arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *key =  self.deliverDic.allKeys[indexPath.section];
    NSArray *arr = self.deliverDic[key];
    NSDictionary *dic = arr[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = dic[@"ch"];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *key =  self.deliverDic.allKeys[section];
    return key;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *key =  self.deliverDic.allKeys[indexPath.section];
    NSArray *arr = self.deliverDic[key];
    NSDictionary *dic = arr[indexPath.row];
    if (self.chooseDeliver) {
        self.chooseDeliver(dic[@"ch"], dic[@"id"]);
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
