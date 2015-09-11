//
//  SingleDat.m
//  UILesson12_Tel
//
//  Created by 刘阳 on 15/9/9.
//  Copyright (c) 2015年 lanou. All rights reserved.
//

#import "SingleDat.h"
#import "pinyin.h"

static SingleDat *sd = nil;

@implementation SingleDat


// 创建单利方法
+ (instancetype)shareDateHandle{
    
    if (sd == nil) {
        
        sd = [[SingleDat alloc] init];
        
        //  初始化字典
        sd.dataDict = [NSMutableDictionary dictionary];
        
    }
    return sd;
}

-(NSMutableArray *)groupArray{
    
    //  取出所有分组名
    self.groupArray = _dataDict.allKeys.mutableCopy;
    
    //  升序排列
    [_groupArray sortUsingSelector:@selector(compare:)];
    
    return _groupArray;
    
}

// 添加联系人
- (void)addPerson:(Person *)aPenson{
    
    // 取首字母
    NSString *firstName = [aPenson.name uppercasePinYinFirstLetter];
    
    // 判断有该分组
    if (self.dataDict[firstName] == nil) {
        
        // 如果没有该分组.创建分组存aPerson,放入字典
        NSMutableArray *tempArray = [NSMutableArray arrayWithObject:aPenson];
        
        [self.dataDict setObject:tempArray forKey:firstName];
        
    }else{
        
         //如果有分组, 直接存
        [self.dataDict[firstName] addObject:aPenson];
        
    }
}

//  删除联系人
- (void)deletetPerson:(NSIndexPath *)indexPath{
    
    // 找分组
    NSString *groupName = self.groupArray[indexPath.section];
    
    // 找到分组后删除人
    [self.dataDict[groupName] removeObjectAtIndex:indexPath.row];
    
}

//  查找联系人
- (Person *)searchPerson:(NSIndexPath *)indexPath{
    
    //先找分组
    NSString *groupName = self.groupArray[indexPath.section];
    
    // 找到分组取出联系人
    return [self.dataDict[groupName] objectAtIndex:indexPath.row];
    
}


@end
