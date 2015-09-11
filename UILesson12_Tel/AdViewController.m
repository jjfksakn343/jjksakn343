//
//  AdViewController.m
//  UILesson12_Tel
//
//  Created by 刘阳 on 15/9/9.
//  Copyright (c) 2015年 lanou. All rights reserved.
//

#import "AdViewController.h"
#import "AddView.h"
#import "Person.h"
#import "SingleDat.h"
@interface AdViewController ()<UIImagePickerControllerDelegate>

@property (nonatomic, strong) AddView *av;

@end

@implementation AdViewController

- (void)loadView{
    
    self.av = [[AddView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = _av;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
  // 添加固定标题
    self.av.nameTitleLabel.text = @"姓名";
    
    self.av.telTitleLabel.text = @"电话";
    
    self.av.mailTitleLabel.text = @"邮箱";
    
    self.av.infoTitelLabel.text = @"详情";
    
    [self.av.cancelButton setTitle:@"取消" forState:(UIControlStateNormal)];
    
    [self.av.finishButton setTitle:@"完成" forState:(UIControlStateNormal)];
    
    // 给取消按钮添加点击事件
    [self.av.cancelButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
     // 给完成按钮添加点击事件
    [self.av.finishButton addTarget:self action:@selector(finishButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    // 打开交互
    self.av.headImageView.userInteractionEnabled = YES;
    
    // 轻拍手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    
    // 给headImageView加轻拍手势
    [self.av.headImageView addGestureRecognizer:tap];
    
}

#pragma mark - button 响应方法

- (void)cancelButtonAction:(UIButton *)sender{
    
    // 取消模态视图
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    
}

- (void)finishButtonAction:(UIButton *)sender{
    
    if (self.av.nameTextField.text.length == 0) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"用户名不能为空" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
        
        [alert show];
        
    }else{
    
    // 保存数据
    Person *p = [[Person alloc] init];
    
    p.name = self.av.nameTextField.text;
    
    p.tel = self.av.telTextField.text;
    
    p.mail = self.av.mailTextField.text;
    
    p.info = self.av.infoTextView.text;
    
    p.headIamge = self.av.headImageView.image;
    
    // 存数据
    [[SingleDat shareDateHandle] addPerson:p];
    
    // 取消模态视图
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    
  }
    
}

- (void)tapAction:(UITapGestureRecognizer *)sender{
    
    // 1. 初始化相册控制器
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    //  允许编辑
    picker.allowsEditing = YES;
    
    // 数据源
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    // 设置代理
    picker.delegate = self;
    
    [self presentViewController:picker animated:YES completion:^{
    }];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    // 取到编辑好的iamage;
    UIImage *i = info[UIImagePickerControllerEditedImage];
    
    // 给imageView 赋值
    self.av.headImageView.image = i;
    
    // 取消模态
     [self dismissViewControllerAnimated:YES completion:nil];
}

//  取消模态
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
