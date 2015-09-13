//
//  ViewController.m
//  HJAnswerDemo
//
//  Created by yato_kami on 15/9/13.
//  Copyright (c) 2015年 Satoshi_Chin. All rights reserved.
//
//  沪江笔试第一题以及第二题代码
//

#import "HJPhotoCell.h"
#import <objc/runtime.h>
#import "ViewController.h"
#import "HJCoverFlowLayout.h"
#import "HJPhotoCellViewModel.h"
#import "HJPhotoLibraryViewModel.h"

typedef void(^alertHandler)(NSUInteger selIndex);
static void const* kAlertKey;

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UIAlertViewDelegate>

@property (nonatomic, strong) HJPhotoLibraryViewModel *photoLibraryViewModel;

@property (nonatomic, weak) IBOutlet UICollectionView   *collectionView;

@end

@implementation ViewController

-(NSString*) photosDirectory {
    return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Photos"];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //创建viewModel
    self.photoLibraryViewModel = [[HJPhotoLibraryViewModel alloc] init];
    
    /* 监听照片变化通知,此处由于照片改变来源只有点击cell删除一个来源，
       使用通知可能不太有必要,但是如果照片是网络加载，且有其他vc可能增删的情况下，通知就有必要了。
       ps:主要为了完成第一题
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(photoLibraryDidChanged:) name:HJPhotoDidChangedNotifacation object:nil];
    
    //更新ui
    self.title = self.photoLibraryViewModel.photoLibraryName;
    
}

#pragma mark - rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - collectionView DataSource and Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.photoLibraryViewModel.photoModelCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"HJPhotoCell";
    
    HJPhotoCell *cell = (HJPhotoCell *) [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    HJPhotoCellViewModel *cellViewModel = [self.photoLibraryViewModel cellModelWithIndex:indexPath.row];
    if (cellViewModel) {
        cell.photoView.image = cellViewModel.photoImage;
        cell.nameLabel.text = cellViewModel.photoName;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"删除图片？" message:@"是否删除" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    __weak typeof(self) weakself = self;
    objc_setAssociatedObject(alertView, &kAlertKey, ^(NSUInteger selIndex){
        if (selIndex == 1) {
            //删除照片
            if([weakself.photoLibraryViewModel deletePhotoWithIndex:indexPath.row]){
                NSLog(@"删除成功");
            }
        }
    }, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [alertView show];
}

#pragma mark - alertView delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    alertHandler aHandler = objc_getAssociatedObject(alertView, &kAlertKey);
    aHandler(buttonIndex);
}

#pragma mark - notifacation Hander
- (void)photoLibraryDidChanged: (NSNotification *)notif {
    [self.collectionView reloadData];
}

@end
