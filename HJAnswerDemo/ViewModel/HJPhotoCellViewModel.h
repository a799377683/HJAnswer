//
//  HJPhotoCellViewModel.h
//  HJAnswerDemo
//
//  Created by yato_kami on 15/9/13.
//  Copyright (c) 2015年 Satoshi_Chin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol HJItemModel;

@interface HJPhotoCellViewModel : NSObject

//照片名称
@property (nonatomic, strong, readonly) NSString *photoName;

// 照片image
@property (nonatomic, strong, readonly) UIImage  *photoImage;

- (instancetype)initWithItemModel: (id<HJItemModel>)model;

@end
