//
//  ListTableViewCell.m
//  UILesson12_Tel
//
//  Created by 刘阳 on 15/9/9.
//  Copyright (c) 2015年 lanou. All rights reserved.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setupView];
    }
    return self;
}
- (void)p_setupView{
    // 角标
    self.cornerImageView = [[UIImageView alloc] init];
    
    self.cornerImageView.frame = CGRectMake(0, 0, 35, 45);
    
    self.cornerImageView.backgroundColor = [UIColor yellowColor];
    
    [self.contentView addSubview:_cornerImageView];
    
    // 头像
    self.headImageView = [[UIImageView alloc] init];
    
    self.headImageView.frame = CGRectMake(CGRectGetMidX(self.cornerImageView.frame), CGRectGetMidY(self.cornerImageView.frame), 100, 100);
    
    self.headImageView.backgroundColor = [UIColor cyanColor];
    
    // 圆形
    self.headImageView.layer.masksToBounds = YES;
    
    self.headImageView.layer.cornerRadius = 50;
    
    [self.contentView addSubview:_headImageView];
    
    // 姓名
    self.nameLaber = [[UILabel alloc] init];
    
    self.nameLaber.frame = CGRectMake(CGRectGetMaxX(self.headImageView.frame)+30, CGRectGetMinY(self.headImageView.frame), 80, 30);
    
     // self.nameLaber.backgroundColor = [UIColor purpleColor];
    
    [self.contentView addSubview:_nameLaber];
    
    // 电话
    self.phoneLaber = [[UILabel alloc] init];
    
    self.phoneLaber.frame = CGRectMake(CGRectGetMinX(self.nameLaber.frame), CGRectGetMaxY(self.nameLaber.frame)+10, 150, 30);
    
    // self.phoneLaber.backgroundColor = [UIColor grayColor];
    
    [self.contentView addSubview:_phoneLaber];
    
    // 打电话
    self.phoneButton = [CellButton buttonWithType:(UIButtonTypeSystem)];
    
    self.phoneButton.frame = CGRectMake(CGRectGetMaxX(self.phoneLaber.frame) + 20, CGRectGetMinY(self.nameLaber.frame), 40 , 40);
    
    self.phoneButton.backgroundColor = [UIColor greenColor];
    
    [self.contentView addSubview:_phoneButton];
    
    // 发短信
    self.smsButton = [CellButton buttonWithType:(UIButtonTypeSystem)];
    
    self.smsButton.frame = CGRectMake(CGRectGetMinX(self.phoneButton.frame), CGRectGetMaxY(self.phoneButton.frame) + 10, CGRectGetWidth(self.phoneButton.frame), CGRectGetHeight(self.phoneButton.frame));
    
    self.smsButton.backgroundColor = [UIColor redColor];
    
    [self.contentView addSubview:_smsButton];
    
    // 添加点击事件
    [self.phoneButton addTarget:self action:@selector(phoneButtonAciotn:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.smsButton addTarget:self action:@selector(smsButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
  
}
    // button 的实现方法
- (void)phoneButtonAciotn:(CellButton *)sender{
    
    // 让代理来完成打电话
    [self.delegate callBackPhoneButton:sender];
    
}
    
- (void)smsButtonAction:(CellButton *)sender{
    
    // 让代理来完成发短信
    [self.delegate callBackSmsButton:sender];
    
}

// cell高度
+ (CGFloat)cellHeight{
    
    return 145;
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
