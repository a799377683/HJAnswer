//
//  HJPhotoCellViewModel.m
//  HJAnswerDemo
//
//  Created by yato_kami on 15/9/13.
//  Copyright (c) 2015年 Satoshi_Chin. All rights reserved.
//

#import "HJPhotoCellViewModel.h"
#import "HJItemModel.h"

@interface HJPhotoCellViewModel()

@property (nonatomic, strong) id<HJItemModel>      model;

@property (nonatomic, strong, readwrite) NSString *photoName;

@property (nonatomic, strong, readwrite) UIImage  *photoImage;


@end

@implementation HJPhotoCellViewModel

- (instancetype)initWithItemModel: (id<HJItemModel>)model {
    if (self = [super init]) {
        _model = model;
    }
    return self;
}

#pragma mark - getter and setter

- (UIImage *)photoImage {
    if (!_photoImage) {
        NSArray *rgbs = [self.model.imagePath componentsSeparatedByString:@","];
        UIColor *bgColor = nil;
        if (rgbs.count < 3) {
            //异常情况
            bgColor = [UIColor whiteColor];
        }else {
            bgColor = [UIColor colorWithRed:[rgbs[0] doubleValue]/255. green:[rgbs[1] doubleValue]/255. blue:[rgbs[2] doubleValue]/255. alpha:1];
        }
        
        CGRect rect = CGRectMake(0., 0., 800., 800.);
        
        UIGraphicsBeginImageContextWithOptions(rect.size, YES, [[UIScreen mainScreen] scale]);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [bgColor CGColor]);
        CGContextFillRect(context, rect);
        
        _photoImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return _photoImage;
}

- (NSString *)photoName {
    return [self.model title] ? :@"Unknow";
}

@end
