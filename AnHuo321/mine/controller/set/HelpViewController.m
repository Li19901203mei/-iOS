//
//  HelpViewController.m
//  AnHuo321
//
//  Created by 二恒 on 2019/7/25.
//  Copyright © 2019 macbookpro. All rights reserved.
//

#import "HelpViewController.h"
#import "AboutTableViewCell.h"
#import "AboutXiangViewController.h"
@interface HelpViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * helpTableView;

@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    self.helpTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    _helpTableView.delegate =self;
    _helpTableView.dataSource= self;
    [_helpTableView registerClass:[AboutTableViewCell class] forCellReuseIdentifier:@"AboutTableViewCell"];
    [self.view addSubview:self.helpTableView];
    
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AboutTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"AboutTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section==0) {
        cell.leftLable.text =@"如何购买";
    }else if (indexPath.section==1) {
        cell.leftLable.text =@"注意事项";
    }else if (indexPath.section==2) {
        cell.leftLable.text =@"交易须知";
    }else{
        cell.leftLable.text =@"常见问题";
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
        xiangVC.title = @"如何购买";
        xiangVC.xiangStr = @"1.发布交易\n注册/登录——点击我的交易——发布交易——填入详情——发布交易\n2.购买交易物\n进入网站首页——点击感兴趣物品——进入交易界面——进行报价\n3.支付方式\n点击我的交易——账户信息——在线充值（支付宝）——进行交易相关行为\n4.退换交易物\n点击我的交易——点击我买到的——点击退货订单——进行退货";
        [self.navigationController pushViewController:xiangVC animated:YES];
    }else if(indexPath.section==1){
        AboutXiangViewController * VC1 =[[AboutXiangViewController alloc]init];
        VC1.title = @"注意事项";
        VC1.xiangStr = @"   在使用321AH平台各项服务前，请您务必仔细阅读并透彻理解本声明。您可以选择不使用321AH平台服务，但如果您使用321AH平台服务的，您的使用行为将被视为对本声明全部内容的认可。\n任何单位或个人认为321AH平台网页内容（包括但不限于321AH平台会员发布的商品信息）可能涉嫌侵犯其合法权益，应该及时向321AH提出书面权利通知，并提供身份证明、权属证明、具体链接（URL）及详细侵权情况证明。321AH在收到上述法律文件后，将会依法尽快移除相关涉嫌侵权的内容。\n在您开始注册之前，请先阅读以下条款：\n a） 遵守中华人民共和国法律法令和其他相关法规，不可发布破坏宪法和法律、法规的信息。\nb）遵守公安部关于《计算机信息网络国际联网安全保护管理办法》的规定，自觉维护计算机信息网络的安全。\nc）不得在网上宣扬封建迷信、淫秽、色情、暴力、赌博等不正当行为。\nd）企业或个人发布的信息要真实有效、准确完整，并不得有引人误解或者虚假的陈述。\ne）申请人必须填写详细、真实信息，如企业 / 单位名称、简介、地址、电话等。因信息填写不真实、不完整或填写错误的本网站不予以发表或对该项问题产生的后果不负责任。\nf）用户注册成功后，请妥善保管您的用户名和密码，以备下次发布、修改信息使用。\n知识产权声明\na）321AH拥有321AH平台网站内所有信息内容（包括但不限于文字、图片、软件、音频、视频）的版权。\nb）任何被授权的浏览、复制、打印和传播属于321AH平台网站内信息内容都不得用于商业目的且所有信息内容及其任何部分的使用都必须包括此版权声明；\nc）321AH平台所有的产品、技术与所有程序均属于321AH知识产权。未经321AH许可，任何人不得擅自（包括但不限于：以非法的方式复制、传播、展示、镜像、上载、下载）使用。否则，321AH将依法追究法律责任。\n隐私权政策\n321AH尊重并保护所有使用本平台服务用户的个人隐私权。为了给您提供更准确、更有个性化的服务，321AH会按照本隐私权政策的规定使用和披露您的个人信息。但321AH将以高度的勤勉、审慎义务对待这些信息。除本隐私权政策另有规定外，在未征得您事先许可的情况下，321AH不会将这些信息对外披露或向第三方提供。321AH会不时更新本隐私权政策。 您在同意321AH服务协议之时，即视为您已经同意本隐私权政策全部内容。本隐私权政策属于321AH服务协议不可分割的一部分。\n适用范围\na） 在您注册或激活可以登录321AH平台的账户时，您在321AH平台提供的个人注册信息（应法律法规要求需公示的企业名称等相关工商注册信息以及自然人经营者的信息除外）；\nb） 在您使用321AH平台服务，或访问321AH平台网页时，321AH自动接收并记录的您的浏览器和计算机上的信息，包括但不限于您的IP地址、浏览器的类型、使用的语言、访问日期和时间、软硬件特征信息及您需求的网页记录等数据；如您下载或使用321AH或其关联公司移动客户端软件，或访问移动网页使用321AH平台服务时，321AH可能会读取与您位置和移动设备相关的信息，包括但不限于设备型号、设备识别码、操作系统、分辨率、电信运营商等。\nc） 321AH通过合法途径从商业伙伴处取得的用户个人数据。\n您了解并同意，以下信息不适用本隐私权政策：\na）您在使用321AH平台提供的搜索服务时输入的关键字信息；\nb）信用评价、违反法律规定或违反321AH规则行为及321AH已对您采取的措施。\n信息安全\na) 您的账户均有安全保护功能，请妥善保管您的账户及密码信息。淘宝将通过向其它服务器备份、对用户密码进行加密等安全措施确保您的信息不丢失，不被滥用和变造。尽管有前述安全措施，但同时也请您注意在信息网络上不存在“完善的安全措施”。\nb) 在使用321AH平台服务进行网上交易时，您不可避免的要向交易对方或潜在的交易对方披露自己的个人信息，如联络方式或者邮政地址。请您妥善保护自己的个人信息，仅在必要的情形下向他人提供。如您发现自己的个人信息泄密，尤其是你的账户及密码发生泄露，请您立即联络321AH客服，以便321AH采取相应措施。";
        [self.navigationController pushViewController:VC1 animated:YES];
    }else if (indexPath.section==2){
        AboutXiangViewController * VC2 =[[AboutXiangViewController alloc]init];
        VC2.title = @"交易须知";
        VC2.xiangStr = @"321AH交易须知\n为了维护321AH网正常运营秩序，推动非实物交易的繁荣，保障需求顺利进行，请仔细阅读根据《321AH交易须知》以保障自身权益。\n第一条 为了维护321AH网正常运营秩序，推动非实物交易的繁荣，保障需求顺利进行，根据《321AH交易须知》，制定本规则。\n第二条　卖家展示信息需要符合国家法律法规以及321AH网其它相关规定。\n第三条 321AH网仅向用户提供相关技术和服务，不对买卖家展示的物品承担任何品质及权利保证责任；\n第四条 321AH网不承担对用户上传物品的有关事项进行事先审查的义务。321AH网仅以普通或者非专业人员的知识水平标准对用户提交的证据材料进行辨别；\n第五条  321AH网仅提供展示、交易的平台，不对参与者行为的合法性、有效性及交易品的真实性、合法性和有效性作任何明示或暗示的担保；\n第六条  用户信息发布规范适用于在321AH网所有用户，用户信息需通过321AH网审核后才能成功发布；\n第七条  321AH网禁止发布违反宪法精神和中华人民共和国相关法律法规、带有民族歧视性、夸大宣传并带有欺骗性、有损于社会主义道德风尚或者有其他不良影响的信息，包括但不限于以下情形：\n一、含有非平台业务的广告、招聘类内容；\n二、泄露个人隐私或企业内部数据（含个人联系方式、个人手机定位、电话清单查询、银行账户查询等内容）；\n三、涉黄、赌博、暴力等内容；\n四、任何有损网络安全的服务：木马、黑客程序、破网、翻墙软件等；\n五、非法传销类服务；\n六、侵犯第三方知识产权的服务：软件/程序破解类服务、游戏/程序外挂类服务、盗取网银/游戏账号、抄袭/盗用他人图片等；\n七、政治敏感信息、出现或映射种族歧视、宗教歧视的内容；\n第八条 卖家出售均应保持标题、主图、详情、类目、属性内容一致，禁止出现商品标题、图片、价格、物流方式、邮费及售后服务等商品要素之间明显不匹配的情况。\n第九条 您须将您的服务商品归入正确的类目内，平台不对交易物描述的准确性或内容负责。\n第十条 您同意不利用帮助实现蒙蔽或欺骗意图的任何人，操纵或进行虚假交易。\n第十一条 您同意不得使用任何装置、软件或例行程序干预或试图干预平台的正常运作或正在平台上进行的任何交易；\n第十二条 平台不主动干涉用户间因交易而产生的法律关系及法律纠纷，不会主动介入交易各方的交易当中。倘若您与一名或一名以上用户，或与您通过平台获取其服务的第三者服务供应商发生争议，您同意免除平台(及平台代理人和雇员)在因该等争议而引起的，或在任何方面与该等争议有关的不同种类和性质的任何(实际和后果性的)权利主张、要求和损害赔偿等方面的责任；\n第十三条 您保证其所有服务内容应完全符合中国有关法律、法规、行政规章等的规定。如因您违反上述规定给平台带来任何损害，您应承担所有法律责任并赔偿由此给客户造成的损失，平台保有索偿权。\n第十四条 免责声明\n一、您申请并通过成为开放平台的帐号是您登录及使用本服务的凭证，您应当做好该账号密码保密措施。因您保密措施不当或您的其他行为，致使密码丢失或泄漏所引起的一切损失和后果，均由您自行承担；若您发现有他人冒用或盗用您的帐号及密码、或任何其他未经您合法授权的情形时，应立即以有效方式通知平台（包括但不限于提供您的身份信息和相关身份资料、相关事实情况及您的要求等）。平台收到您的有效请求并核实身份后，会根据不同情况采取相应措施。若您提供的信息不完全，导致321AH网无法核实您的身份或无法判断您的需求等，而导致321AH网无法进行及时处理，给您带来的损失，您应自行承担。同时，平台对您的请求采取措施需要合理期限，平台根据您的有效通知采取措施之前，由于他人行为给您造成的损失，平台不承担任何责任。\n二、你理解并同意，平台的服务是按照现有技术和条件所能达到的现状提供的。平台会尽最大努力向你提供服务，确保服务的连贯性和安全性；但平台不能保证其所提供的服务毫无瑕疵，也无法随时预见和防范法律、技术以及其他风险，包括但不限于不可抗力、病毒、木马、黑客攻击、系统不稳定、第三方服务瑕疵、政府行为等原因可能导致的服务中断、数据丢失以及其他的损失和风险。所以你也同意：即使平台提供的服务存在瑕疵，但上述瑕疵是当时行业技术水平所无法避免的，其将不被视为321AH网违约，同时，由此给你造成的数据或信息丢失等损失的，你同意放弃追究平台的责任。\n第十五条 协议的生效、中止与终止\n一、本协议自同意勾选加入平台，发布交易后即日生效。\n二、您与本平台应本着诚实信用的原则履行本协议。任何一方在履约过程中违反协议约定的，另一方均可以终止本协议。\n三、如您不同意321AH网对本协议的修改，平台有权随时中止或终止向你提供本服务。\n四、因不可抗力因素导致你无法继续使用本协议或平台无法提供本协议服务，平台有权随时终止协议。\n五、因市场环境发生变化，321AH网取消本协议所约定业务时，321AH网站可单方终止本协议。";
        [self.navigationController pushViewController:VC2 animated:YES];
    }else{
        AboutXiangViewController * VC =[[AboutXiangViewController alloc]init];
        VC.title = @"常见问题";
        VC.xiangStr = @"1.发布交易时，请尽量填写具体信息，可以提高交易效率。\n2.满意度和信用金是两个重要的参考指标，可以提现卖家和买家的信用。\n3.及时保存证据，如照片，截图，视频录像等，一旦出现问题，可以依靠这些保证自身利益。";
        [self.navigationController pushViewController:VC animated:YES];
    }
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
