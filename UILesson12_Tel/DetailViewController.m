//
//  DetailViewController.m
//  UILesson12_Tel
//
//  Created by 刘阳 on 15/9/9.
//  Copyright (c) 2015年 lanou. All rights reserved.
//

#import "DetailViewController.h"
#import "SetViewController.h"
#import "DetailView.h"
#import "Person.h"
#import "SingleDat.h"


@interface DetailViewController ()<UIActionSheetDelegate>

@property (nonatomic, strong) DetailView *dv;

@end

@implementation DetailViewController

- (void)loadView{
    
    self.dv = [[DetailView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = _dv;
}

- (void)viewWillAppear:(BOOL)animated{
    
    //  通过indepath找到联系人
    Person *p = [[SingleDat shareDateHandle]searchPerson:_indexPath];
    
    self.dv.nameLabel.text = p.name;
    
    self.dv.telLabel.text = p.tel;
    
    self.dv.mailLabel.text = p.mail;
    
    self.dv.infoTextView.text = p.info;
    
    self.dv.headImageView.image = p.headIamge;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 添加右button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemEdit) target:self action:@selector(rightButton:)];

    // 固定数据
    self.dv.part1.text = @"个人信息";
    
    self.dv.telTitleLabel.text = @"电话";
    
    self.dv.mailTitleLabel.text = @"邮箱";
    
    self.dv.part2.text = @"详情";
    
    [self.dv.deleteButton setTitle:@"删除联系人" forState:(UIControlStateNormal)];
    
    [self.dv.phoneButton setBackgroundImage:[UIImage imageNamed:@"phone.png"] forState:(UIControlStateNormal)];
    
    [self.dv.smsButton setBackgroundImage:[UIImage imageNamed:@"sms.png"] forState:(UIControlStateNormal)];
    
     [self.dv.mailButton setBackgroundImage:[UIImage imageNamed:@"mail.png"] forState:(UIControlStateNormal)];
    
    // button 点击事件
    [self.dv.phoneButton addTarget:self action:@selector(phoneButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.dv.smsButton addTarget:self action:@selector(smsButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.dv.mailButton addTarget:self action:@selector(mailButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.dv.deleteButton addTarget:self action:@selector(deleteButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];

}

- (void)phoneButtonAction:(UIButton *)sender{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起" message:@"您的电话已欠费不能打电话" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
    
    [alert show];
    
}

- (void)smsButtonAction:(UIButton *)sender{

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起" message:@"您的电话已欠费不能发短信" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
    
    [alert show];

}

- (void)mailButtonAction:(UIButton *)sender{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起" message:@"您没有网络,不能发邮件" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
    
    [alert show];
    
}

// actionsheet代理方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        
        // 删除
         [[SingleDat shareDateHandle] deletetPerson:_indexPath];
        
        //  退到上一页
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
    
}

#pragma mark - 响应方法
- (void)deleteButtonAction:(UIButton *)sender{
    
    UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:@"警告" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil];
    
    [as showInView:self.dv];
    
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-响应方法
- (void)rightButton:(UIBarButtonItem *)sender{
    //模态
    SetViewController *setVC = [[SetViewController alloc] init];
    
    setVC.indexPath = _indexPath;
    
    [self presentViewController:setVC animated:YES completion:^{
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
