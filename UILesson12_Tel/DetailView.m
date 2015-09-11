//
//  DetailView.m
//  TELBook
//
//  Created by 小爪乎黑 on 15/7/3.
//  Copyright (c) 2015年 李帅. All rights reserved.
//

#import "DetailView.h"

@implementation DetailView

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
    _headImageView.frame = CGRectMake(20, 100, 100, 100);
    _headImageView.layer.cornerRadius = 50;
    _headImageView.layer.masksToBounds = YES;
    
//    _headImageView.backgroundColor = [UIColor cyanColor];
//    self.headImageView.image = [UIImage imageNamed:@"person.png"];
    
    
    [self addSubview:_headImageView];
    
    self.nameLabel = [[UILabel alloc] init];
    _nameLabel.frame = CGRectMake(CGRectGetMaxX(_headImageView.frame) + 30, CGRectGetMidY(_headImageView.frame), 100, 30);
//    _nameLabel.backgroundColor = [UIColor blueColor];
    [self addSubview:_nameLabel];
    
    
    self.phoneButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    _phoneButton.frame = CGRectMake(CGRectGetMaxX(self.frame) - 50, CGRectGetMinY(_headImageView.frame), 30, 30);
//    _phoneButton.backgroundColor = [UIColor blueColor];
    [self addSubview:_phoneButton];
    
    
    self.smsButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    _smsButton.frame = CGRectMake(CGRectGetMinX(_phoneButton.frame), CGRectGetMaxY(_phoneButton.frame) + 10, CGRectGetWidth(_phoneButton.frame), CGRectGetHeight(_phoneButton.frame));
//    _smsButton.backgroundColor = [UIColor blueColor];
    [self addSubview:_smsButton];
    
    self.mailButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    _mailButton.frame = CGRectMake(CGRectGetMinX(_smsButton.frame), CGRectGetMaxY(_smsButton.frame) + 10, CGRectGetWidth(_smsButton.frame), CGRectGetHeight(_smsButton.frame));
//    _mailButton.backgroundColor = [UIColor blueColor];
    [self addSubview:_mailButton];
    
    
    self.part1 = [[UILabel alloc] init];
    _part1.frame = CGRectMake(CGRectGetMinX(_headImageView.frame) + 20, CGRectGetMaxY(_headImageView.frame) + 20, 70, 30);
//    _part1.backgroundColor = [UIColor blueColor];
    [self addSubview:_part1];
    
    UIView *sp1 = [[UIView alloc] init];
    sp1.frame = CGRectMake(30, CGRectGetMaxY(_part1.frame) + 5, CGRectGetWidth(self.frame), 1);
    sp1.backgroundColor = [UIColor blueColor];
    [self addSubview:sp1];

    
    self.telTitleLabel = [[UILabel alloc] init];
    _telTitleLabel.frame = CGRectMake(70, CGRectGetMaxY(sp1.frame) + 30, 50, 30);
//    _telTitleLabel.backgroundColor = [UIColor blueColor];
    [self addSubview:_telTitleLabel];
    
    self.telLabel = [[UILabel alloc] init];
    _telLabel.frame = CGRectMake(CGRectGetMaxX(_telTitleLabel.frame) + 30, CGRectGetMinY(_telTitleLabel.frame), 180, CGRectGetHeight(_telTitleLabel.frame));
//    _telLabel.backgroundColor = [UIColor blueColor];
    [self addSubview:_telLabel];
    
    self.mailTitleLabel = [[UILabel alloc] init];
    _mailTitleLabel.frame = CGRectMake(CGRectGetMinX(_telTitleLabel.frame), CGRectGetMaxY(_telTitleLabel.frame) + 30, CGRectGetWidth(_telTitleLabel.frame), CGRectGetHeight(_telTitleLabel.frame));
//    _mailTitleLabel.backgroundColor = [UIColor blueColor];
    [self addSubview:_mailTitleLabel];
    
    self.mailLabel = [[UILabel alloc] init];
    _mailLabel.frame = CGRectMake(CGRectGetMinX(_telLabel.frame), CGRectGetMinY(_mailTitleLabel.frame), CGRectGetWidth(_telLabel.frame), CGRectGetHeight(_telLabel.frame));
//    _mailLabel.backgroundColor = [UIColor blueColor];
    [self addSubview:_mailLabel];

    self.part2 = [[UILabel alloc] init];
    _part2.frame = CGRectMake(CGRectGetMinX(_part1.frame), CGRectGetMaxY(_mailTitleLabel.frame) + 40, CGRectGetWidth(_part1.frame), CGRectGetHeight(_part1.frame));
//    _part2.backgroundColor = [UIColor blueColor];
    [self addSubview:_part2];
    
    UIView *sp2 = [[UIView alloc] init];
    sp2.frame = CGRectMake(30, CGRectGetMaxY(_part2.frame) + 5, CGRectGetWidth(self.frame), 1);
    sp2.backgroundColor = [UIColor blueColor];
    [self addSubview:sp2];
    
    
    self.infoTextView = [[UITextView alloc] init];
    _infoTextView.frame = CGRectMake(CGRectGetMinX(_mailTitleLabel.frame), CGRectGetMaxY(sp2.frame) + 10, 265, 100)
    ;
//    _infoTextView.backgroundColor = [UIColor blueColor];
    [self addSubview:_infoTextView];
    
    self.deleteButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    _deleteButton.frame = CGRectMake(CGRectGetMidX(self.frame) - 50, CGRectGetMaxY(_infoTextView.frame) + 30, 100, 40);
//    _deleteButton.backgroundColor = [UIColor blueColor];
    [self addSubview:_deleteButton];
    
    
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
