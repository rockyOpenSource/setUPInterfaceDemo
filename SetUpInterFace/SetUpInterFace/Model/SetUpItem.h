//
//  SetUpItem.h
//  SetUpInterFace
//
//  Created by qishang on 16/1/28.
//  Copyright © 2016年 Rocky. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger {
    SetUpItemTypeNone, // 什么也没有
    SetUpItemTypeArrow, // 箭头
    SetUpItemTypeSwitch // 开关
}SetUpItemType;

//cell 上开关的操作
typedef void(^SwitchBlock)(BOOL on);
typedef void(^operation)();//点击cel的操作
@interface SetUpItem : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
//cell的格式
@property (nonatomic, assign) SetUpItemType type;
//cell 上开关的操作事件
@property (nonatomic, copy) SwitchBlock switchBlock;
@property (nonatomic, copy) operation operation;

+ (id)itemWithIcon:(NSString *)icon title:(NSString *)title type:(SetUpItemType)type;
@end
