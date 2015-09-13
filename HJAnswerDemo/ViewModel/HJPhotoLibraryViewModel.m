//
//  HJPhotoLibraryViewModel.m
//  HJAnswerDemo
//
//  Created by yato_kami on 15/9/13.
//  Copyright (c) 2015年 Satoshi_Chin. All rights reserved.
//

#import "HJPhotoLibraryViewModel.h"
#import "HJPhotoCellViewModel.h"
#import "HJItemModel.h"
#import "HJPhotoLibraryModel.h"

NSString *const HJPhotoDidChangedNotifacation = @"photoChange";

@interface HJPhotoLibraryViewModel ()

@property (nonatomic, strong) NSMutableArray *photoCellViewModels;
@property (nonatomic, strong) HJPhotoLibraryModel *photoLibraryModel;

@end

@implementation HJPhotoLibraryViewModel
@dynamic photoModelCount;
#pragma mark - getter and setter
- (NSMutableArray *)photoCellViewModels {
    if (!_photoCellViewModels) {
        _photoCellViewModels = [NSMutableArray arrayWithCapacity:10];
    }
    return _photoCellViewModels;
}

- (NSUInteger)photoModelCount {
    return self.photoCellViewModels.count;
}

- (HJPhotoCellViewModel *)cellModelWithIndex:(NSUInteger)index {
    if (index < self.photoModelCount) {
        return self.photoCellViewModels[index];
    }
    return nil;
}

- (NSString *)photoLibraryName {
    return self.photoLibraryModel.photoLibrayName;
}

#pragma mark - initilize
- (instancetype)init {
    if (self = [super init]) {
        _photoLibraryModel = [[HJPhotoLibraryModel alloc] init];
        for (id<HJItemModel> model in _photoLibraryModel.items) {
            HJPhotoCellViewModel *viewModel = [[HJPhotoCellViewModel alloc] initWithItemModel:model];
            [self.photoCellViewModels addObject:viewModel];
        }
    }
    return self;
}

- (BOOL)deletePhotoWithIndex: (NSInteger)index {
    if (self.photoCellViewModels.count > index) {
        
        [self.photoCellViewModels removeObjectAtIndex:index];
        [self.photoLibraryModel.items removeObjectAtIndex:index];
        
        //发送照片变化的通知
        [[NSNotificationCenter defaultCenter] postNotificationName:HJPhotoDidChangedNotifacation object:nil];
        
        return YES;
    }
    return NO;
}

@end
