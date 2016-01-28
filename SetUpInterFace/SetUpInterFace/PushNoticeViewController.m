//
//  PushNoticeViewController.m
//  SetUpInterFace
//
//  Created by qishang on 16/1/28.
//  Copyright © 2016年 Rocky. All rights reserved.
//

#import "PushNoticeViewController.h"

@interface PushNoticeViewController ()

@end

@implementation PushNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"新消息通知";
    
    // 1.1
    SetUpItem *item1 = [SetUpItem itemWithIcon:nil title:@"接收新消息通知" type:SetUpItemTypeNone];
    //开关事件
    item1.switchBlock = ^(BOOL on) {
        NSLog(@"接收新消息通知%zd",on);
    };
    
    // 1.2
    SetUpItem *item2 = [SetUpItem itemWithIcon:nil title:@"通知显示消息详情" type:SetUpItemTypeSwitch];
    item2.switchBlock = ^(BOOL on) {
        NSLog(@"通知显示消息详情%zd",on);
    };
    
    // 1.3
    SetUpItem *item3 = [SetUpItem itemWithIcon:nil title:@"功能消息免打扰" type:SetUpItemTypeArrow];
    item3.switchBlock = ^(BOOL on) {
        NSLog(@"功能消息免打扰%zd",on);
    };
    
    // 1.4
    SetUpItem *item4 = [SetUpItem itemWithIcon:nil title:@"声音" type:SetUpItemTypeSwitch];
    item4.switchBlock = ^(BOOL on) {
        NSLog(@"声音%zd",on);
    };
    
    // 1.5
    SetUpItem *item5 = [SetUpItem itemWithIcon:nil title:@"振动" type:SetUpItemTypeSwitch];
    item5.switchBlock = ^(BOOL on) {
        NSLog(@"振动%zd",on);
    };
    
    // 1.6
    SetUpItem *item6 = [SetUpItem itemWithIcon:nil title:@"朋友圈照片更新" type:SetUpItemTypeSwitch];
    item6.switchBlock = ^(BOOL on) {
        NSLog(@"朋友圈照片更新%zd",on);
    };
    
    SetUpGroup *group1 = [[SetUpGroup alloc] init];
    group1.items = @[item1];
    group1.footer = @"如果你要关闭或者开启微信的新消息通知，请在iPhone的“设置”-“通知”功能中，找到应用程序“XX”更改";
    [self.allGroups addObject:group1];
    
    SetUpGroup *group2 = [[SetUpGroup alloc] init];
    group2.items = @[item2];
    group2.footer = @"关闭后，当收到微信呢消息时，通知提示将不显示发现人和内容摘要";
    [self.allGroups addObject:group2];
    
    SetUpGroup *group3 = [[SetUpGroup alloc] init];
    group3.items = @[item3];
    group3.footer = @"设置系统功能消息提示声音和振动的时段";
    [self.allGroups addObject:group3];
    
    SetUpGroup *group4 = [[SetUpGroup alloc] init];
    group4.items = @[item4,item5];
    group4.footer = @"当XX运行时，你可以设置是否需要声音或振动";
    [self.allGroups addObject:group4];
    
    SetUpGroup *group5 = [[SetUpGroup alloc] init];
    group5.items = @[item6];
    group5.footer = @"关闭后，有朋友更新照片时，界面将不会出现提示";
    [self.allGroups addObject:group5];
    

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
