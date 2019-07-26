//
//  PublisherDetailsViewController.m
//  AnHuo321
//
//  Created by 吕书涛 on 2019/3/30.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "PublisherDetailsViewController.h"
#import "HomeCollectionViewCell.h"
#import "HomeModel.h"

@interface PublisherDetailsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSString *str;
    NSArray *imgarr;
    
    UISearchBar *_customSearchBar;
    
    NSInteger number;
    NSInteger page;
}
@property (nonatomic, strong) UIView *headerV;
@property (nonatomic, strong) UIView *headerBgView;

@property(nonatomic,strong)NSMutableArray *dataArray;
/** 换成集合视图 **/
@property (nonatomic, strong) UICollectionView *collectionView;

kPropertyStrong(UIImageView, txImg);
kPropertyStrong(UIButton, emsBtn);
kPropertyStrong(UIButton, guBtn);
kPropertyStrong(UILabel, niknamelab);
kPropertyStrong(UILabel, finslab);
kPropertyStrong(UILabel, timelab);

kPropertyStrong(UILabel, userlab1);
kPropertyStrong(UILabel, userlab2);
kPropertyStrong(UILabel, userlab3);
kPropertyStrong(UILabel, userlab4);

@end

@implementation PublisherDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    [self.view addSubview:self.collectionView];
    [self setUserInfo];
    [self setUpRefresh];
}
- (void)setUpRefresh{
    LRWeakSelf(self);
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf lodA];
    }];
    [self.collectionView.mj_header beginRefreshing];
    self.collectionView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        if (weakSelf.dataArray.count == self->number) {
            [weakSelf.collectionView.mj_footer setState:MJRefreshStateNoMoreData];
        }else {
            [weakSelf lodB];
        }
    }];
}
- (void)lodA{
    page = 1;
    [self.collectionView.mj_footer endRefreshing];
    LRWeakSelf(self);
    NSDictionary *dic = @{@"page":[NSString stringWithFormat:@"%ld",page],
                          @"rows":@"12",
                          @"sid":self.sidStr
                          };
    [Manager post:self.sidStr RequestParams:dic FinishBlock:^(NSURLResponse * _Nonnull response, NSData * _Nonnull data, NSError * _Nonnull connectionError) {
        NSDictionary *dict = [Manager returndictiondata:data];
        NSLog(@"---------%@",dict);
        NSDictionary *userDic = [dict objectForKey:@"dataForUser"];

        dispatch_async(dispatch_get_global_queue(0,0),^{
            weakSelf.niknamelab.text = [NSString stringWithFormat:@"(昵称：%@)",[userDic objectForKey:@"nickname"]];
            weakSelf.userlab1.text = [NSString stringWithFormat:@"成交率：%@%%",[userDic objectForKey:@"turnoverRate"]];
            weakSelf.userlab2.text = [NSString stringWithFormat:@"卖家级别：%@",[userDic objectForKey:@"sellerRank"]];
            weakSelf.userlab3.text = [NSString stringWithFormat:@"综合信誉：%@",[userDic objectForKey:@"sellerCredit"]];
            weakSelf.finslab.text = [NSString stringWithFormat:@"粉丝数量：%@个",[userDic objectForKey:@"fans"]];
            weakSelf.timelab.text = [NSString stringWithFormat:@"发布时间：%@",[userDic objectForKey:@"reg_date"]];
//            weakSelf.userlab4.text = [NSString stringWithFormat:@"发布物品：%@%%",[userDic objectForKey:@"turnoverRate"]];
            
            
            self->number = [[dict objectForKey:@"total"] integerValue];
            [weakSelf.dataArray removeAllObjects];
            for (NSDictionary *diction in [dict objectForKey:@"dataForProduct"]) {
                HomeModel *model = [HomeModel mj_objectWithKeyValues:diction];
                [weakSelf.dataArray addObject:model];
            }
            self->page++;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.collectionView reloadData];
                [weakSelf.collectionView.mj_header endRefreshing];
            });
        });
        
    }];
    
}
- (void)lodB{
    [self.collectionView.mj_header endRefreshing];
    LRWeakSelf(self);
    NSDictionary *dic = @{@"page":[NSString stringWithFormat:@"%ld",page],
                          @"rows":@"12",
                          };
    [Manager post:self.sidStr RequestParams:dic FinishBlock:^(NSURLResponse * _Nonnull response, NSData * _Nonnull data, NSError * _Nonnull connectionError) {
        NSDictionary *dict = [Manager returndictiondata:data];
        //NSLog(@"---------%@",dict);
        dispatch_async(dispatch_get_global_queue(0,0),^{
            for (NSDictionary *diction in [dict objectForKey:@"dataForProduct"]) {
                HomeModel *model = [HomeModel mj_objectWithKeyValues:diction];
                [weakSelf.dataArray addObject:model];
            }
            self->page++;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.collectionView reloadData];
                [weakSelf.collectionView.mj_footer endRefreshing];
            });
        });
    }];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    LRViewBorderRadius(cell.contentView, 0, .25, COLOR);
    cell.img.contentMode = UIViewContentModeScaleAspectFit;
    LRViewBorderRadius(cell.img, 5, 0, UIColor.clearColor);
    
    HomeModel *model = [self.dataArray objectAtIndex:indexPath.row];
    [cell.img sd_setImageWithURL:[NSURL URLWithString:model.imageSrc]];
    cell.lab.text = model.title;
    
    
    return cell;
}

