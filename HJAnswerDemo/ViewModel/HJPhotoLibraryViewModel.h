//
//  HJPhotoLibraryViewModel.h
//  HJAnswerDemo
//
//  Created by yato_kami on 15/9/13.
//  Copyright (c) 2015年 Satoshi_Chin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJPhotoCellViewModel.h"

extern NSString *const HJPhotoDidChangedNotifacation;

@interface HJPhotoLibraryViewModel : NSObject

//相片数量
@property (nonatomic, assign, readonly) NSUInteger photoModelCount;

// 子cellViewModel
- (HJPhotoCellViewModel *)cellModelWithIndex: (NSUInteger)index;

//相册名称
- (NSString *)photoLibraryName;

//删除照片
- (BOOL)deletePhotoWithIndex: (NSInteger)index;

@end
