//
//  AddView.h
//  TELBook
//
//  Created by 小爪乎黑 on 15/7/3.
//  Copyright (c) 2015年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddView : UIView
@property (nonatomic,strong)UIImageView *headImageView;

@property (nonatomic,strong)UILabel *nameTitleLabel;
@property (nonatomic,strong)UITextField *nameTextField;

@property (nonatomic,strong)UILabel *telTitleLabel;
@property (nonatomic,strong)UITextField *telTextField;

@property (nonatomic,strong)UILabel *mailTitleLabel;
@property (nonatomic,strong)UITextField *mailTextField;

@property (nonatomic,strong)UILabel *infoTitelLabel;
@property (nonatomic,strong)UITextView *infoTextView;

@property (nonatomic,strong) UIButton *cancelButton;
@property (nonatomic,strong) UIButton *finishButton;


@end
