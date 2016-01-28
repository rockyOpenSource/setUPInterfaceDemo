//
//  SetUpCell.h
//  SetUpInterFace
//
//  Created by qishang on 16/1/28.
//  Copyright © 2016年 Rocky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetUpItem.h"

typedef void(^switchChangeBlock)(BOOL on);
@interface SetUpCell : UITableViewCell {

    UISwitch *_switch;
}
@property (nonatomic, strong) SetUpItem *item;

// switch状态改变的block
@property (nonatomic, copy) switchChangeBlock switchChangeBlock;
+ (id)setUpCellWithTableView:(UITableView *)tableView;

@end
