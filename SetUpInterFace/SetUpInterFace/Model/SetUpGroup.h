//
//  SetUpGroup.h
//  SetUpInterFace
//
//  Created by qishang on 16/1/28.
//  Copyright © 2016年 Rocky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SetUpGroup : NSObject
@property (nonatomic, copy) NSString *header; // 头部标题
@property (nonatomic, copy) NSString *footer; // 尾部标题
@property (nonatomic, strong) NSArray *items; // 中间的条目

@end
