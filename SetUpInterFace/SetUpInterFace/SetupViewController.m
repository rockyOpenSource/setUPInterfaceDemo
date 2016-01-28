//
//  SetupViewController.m
//  SetUpInterFace
//
//  Created by qishang on 16/1/28.
//  Copyright © 2016年 Rocky. All rights reserved.
//

#import "SetupViewController.h"
#import "PushNoticeViewController.h"
@interface SetupViewController ()

@end

@implementation SetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"设置";
    
    //1. 第0组 3个
    [self add0SectionItems];
    
    // 2.第1组：6个
    [self add1SectionItems];
}

#pragma mark 添加第0组的模型数据
- (void)add0SectionItems {
    __weak typeof(self) weakSelf = self;
    
    SetUpItem *push = [SetUpItem itemWithIcon:@"MorePush" title:@"新消息通知" type:SetUpItemTypeArrow];
    push.operation = ^{
    
        PushNoticeViewController *notice = [[PushNoticeViewController alloc] init];
        [weakSelf.navigationController pushViewController:notice animated:YES];
    };
    
    // 1.2.声音提示
    SetUpItem *shake = [SetUpItem itemWithIcon:@"sound_Effect" title:@"声音提示" type:SetUpItemTypeSwitch];
    //开关事件
    shake.switchBlock = ^(BOOL on) {
        NSLog(@"声音提示%zd",on);
    };
    
    SetUpGroup *group = [[SetUpGroup alloc] init];
    group.header = @"基本设置";
    group.items = @[push, shake];
    [self.allGroups addObject:group];
    

}


#pragma mark 添加第1组的模型数据
- (void)add1SectionItems
{
    __weak typeof(self) weakSelf = self;
    // 帮助
    SetUpItem *help = [SetUpItem itemWithIcon:@"MoreHelp" title:@"帮助" type:SetUpItemTypeArrow];
    help.operation = ^{
        UIViewController *helpVC = [[UIViewController alloc] init];
        helpVC.view.backgroundColor = [UIColor grayColor];
        helpVC.title = @"帮助";
        [weakSelf.navigationController pushViewController:helpVC animated:YES];
    };
    
    // 分享
    SetUpItem *share = [SetUpItem itemWithIcon:@"MoreShare" title:@"分享" type:SetUpItemTypeArrow];
    share.operation = ^{
        UIViewController *helpVC = [[UIViewController alloc] init];
        helpVC.view.backgroundColor = [UIColor lightGrayColor];
        helpVC.title = @"分享";
        [weakSelf.navigationController pushViewController:helpVC animated:YES];
    };
    
    // 关于
    SetUpItem *about = [SetUpItem itemWithIcon:@"MoreAbout" title:@"关于" type:SetUpItemTypeArrow];
    about.operation = ^{
        UIViewController *helpVC = [[UIViewController alloc] init];
        helpVC.view.backgroundColor = [UIColor brownColor];
        helpVC.title = @"关于";
        [weakSelf.navigationController pushViewController:helpVC animated:YES];
    };
    
    SetUpGroup *group = [[SetUpGroup alloc] init];
    group.header = @"高级设置";
    group.footer = @"这是footer";
    group.items = @[ help, share , about];
    [self.allGroups addObject:group];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
    
}
@end
