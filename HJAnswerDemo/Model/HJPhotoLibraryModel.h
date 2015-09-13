//
//  HJPhotoLibraryModel.h
//  HJAnswerDemo
//
//  Created by yato_kami on 15/9/13.
//  Copyright (c) 2015年 Satoshi_Chin. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol HJItemModel;

@interface HJPhotoLibraryModel : NSObject

@property (nonatomic, strong) NSString              *userName;

@property (nonatomic, strong) NSString              *photoLibrayName;

@property (nonatomic, strong) NSMutableArray<HJItemModel>  *items;


@end
