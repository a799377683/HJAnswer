//
//  HJPhotoCell.m
//  HJAnswerDemo
//
//  Created by yato_kami on 15/9/13.
//  Copyright (c) 2015年 Satoshi_Chin. All rights reserved.
//

#import "HJPhotoCell.h"

@implementation HJPhotoCell

- (void)awakeFromNib {
    self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
    self.selectedBackgroundView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.5];
    
    self.nameLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    
    self.photoView.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.photoView.layer.borderWidth = 5.0f;
    
    [super awakeFromNib];
}

@end
