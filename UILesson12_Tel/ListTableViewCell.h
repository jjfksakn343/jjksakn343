//
//  ListTableViewCell.h
//  UILesson12_Tel
//
//  Created by 刘阳 on 15/9/9.
//  Copyright (c) 2015年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellButton.h"

@protocol ListTableViewCellDelegate <NSObject>

//  打电话代理方法
- (void)callBackPhoneButton:(CellButton *) aButton;

//  发短信代理方法
- (void)callBackSmsButton:(CellButton *) aButton;

@end

@interface ListTableViewCell : UITableViewCell

// 角标
@property (nonatomic, strong) UIImageView *cornerImageView;

// 头像
@property (nonatomic, strong) UIImageView *headImageView;

// 名字
@property (nonatomic, strong) UILabel *nameLaber;

// 电话
@property (nonatomic, strong) UILabel *phoneLaber;

// 打电话
@property (nonatomic, strong) CellButton *phoneButton;

// 发短信
@property (nonatomic, strong) CellButton *smsButton;

// 代理
@property (nonatomic, weak) id<ListTableViewCellDelegate> delegate;

// cell高度
+ (CGFloat)cellHeight;


@end
