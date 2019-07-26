//
//  RightPullDownMenu.m
//  IntelligenceStudents
//
//  Created by xiaoshunliang on 2017/8/21.
//  Copyright © 2017年 GaoJuan. All rights reserved.
//

#import "RightPullDownMenu.h"

#define TopToView 10.0f
#define LeftToView 10.0f

@interface RightPullDownMenu()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat rowHeight;

@end
@implementation RightPullDownMenu

- (instancetype)initWithDataArr:(NSArray *)dataArr origin:(CGPoint)origin width:(CGFloat)width rowHeight:(CGFloat)rowHeight
{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    if (self) {
        if (rowHeight <= 0) {
            rowHeight = 44;
        }
        _titleFont = 14;//设置默认字体大小
        self.backgroundColor = [UIColor clearColor];
        self.origin = origin;
        self.rowHeight = rowHeight;
        self.dataArray = [dataArr copy];
        CGFloat pullHeight = rowHeight * dataArr.count;
        if (pullHeight >200) {
            pullHeight = 200;
        }
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(origin.x + LeftToView, origin.y + TopToView, width,pullHeight) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.layer.masksToBounds = YES;
        _tableView.layer.cornerRadius = 2;
        _tableView.layer.borderWidth = 1;
        _tableView.layer.borderColor = backGroundCorlor.CGColor;
        [self addSubview:_tableView];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.bounces = NO;
        _tableView.separatorColor = [UIColor whiteColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"RightPullDownMenu"];
        
    }
    return self;
    
}
- (void)uploadSelectedTextArr:(NSArray *)textArr{
    self.dataArray = textArr;
    [self.tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RightPullDownMenu"];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:_titleFont];
    cell.textLabel.text =[self.dataArray objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[self.arrImgName objectAtIndex:indexPath.row]];
    //        cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    return cell;
}
- (void)setTitleFont:(NSInteger)titleFont{
    _titleFont = titleFont;
    [self.tableView reloadData];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(rightPullDownCustomMenu:table:didSelectRowAtIndexPath:rowTitle:)]){
        [self.delegate rightPullDownCustomMenu:self table:tableView didSelectRowAtIndexPath:indexPath rowTitle:[self.dataArray objectAtIndex:indexPath.row]];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self dismissWithCompletion:nil];
}

- (void)dismissWithCompletion:(void (^)(RightPullDownMenu *object))completion
{
    __weak __typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.alpha = 0;
        weakSelf.tableView.frame = CGRectMake(weakSelf.origin.x, weakSelf.origin.y , weakSelf.tableView.frame.size.width, 0);
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
        if (completion) {
            completion(weakSelf);
        }
        if (weakSelf.dismiss) {
            weakSelf.dismiss();
        }
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (![touch.view isEqual:self.tableView]) {
        [self dismissWithCompletion:nil];
    }
}
- (void)reloateTable{
    [self.tableView reloadData];
}

@end
