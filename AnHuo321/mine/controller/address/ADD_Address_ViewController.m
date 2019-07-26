//
//  ADD_Address_ViewController.m
//  英德格斯
//
//  Created by ilovedxracer on 2018/12/25.
//  Copyright © 2018 吕书涛. All rights reserved.
//

#import "ADD_Address_ViewController.h"
#import "BRTextField.h"
#import "BRAddressPickerView.h"
#import "FeedBackTextView.h"
#import "ProvincesViewController.h"
@interface ADD_Address_ViewController ()<UITextFieldDelegate>
@property (nonatomic, strong)UIButton *addressBtn;
@property(nonatomic,strong)FeedBackTextView * xiangTextView;
@property(nonatomic,strong)FeedBackTextView * emsTextView;
@property(nonatomic,strong)FeedBackTextView * nameTextView;
@property(nonatomic,strong)FeedBackTextView * jiaoTextView;
@property(nonatomic,strong)FeedBackTextView * phoneTextView;
@property(nonatomic,copy)NSString * province_id;
@property(nonatomic,copy)NSString * city_id;
@property(nonatomic,copy)NSString * area_id;
@property(nonatomic,copy)NSString *defaultStr;
@property(nonatomic,assign)BOOL isYes;
@end

@implementation ADD_Address_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isYes=YES;
    self.view.backgroundColor = [UIColor whiteColor];
    _addressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _addressBtn.backgroundColor = [UIColor whiteColor];
    _addressBtn.titleLabel.font = VPFont(height(15));
    //_addressBtn.titleLabel.text = @"请选择";
    if (self.editCount==100) {
        [self.addressBtn setTitle:[NSString stringWithFormat:@"%@%@%@",self.dataDic[@"province_name"],self.dataDic[@"city_name"],self.dataDic[@"area_name"]] forState:0];
    }else{
    [self.addressBtn setTitle:@"请选择" forState:0];
    } _addressBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_addressBtn setTitleColor:BassColor(51, 51, 51) forState:0];
    //_addressTF.delegate = self;
    [self.view addSubview:_addressBtn];
    [self.addressBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(width(10));
        make.top.mas_equalTo(self.view).offset(NavHeight+height(10));
        make.right.mas_equalTo(self.view.mas_right).offset(-width(10));
        make.height.mas_equalTo(height(40));
    }];
    self.addressBtn.layer.borderColor = BassColor(210, 211, 212).CGColor;
    self.addressBtn.layer.borderWidth=1;
     __weak typeof(self) weakSelf = self;
    
    [[_addressBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
//        // 【转换】：以@" "子字符串为基准将字符串分离成数组，如：@"浙江省 杭州市 西湖区" ——》@[@"浙江省", @"杭州市", @"西湖区"]
//        //NSArray *defaultSelArr = [weakSelf.addressBtn.titleLabel.text componentsSeparatedByString:@"北京市 北京市 东城区"];
//        [BRAddressPickerView showAddressPickerWithShowType:BRAddressPickerModeArea defaultSelected:@[@"北京市", @"北京市", @"东城区"] isAutoSelect:YES themeColor:nil resultBlock:^(BRProvinceModel *province, BRCityModel *city, BRAreaModel *area) {
//           // weakSelf.addressBtn.titleLabel.text = ;
//            [weakSelf.addressBtn setTitle:[NSString stringWithFormat:@"%@ %@ %@", province.name, city.name, area.name] forState:0];
//        } cancelBlock:^{
//            NSLog(@"点击了背景视图或取消按钮");
//        }];
        ProvincesViewController * proVC =[[ProvincesViewController alloc]init];
        proVC.title=@"省";
        [self.navigationController pushViewController:proVC animated:YES];
    }];
    UIImageView * img =[[UIImageView alloc]init];
    img.backgroundColor =[UIColor redColor];
    [self.view addSubview:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.addressBtn.mas_left).offset(width(5));
        make.top.mas_equalTo(self.addressBtn.mas_bottom).offset(height(5));
        make.height.width.mas_equalTo(15);
    }];
    UILabel * lab=[[UILabel alloc]init];
    lab.textColor = BassColor(200, 201, 202);
    lab.text = @"请选择省市区";
    lab.font = VPFont(height(13));
    [self.view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(img.mas_right).offset(width(10));
        make.centerY.mas_equalTo(img.mas_centerY);
        make.height.mas_equalTo(height(16)); make.right.mas_equalTo(self.view.mas_right).offset(-width(20));
    }];
    self.xiangTextView = [[FeedBackTextView alloc]init];
    self.xiangTextView.backgroundColor = BassColor(255, 255, 255);
    [self.view addSubview:self.xiangTextView];
    self.xiangTextView.font = VPFont(height(14));
    if (self.editCount==100) {
      self.xiangTextView.text = [NSString stringWithFormat:@"%@",self.dataDic[@"address"]];
    }else{
       self.xiangTextView.placeholder = @"请填写详细地址";
    }
    
    //self.biaoTextView.delegate = self;
    self.xiangTextView.placeholderFont = VPFont(height(14));
    self.xiangTextView.placeholderColor = [UIColor lightGrayColor];
    [self.xiangTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(width(10));
        make.top.mas_equalTo(img.mas_bottom).offset(height(20));
        make.right.mas_equalTo(self.view.mas_right).offset(-width(10));
        make.height.mas_equalTo(height(60));
    }];
    _xiangTextView.layer.borderColor =BassColor(210, 211, 212).CGColor;
    _xiangTextView.layer.borderWidth =1;
    UIImageView * img1 =[[UIImageView alloc]init];
    img1.backgroundColor =[UIColor redColor];
    [self.view addSubview:img1];
    [img1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.xiangTextView.mas_left).offset(width(5));
        make.top.mas_equalTo(self.xiangTextView.mas_bottom).offset(height(5));
        make.height.width.mas_equalTo(15);
    }];
    UILabel * lab1=[[UILabel alloc]init];
    lab1.textColor = BassColor(200, 201, 202);
    lab1.text = @"请填写详细地址";
    lab1.font = VPFont(height(13));
    [self.view addSubview:lab1];
    [lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(img1.mas_right).offset(width(10));
        make.centerY.mas_equalTo(img1.mas_centerY);
        make.height.mas_equalTo(height(16)); make.right.mas_equalTo(self.view.mas_right).offset(-width(20));
    }];
    
    self.emsTextView = [[FeedBackTextView alloc]init];
    self.emsTextView.backgroundColor = BassColor(255, 255, 255);
    [self.view addSubview:self.emsTextView];
    self.emsTextView.font = VPFont(height(14));
    if (self.editCount==100) {
        self.emsTextView.text = [NSString stringWithFormat:@"%@",self.dataDic[@"postalcode"]];
    }else{
    self.emsTextView.placeholder = @"请填写邮编";
    }
    
    //self.biaoTextView.delegate = self;
    self.emsTextView.placeholderFont = VPFont(height(14));
    self.emsTextView.placeholderColor = [UIColor lightGrayColor];
    [self.emsTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(width(10));
        make.top.mas_equalTo(img1.mas_bottom).offset(height(20));
        make.right.mas_equalTo(self.view.mas_right).offset(-width(10));
        make.height.mas_equalTo(height(40));
    }];
    self.emsTextView.layer.borderColor =BassColor(210, 211, 212).CGColor;
    self.emsTextView.layer.borderWidth =1;
    UIImageView * img2 =[[UIImageView alloc]init];
    img2.backgroundColor =[UIColor redColor];
    [self.view addSubview:img2];
    [img2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.emsTextView.mas_left).offset(width(5));
        make.top.mas_equalTo(self.emsTextView.mas_bottom).offset(height(5));
        make.height.width.mas_equalTo(15);
    }];
    UILabel * lab2=[[UILabel alloc]init];
    lab2.textColor = BassColor(200, 201, 202);
    lab2.text = @"请填写邮编";
    lab2.font = VPFont(height(13));
    [self.view addSubview:lab2];
    [lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(img2.mas_right).offset(width(10));
        make.centerY.mas_equalTo(img2.mas_centerY);
        make.height.mas_equalTo(height(16)); make.right.mas_equalTo(self.view.mas_right).offset(-width(20));
    }];
    
    self.nameTextView = [[FeedBackTextView alloc]init];
    self.nameTextView.backgroundColor = BassColor(255, 255, 255);
    [self.view addSubview:self.nameTextView];
    self.nameTextView.font = VPFont(height(14));
    
    if (self.editCount==100) {
        self.nameTextView.text = [NSString stringWithFormat:@"%@",self.dataDic[@"truename"]];
    }else{
        self.nameTextView.placeholder = @"请输入你的中文姓名";
    }
    //self.biaoTextView.delegate = self;
    self.nameTextView.placeholderFont = VPFont(height(14));
    self.nameTextView.placeholderColor = [UIColor lightGrayColor];
    [self.nameTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(width(10));
        make.top.mas_equalTo(img2.mas_bottom).offset(height(20));
        make.right.mas_equalTo(self.view.mas_right).offset(-width(10));
        make.height.mas_equalTo(height(40));
    }];
    self.nameTextView.layer.borderColor =BassColor(210, 211, 212).CGColor;
    self.nameTextView.layer.borderWidth =1;
    UIImageView * img3 =[[UIImageView alloc]init];
    img3.backgroundColor =[UIColor redColor];
    [self.view addSubview:img3];
    [img3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameTextView.mas_left).offset(width(5));
        make.top.mas_equalTo(self.nameTextView.mas_bottom).offset(height(5));
        make.height.width.mas_equalTo(15);
    }];
    UILabel * lab3=[[UILabel alloc]init];
    lab3.textColor = BassColor(200, 201, 202);
    lab3.text = @"请输入你的中文姓名";
    lab3.font = VPFont(height(13));
    [self.view addSubview:lab3];
    [lab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(img3.mas_right).offset(width(10));
        make.centerY.mas_equalTo(img3.mas_centerY);
        make.height.mas_equalTo(height(16)); make.right.mas_equalTo(self.view.mas_right).offset(-width(20));
    }];
    
