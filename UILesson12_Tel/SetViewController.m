//
//  SetViewController.m
//  UILesson12_Tel
//
//  Created by 刘阳 on 15/9/9.
//  Copyright (c) 2015年 lanou. All rights reserved.
//

#import "SetViewController.h"
#import "AddView.h"
#import "Person.h"
#import "SingleDat.h"

@interface SetViewController ()<UIImagePickerControllerDelegate>

@property (nonatomic, strong) AddView *sv;

@end

@implementation SetViewController

- (void)loadView{
    
    self.sv = [[AddView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = _sv;
    
}



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    Person *p = [[SingleDat shareDateHandle] searchPerson:_indexPath];
    
    self.sv.nameTextField.text = p.name;
    
    self.sv.telTextField.text = p.tel;
    
    self.sv.mailTextField.text = p.mail;
    
    self.sv.infoTextView.text = p.info;
    
    self.sv.headImageView.image = p.headIamge;
    
    // 设置
    self.sv.nameTitleLabel.text = @"姓名";
    
    self.sv.telTitleLabel.text = @"电话";
    
    self.sv.mailTitleLabel.text = @"短信";
    
    self.sv.infoTitelLabel.text = @"详情";
    
    [self.sv.finishButton setTitle:@"确定" forState:(UIControlStateNormal)];
    
    [self.sv.cancelButton setTitle:@"取消" forState:(UIControlStateNormal)];
    
    // button 事件
    [self.sv.cancelButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.sv.finishButton addTarget:self action:@selector(finishButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    // 打开交互
    self.sv.headImageView.userInteractionEnabled = YES;
    
    // 轻拍手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    
    // 给图片添加轻拍手势
    [self.sv.headImageView addGestureRecognizer:tap];
    
}

- (void)tapAction:(UIButton *)sender{
    
    // 初始化相册控制器
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    // 允许编辑
    picker.allowsEditing = YES;
    
    // 数据源
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    // 设置代理
    picker.delegate = self;
    
    [self presentViewController:picker animated:YES completion:^{}];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    // 取到编辑好的image
    UIImage *i = info[UIImagePickerControllerEditedImage];
    
    // 给编辑好的image赋值
    self.sv.headImageView.image = i;
    
    // 取消模态
    [self dismissViewControllerAnimated:YES completion:nil];
    
}




#pragma mark - 响应事件

- (void)cancelButtonAction:(UIButton *)sender{
    
    [self dismissViewControllerAnimated:YES completion:^{}];
    
}

- (void)finishButtonAction:(UIButton *)sender{
    
    // 回传值
    Person *p = [[SingleDat shareDateHandle]searchPerson:_indexPath];
    
    p.name = self.sv.nameTextField.text;
    
    p.tel = self.sv.telTextField.text;
    
    p.mail = self.sv.mailTextField.text;
    
    p.info = self.sv.infoTextView.text;
    
    p.headIamge = self.sv.headImageView.image;
    
    // 回去
    [self dismissViewControllerAnimated:YES completion:^{}];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
