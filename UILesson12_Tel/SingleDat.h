//
//  SingleDat.h
//  UILesson12_Tel
//
//  Created by 刘阳 on 15/9/9.
//  Copyright (c) 2015年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface SingleDat : NSObject

// 字典用来存储数据
@property (nonatomic, strong) NSMutableDictionary *dataDict;

// 数组用来存储分组名
@property (nonatomic, strong) NSMutableArray *groupArray;

// 单利方法
+ (instancetype)shareDateHandle;

// 添加联系人
- (void)addPerson:(Person *)aPerson;

//  删除联系人
- (void)deletetPerson:(NSIndexPath *)indexPath;

//  查找联系人
- (Person *)searchPerson:(NSIndexPath *)indexPath;

@end