//    self.jiaoTextView = [[FeedBackTextView alloc]init];
//    self.jiaoTextView.backgroundColor = BassColor(255, 255, 255);
//    [self.view addSubview:self.jiaoTextView];
//    self.jiaoTextView.font = VPFont(height(14));
//    self.jiaoTextView.placeholder = @"主要用于交易通知";
//    //self.biaoTextView.delegate = self;
//    self.jiaoTextView.placeholderFont = VPFont(height(14));
//    self.jiaoTextView.placeholderColor = [UIColor lightGrayColor];
//    [self.jiaoTextView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.view).offset(width(10));
//        make.top.mas_equalTo(img3.mas_bottom).offset(height(20));
//        make.right.mas_equalTo(self.view.mas_right).offset(-width(10));
//        make.height.mas_equalTo(height(40));
//    }];
//    self.jiaoTextView.layer.borderColor =BassColor(210, 211, 212).CGColor;
//    self.jiaoTextView.layer.borderWidth =1;
//    UIImageView * img4 =[[UIImageView alloc]init];
//    img4.backgroundColor =[UIColor redColor];
//    [self.view addSubview:img4];
//    [img4 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.jiaoTextView.mas_left).offset(width(5));
//        make.top.mas_equalTo(self.jiaoTextView.mas_bottom).offset(height(5));
//        make.height.width.mas_equalTo(15);
//    }];
//    UILabel * lab4=[[UILabel alloc]init];
//    lab4.textColor = BassColor(200, 201, 202);
//    lab4.text = @"主要用于交易通知";
//    lab4.font = VPFont(height(13));
//    [self.view addSubview:lab4];
//    [lab4 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(img4.mas_right).offset(width(10));
//        make.centerY.mas_equalTo(img4.mas_centerY);
//        make.height.mas_equalTo(height(16)); make.right.mas_equalTo(self.view.mas_right).offset(-width(20));
//    }];
    
    self.phoneTextView = [[FeedBackTextView alloc]init];
    self.phoneTextView.backgroundColor = BassColor(255, 255, 255);
    [self.view addSubview:self.phoneTextView];
    self.phoneTextView.font = VPFont(height(14));
    
    if (self.editCount==100) {
        self.phoneTextView.text = [NSString stringWithFormat:@"%@",self.dataDic[@"mobile"]];
    }else{
      self.phoneTextView.placeholder = @"请输入你的联系电话";//，可为空
    }
    //self.biaoTextView.delegate = self;
    self.phoneTextView.placeholderFont = VPFont(height(14));
    self.phoneTextView.placeholderColor = [UIColor lightGrayColor];
    [self.phoneTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(width(10));
        make.top.mas_equalTo(img3.mas_bottom).offset(height(20));
        make.right.mas_equalTo(self.view.mas_right).offset(-width(10));
        make.height.mas_equalTo(height(40));
    }];
    self.phoneTextView.layer.borderColor =BassColor(210, 211, 212).CGColor;
    self.phoneTextView.layer.borderWidth =1;
    UIImageView * img5 =[[UIImageView alloc]init];
    img5.backgroundColor =[UIColor redColor];
    [self.view addSubview:img5];
    [img5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.phoneTextView.mas_left).offset(width(5));
        make.top.mas_equalTo(self.phoneTextView.mas_bottom).offset(height(5));
        make.height.width.mas_equalTo(15);
    }];
    UILabel * lab5=[[UILabel alloc]init];
    lab5.textColor = BassColor(200, 201, 202);
    lab5.text = @"请输入你的联系电话，可为空";
    lab5.font = VPFont(height(13));
    [self.view addSubview:lab5];
    [lab5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(img5.mas_right).offset(width(10));
        make.centerY.mas_equalTo(img5.mas_centerY);
        make.height.mas_equalTo(height(16)); make.right.mas_equalTo(self.view.mas_right).offset(-width(20));
    }];
    
    UIImageView * moImg =[[UIImageView alloc]init];
    moImg.backgroundColor =[UIColor redColor];
    [self.view addSubview:moImg];
    [moImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(img5.mas_left).offset(width(0));
        make.top.mas_equalTo(img5.mas_bottom).offset(height(30));
        make.height.width.mas_equalTo(15);
    }];
    UILabel * moLable =[[UILabel alloc]init];
    moLable.text = @"设置为默认收获地址";
    moLable.textColor = BassColor(110, 110, 110);
    moLable.font = VPFont(height(13));
    [self.view addSubview:moLable];
    
    [moLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(moImg.mas_right).offset(width(10));
        make.centerY.mas_equalTo(moImg.mas_centerY);
        make.height.mas_equalTo(height(16)); make.right.mas_equalTo(self.view.mas_right).offset(-width(20));
    }];
    
    UIButton * moBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    moBtn.backgroundColor =[UIColor clearColor];
    [self.view addSubview:moBtn];
    [moBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(width(10));
        make.centerY.mas_equalTo(moImg.mas_centerY);
        make.height.mas_equalTo(height(20)); make.right.mas_equalTo(self.view.mas_right).offset(-width(20));
    }];
    
    if (self.editCount==100) {
        self.defaultStr = [NSString stringWithFormat:@"%@",self.dataDic[@"default"]];
        self.province_id = [NSString stringWithFormat:@"%@",self.dataDic[@"province_id"]];;
        self.city_id = [NSString stringWithFormat:@"%@",self.dataDic[@"city_id"]];;
        self.area_id = [NSString stringWithFormat:@"%@",self.dataDic[@"area_id"]];;
    }else{
        self.defaultStr = @"1";
    }
    [[moBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        if (self.isYes==YES) {
            self.defaultStr = @"0";
            self.isYes=NO;
        }else{
            self.defaultStr = @"1";
            self.isYes=YES;
        }
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 60, 50);
    btn.backgroundColor = [UIColor clearColor];
    [btn setTitle:@"保存地址" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickSave) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem =rightItem;
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(countyname:) name:@"county" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chuanID:) name:@"chuanID" object:nil];
    if (self.editCount==100) {
        UIButton * deleteBtn =[UIButton buttonWithType:UIButtonTypeCustom];
       deleteBtn.backgroundColor = baseColor;
        [deleteBtn setTitle:@"删除地址" forState:UIControlStateNormal];
        [deleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [deleteBtn addTarget:self action:@selector(clickDelete) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:deleteBtn];
        [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.view).offset(width(20));
            make.top.mas_equalTo(moBtn.mas_bottom).offset(height(60));
            make.height.mas_equalTo(height(40)); make.right.mas_equalTo(self.view.mas_right).offset(-width(20));
        }];
    }
}
-(void)clickDelete{
     NSDictionary * deleteDic=@{@"id":[NSString stringWithFormat:@"%@",self.addID]};

[HttpTool post:KURLNSString(deleteAddress) dic:deleteDic success:^(id responce) {
    if ([responce[@"result"] intValue]==1) {
        [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
        
    }else{
        [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
    }
    [SVProgressHUD dismissWithDelay:1];
} faile:^(NSError *erroe) {
    //        [self showToastInView:self.view message:@"网络错误" duration:0.8];
}];
}
-(void)countyname:(NSNotification*)tion{
    [self.addressBtn setTitle:[NSString stringWithFormat:@"%@",tion.object] forState:0];
}
-(void)chuanID:(NSNotification*)noti{
    self.province_id = noti.object[0];
    self.city_id = noti.object[1];
    self.area_id = noti.object[2];
}
- (void)clickSave{
    NSDictionary * saveDic;
    NSString *urlStr;
    if (self.editCount==100) {
       urlStr =KURLNSString(editAddress); saveDic=@{@"province":self.province_id,@"city":self.city_id,@"area":self.area_id,@"full_address":self.xiangTextView.text,@"postalcode":self.emsTextView.text,@"truename":self.nameTextView.text,@"mobile":self.phoneTextView.text,@"default":self.defaultStr,@"id":[NSString stringWithFormat:@"%@",self.addID]};
    }else{
        urlStr =KURLNSString(addressnewAddress); saveDic=@{@"province":self.province_id,@"city":self.city_id,@"area":self.area_id,@"full_address":self.xiangTextView.text,@"postalcode":self.emsTextView.text,@"truename":self.nameTextView.text,@"mobile":self.phoneTextView.text,@"default":self.defaultStr};
    }
    
    [HttpTool post:urlStr dic:saveDic success:^(id responce) {
        if ([responce[@"result"] intValue]==1) {
            [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
           
        }else{
            [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",responce[@"data"]]];
        }
      [SVProgressHUD dismissWithDelay:1];
    } faile:^(NSError *erroe) {
        //        [self showToastInView:self.view message:@"网络错误" duration:0.8];
    }];
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
