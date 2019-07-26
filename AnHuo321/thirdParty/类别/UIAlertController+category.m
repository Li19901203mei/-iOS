//
//  UIAlertController+category.m
//  IntelligenceStudents
//
//  Created by xiaoshunliang on 2016/12/14.
//  Copyright © 2016年 GaoJuan. All rights reserved.
//

#import "UIAlertController+category.h"
@implementation UIAlertController (category)

+ (void)showPhotoAlerControllerPicker:(UIImagePickerController *)picker controller:(UIViewController *)controller{
    UIAlertController *alerSheet = [UIAlertController alertControllerWithTitle:nil message:@"选择照片" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *album = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDestructive  handler:^(UIAlertAction * _Nonnull action) {
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        [controller.navigationController presentViewController:picker animated:YES completion:nil];
    }];
    UIAlertAction *pictures = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [controller.navigationController presentViewController:picker animated:YES completion:nil];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [pictures setValue:BaseTheme_Colore forKey:@"titleTextColor"];
    [album setValue:BaseTheme_Colore forKey:@"titleTextColor"];
    [cancel setValue:[UIColor redColor] forKey:@"titleTextColor"];
    
    [alerSheet addAction:album];
    [alerSheet addAction:pictures];
    [alerSheet addAction:cancel];
    [controller presentViewController:alerSheet animated:YES completion:nil];
}

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message controller:(UIViewController *)controller block:(void (^)(NSInteger buttonIndex))inblock cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了alert的取消按钮");
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:otherButtonTitles style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        inblock(1);//给确定按钮传个buttonIndex 调用block
    }];
    [okAction setValue:[UIColor colorWithHexString:@"#191919"] forKey:@"titleTextColor"];
    [cancleAction setValue:[UIColor colorWithHexString:@"#191919"] forKey:@"titleTextColor"];
    [alertController addAction:cancleAction];
    [alertController addAction:okAction];
    
    NSMutableAttributedString *ti = [[NSMutableAttributedString alloc]initWithString:title];
    [ti addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, ti.length)];
    [alertController setValue:ti forKey:@"attributedTitle"];
    
    NSMutableAttributedString *msg = [[NSMutableAttributedString alloc]initWithString:message];
    [msg addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, msg.length)];
    [alertController setValue:msg forKey:@"attributedMessage"];
   
    [controller presentViewController:alertController animated:YES completion:nil];
}

@end
