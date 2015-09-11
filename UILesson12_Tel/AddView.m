//
//  AddView.m
//  TELBook
//
//  Created by 小爪乎黑 on 15/7/3.
//  Copyright (c) 2015年 李帅. All rights reserved.
//

#import "AddView.h"

@implementation AddView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupView];
    }
    return self;
}

- (void)p_setupView
{
    self.backgroundColor = [UIColor whiteColor];
    
    self.headImageView = [[UIImageView alloc] init];
    _headImageView.frame = CGRectMake(20, 60, 100, 100);
    _headImageView.layer.cornerRadius = 50;
    _headImageView.image = [UIImage imageNamed:@"person.png"];
    
    _headImageView.layer.masksToBounds = YES;
    _headImageView.backgroundColor = [UIColor cyanColor];
    [self addSubview:_headImageView];
    
    self.nameTitleLabel = [[UILabel alloc] init];
    _nameTitleLabel.frame = CGRectMake(CGRectGetMaxX(_headImageView.frame) + 20, CGRectGetMidY(_headImageView.frame), 50, 30);
//    _nameTitleLabel.backgroundColor = [UIColor blueColor];
    [self addSubview:_nameTitleLabel];

    self.nameTextField = [[UITextField alloc] init];
    _nameTextField.frame = CGRectMake(CGRectGetMaxX(_nameTitleLabel.frame) + 10, CGRectGetMinY(_nameTitleLabel.frame), 150, CGRectGetHeight(_nameTitleLabel.frame));
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:_nameTextField];
    
    UIView *sp = [[UIView alloc] init];
    sp.frame = CGRectMake(0, CGRectGetMaxY(_headImageView.frame) + 20, CGRectGetWidth(self.frame), 1);
//    sp.backgroundColor = [UIColor blueColor];
    [self addSubview:sp];
    
    self.telTitleLabel = [[UILabel alloc] init];
    _telTitleLabel.frame = CGRectMake(50, CGRectGetMaxY(sp.frame) + 50, 50, 30);
//    _telTitleLabel.backgroundColor = [UIColor blueColor];
    [self addSubview:_telTitleLabel];
    
    
    self.telTextField = [[UITextField alloc] init];
    _telTextField.frame = CGRectMake(CGRectGetMaxX(_telTitleLabel.frame) + 20, CGRectGetMinY(_telTitleLabel.frame), 200, CGRectGetHeight(_telTitleLabel.frame));
    _telTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:_telTextField];
    
    self.mailTitleLabel = [[UILabel alloc] init];
    _mailTitleLabel.frame = CGRectMake(CGRectGetMinX(_telTitleLabel.frame), CGRectGetMaxY(_telTitleLabel.frame) + 50, CGRectGetWidth(_telTitleLabel.frame), CGRectGetHeight(_telTitleLabel.frame));
//    _mailTitleLabel.backgroundColor = [UIColor blueColor];
    [self addSubview:_mailTitleLabel];
    
    self.mailTextField = [[UITextField alloc] init];
    _mailTextField.frame = CGRectMake(CGRectGetMinX(_telTextField.frame), CGRectGetMinY(_mailTitleLabel.frame), CGRectGetWidth(_telTextField.frame), CGRectGetHeight(_telTextField.frame));
    _mailTextField.borderStyle= UITextBorderStyleRoundedRect;
    [self addSubview:_mailTextField];
    
    self.infoTitelLabel = [[UILabel alloc] init];
    _infoTitelLabel.frame = CGRectMake(CGRectGetMinX(_mailTitleLabel.frame), CGRectGetMaxY(_mailTitleLabel.frame) + 50, CGRectGetWidth(_mailTitleLabel.frame), CGRectGetHeight(_mailTitleLabel.frame));
//    _infoTitelLabel.backgroundColor = [UIColor blueColor];
    [self addSubview:_infoTitelLabel];
    
    self.infoTextView = [[UITextView alloc] init];
    _infoTextView.frame = CGRectMake(CGRectGetMinX(_mailTextField.frame), CGRectGetMinY(_infoTitelLabel.frame), CGRectGetWidth(_mailTextField.frame), 100);
    _infoTextView.layer.borderWidth = 1;
    _infoTextView.layer.cornerRadius = 5;
    _infoTextView.layer.borderColor = [UIColor grayColor].CGColor;
//    _infoTextView.backgroundColor = [UIColor blueColor];
    [self addSubview:_infoTextView];
    
    self.cancelButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    _cancelButton.frame = CGRectMake(CGRectGetMidX(self.frame) - 100, CGRectGetMaxY(_infoTextView.frame) + 60, 80, 30);
    _cancelButton.layer.borderWidth = 1;
    _cancelButton.layer.cornerRadius = 5;
//    _cancelButton.backgroundColor = [UIColor blueColor];
    [self addSubview:_cancelButton];
    
    
    self.finishButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    _finishButton.frame = CGRectMake(CGRectGetMidX(self.frame) + 20, CGRectGetMinY(_cancelButton.frame), CGRectGetWidth(_cancelButton.frame), CGRectGetHeight(_cancelButton.frame));
//    _finishButton.backgroundColor = [UIColor blueColor];
    _finishButton.layer.borderWidth = 1;
    _finishButton.layer.cornerRadius = 5;
    [self addSubview:_finishButton];

}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
