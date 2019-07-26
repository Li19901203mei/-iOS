//
//  RightPullDownMenu.h
//  IntelligenceStudents
//
//  Created by xiaoshunliang on 2017/8/21.
//  Copyright © 2017年 GaoJuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RightPullDownMenu;
@protocol RightPullDownMenuDelegate <NSObject>

- (void)rightPullDownCustomMenu:(RightPullDownMenu *)menu table:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath rowTitle:(NSString *)title;

@end

typedef void(^Dismiss)(void);

@interface RightPullDownMenu : UIView

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) id<RightPullDownMenuDelegate> delegate;
@property (nonatomic, copy) Dismiss dismiss;
@property (nonatomic, strong) NSArray *arrImgName;
@property (nonatomic, strong) NSArray *dataArray;
@property (assign, nonatomic) NSInteger titleFont;//字体大小

- (void)reloateTable;
- (instancetype)initWithDataArr:(NSArray *)dataArr origin:(CGPoint)origin width:(CGFloat)width rowHeight:(CGFloat)rowHeight;

- (void)dismissWithCompletion:(void (^)(RightPullDownMenu *object))completion;
//更新图片
- (void)uploadSelectedTextArr:(NSArray *)textArr;
@end

