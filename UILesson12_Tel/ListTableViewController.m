//
//  ListTableViewController.m
//  UILesson12_Tel
//
//  Created by 刘阳 on 15/9/9.
//  Copyright (c) 2015年 lanou. All rights reserved.
//

#import "ListTableViewController.h"
#import "AdViewController.h"
#import "DetailViewController.h"
#import "ListTableViewCell.h"
#import "SingleDat.h"

@interface ListTableViewController () <ListTableViewCellDelegate>

@end

@implementation ListTableViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [self.tableView reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //  注册
    [self.tableView registerClass:[ListTableViewCell class] forCellReuseIdentifier:@"cell"];
    //  右button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(rightBarButtonItem:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 响应方法
//  右button
- (void)rightBarButtonItem:(UINavigationItem *)sender{
    //  创建adviewcontrol
    AdViewController *addVC = [[AdViewController alloc] init];
    [self presentViewController:addVC animated:YES completion:^{
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [SingleDat shareDateHandle].groupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSString *groupName = [SingleDat shareDateHandle].groupArray[section];
    
    return [[SingleDat shareDateHandle].dataDict[groupName] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // 使用indexpath找到联系人
    Person *p = [[SingleDat shareDateHandle] searchPerson:indexPath];
    
    // 设置代理
    cell.delegate = self;
    
    // 告诉button属于哪个cell;
    cell.phoneButton.indexPath = indexPath;
    
    cell.smsButton.indexPath = indexPath;
    
    cell.headImageView.image = p.headIamge;
    
    cell.nameLaber.text = p.name;
    
    cell.phoneLaber.text = p.tel;
    
    cell.cornerImageView.image = [UIImage imageNamed:@"corner.png"];
    
    [cell.phoneButton setBackgroundImage:[UIImage imageNamed:@"phone.png"] forState:(UIControlStateNormal)];
    
    [cell.smsButton setBackgroundImage:[UIImage imageNamed:@"sms.png"] forState:(UIControlStateNormal)];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [ListTableViewCell cellHeight];
}

#pragma mark - ListTableViewDelegate 协议方法

- (void)callBackPhoneButton:(CellButton *) aButton{
    
    Person *p = [[SingleDat shareDateHandle] searchPerson:aButton.indexPath];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",p.tel]]];
    
}

- (void)callBackSmsButton:(CellButton *) aButton{
    
    Person *p = [[SingleDat shareDateHandle] searchPerson:aButton.indexPath];      
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms://%@",p.tel]]];
   
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - tableView Delegate
// 点击选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //  创建详情
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    
    // 属性传值
    detailVC.indexPath = indexPath;
    
    [self.navigationController pushViewController:detailVC animated:YES];
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
