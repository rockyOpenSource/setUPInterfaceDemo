//
//  SetUpCell.m
//  SetUpInterFace
//
//  Created by qishang on 16/1/28.
//  Copyright © 2016年 Rocky. All rights reserved.
//

#import "SetUpCell.h"

@implementation SetUpCell


+ (id)setUpCellWithTableView:(UITableView *)tableView {

    static NSString *ID = @"Cell";
    SetUpCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[SetUpCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }

    return cell;
}

- (void)setItem:(SetUpItem *)item {

    _item = item;
    
//设置数据
    self.imageView.image = [UIImage imageNamed:item.icon];
    self.textLabel.text = item.title;
    
    if (item.type == SetUpItemTypeNone) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        //使用默认的选中的样式
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
    } else if (item.type == SetUpItemTypeSwitch) {
    
        if (_switch == nil) {
            _switch = [[UISwitch alloc] init];
            [_switch addTarget:self action:@selector(switchStatusChange:) forControlEvents:UIControlEventValueChanged];
         
        }
        
        //右面显示开关
        self.accessoryView = _switch;
    
        //禁止选中
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    } else {
    
        self.accessoryView = nil;
        //
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
    
    
}

- (void)switchStatusChange:(UISwitch *)sender {

    if (self.switchChangeBlock) {
        self.switchChangeBlock(sender.on);
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
