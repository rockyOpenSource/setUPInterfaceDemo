//
//  SetUpItem.m
//  SetUpInterFace
//
//  Created by qishang on 16/1/28.
//  Copyright © 2016年 Rocky. All rights reserved.
//

#import "SetUpItem.h"

@implementation SetUpItem

+ (id)itemWithIcon:(NSString *)icon title:(NSString *)title type:(SetUpItemType)type {

    SetUpItem *item = [[SetUpItem alloc] init];
    item.icon = icon;
    item.title = title;
    item.type = type;
    return item;
}
@end
