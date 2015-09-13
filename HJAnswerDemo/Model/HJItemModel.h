//
//  HJItemModel.h
//  HJAnswerDemo
//
//  Created by yato_kami on 15/9/13.
//  Copyright (c) 2015年 Satoshi_Chin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HJItemModel <NSObject>

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *imagePath;

@end

@interface HJItemModel : NSObject<HJItemModel>

@end
