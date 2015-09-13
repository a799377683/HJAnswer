//
//  HJPhotoLibraryModel.m
//  HJAnswerDemo
//
//  Created by yato_kami on 15/9/13.
//  Copyright (c) 2015年 Satoshi_Chin. All rights reserved.
//

#import "HJPhotoLibraryModel.h"
#import "HJItemModel.h"

@implementation HJPhotoLibraryModel

- (instancetype)init {
    if (self = [super init]) {
        _userName = @"CC";
        _photoLibrayName = @"笔试Demo";
        
        //模拟从某个地方获取到数据源photo有10张
        NSUInteger photoCount = 10;
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:photoCount];
        
        NSMutableString *mutablePath = [NSMutableString string];
        for (NSInteger i = 0; i < photoCount; i++) {
            HJItemModel *model = [[HJItemModel alloc] init];
            //由于没有照片，生成一个rgb string 模拟成路径 r,g,b
            [mutablePath setString:[NSString stringWithFormat:@"%d,%d,%d",arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255)]];
            NSLog(@"%@",mutablePath);
            model.imagePath = [mutablePath copy];
            
            model.title = [NSString stringWithFormat:@"照片%@",mutablePath];
            
            [array addObject:model];
        }
        _items = (NSMutableArray<HJItemModel> *)array;
    }
    return self;
}

@end