//collectionView
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout.alloc init];
        flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH/2, 240);
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;//竖直方向
        flowLayout.sectionInset = UIEdgeInsetsZero;
        _collectionView = [UICollectionView.alloc initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerNib:[UINib nibWithNibName:@"HomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
        [_collectionView registerClass:UICollectionReusableView.class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    }
    return _collectionView;
}
//-----------------------顶部轮播图-----------------------
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(SCREEN_WIDTH, self.headerV.frame.size.height);
    }
    return CGSizeZero;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        [header addSubview: self.headerV];
        return header;
    }
    return [UICollectionReusableView new];
}

- (UIView *)headerV {
    if (!_headerV) {
        _headerV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 270)];
        _headerV.backgroundColor = COLOR;
        [_headerV addSubview:self.headerBgView];
    }
    return _headerV;
}
- (UIView *)headerBgView{
    if (!_headerBgView) {
        _headerBgView = [AHControll viewWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 250) viewColor:UIColor.whiteColor];
        LRViewBorderRadius(_headerBgView, 10, 0, UIColor.clearColor);
    }
    return _headerBgView;
}



- (void)setUserInfo{
    _txImg = [AHControll createImageViewWithFrame:CGRectMake(10, 50, 100, 150) ImageName:@""];
    _txImg.backgroundColor = UIColor.redColor;
    [self.headerBgView addSubview:self.txImg];
    
    _niknamelab =[AHControll createLabelWithFrame:CGRectMake(120, 10, SCREEN_WIDTH-130, 30) Font:17 Text:@"" textColor:UIColor.blackColor NSTextAlignment:NSTextAlignmentLeft];
    [self.headerBgView addSubview:self.niknamelab];
    
    _userlab1 = [AHControll createLabelWithFrame:CGRectMake(120, 50, (SCREEN_WIDTH-130)/2, 30) Font:16 Text:@"" textColor:UIColor.darkGrayColor NSTextAlignment:NSTextAlignmentLeft];
    [self.headerBgView addSubview:self.userlab1];
    
    _userlab2 = [AHControll createLabelWithFrame:CGRectMake(120+(SCREEN_WIDTH-130)/2, 50, (SCREEN_WIDTH-130)/2, 30) Font:16 Text:@"" textColor:UIColor.darkGrayColor NSTextAlignment:NSTextAlignmentLeft];
    [self.headerBgView addSubview:self.userlab2];
    
    _userlab3 = [AHControll createLabelWithFrame:CGRectMake(120, 90, (SCREEN_WIDTH-130)/2, 30) Font:16 Text:@"" textColor:UIColor.darkGrayColor NSTextAlignment:NSTextAlignmentLeft];
    [self.headerBgView addSubview:self.userlab3];
    
    _userlab4 = [AHControll createLabelWithFrame:CGRectMake(120+(SCREEN_WIDTH-130)/2, 90, (SCREEN_WIDTH-130)/2, 30) Font:16 Text:@"" textColor:UIColor.darkGrayColor NSTextAlignment:NSTextAlignmentLeft];
    [self.headerBgView addSubview:self.userlab4];
    
    
    _finslab = [AHControll createLabelWithFrame:CGRectMake(120, 130, (SCREEN_WIDTH-130), 30) Font:14 Text:@"" textColor:UIColor.darkGrayColor NSTextAlignment:NSTextAlignmentLeft];
    [self.headerBgView addSubview:self.finslab];
    
    _timelab = [AHControll createLabelWithFrame:CGRectMake(120, 170, (SCREEN_WIDTH-130), 30) Font:14 Text:@"" textColor:UIColor.darkGrayColor NSTextAlignment:NSTextAlignmentLeft];
    [self.headerBgView addSubview:self.timelab];
    self.emsBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    self.emsBtn.backgroundColor =[UIColor blueColor];
    [self.headerBgView addSubview:self.emsBtn];
    [self.emsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.txImg.mas_right).offset(width(5));
        make.top.mas_equalTo(self.timelab.mas_bottom).offset(height(15));
        make.width.mas_equalTo(width(40));
        make.height.mas_equalTo(height(30));
    }];
    self.guBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    self.guBtn.backgroundColor =[UIColor blueColor];
    [self.headerBgView addSubview:self.guBtn];
    [self.guBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.emsBtn.mas_right).offset(width(25));
        make.centerY.mas_equalTo(self.emsBtn.mas_centerY);
        make.width.mas_equalTo(width(30));
        make.height.mas_equalTo(height(30));
    }];
}


- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        self.dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataArray;
}
@end
