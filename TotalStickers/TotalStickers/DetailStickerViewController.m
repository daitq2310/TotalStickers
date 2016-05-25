//
//  DetailStickerViewController.m
//  TotalStickers
//
//  Created by Quang Dai on 4/19/16.
//  Copyright © 2016 Quang Dai. All rights reserved.
//

#import "DetailStickerViewController.h"
#import "DetailStickerCell.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface DetailStickerViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation DetailStickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _detailStickerCollectionView.backgroundColor = [UIColor clearColor];
    NSLog(@"%ld",[_dictData[@"link2"] count]);
    [self customNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) customNavigation {
    //---------------------------------------------------------
    //set first title
    self.navigationItem.title = _dictData[@"title"];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"ChalkboardSE-Bold" size:23], NSFontAttributeName, nil]];
    
    //---------------------------------------------------------
    //change back button icon
    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"back"];
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"back"];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIButton *btnMore = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:@"more"]  ;
    [btnMore setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [btnMore addTarget:self action:@selector(btnMoreTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
    btnMore.frame = CGRectMake(0, 0, 25, 25);
    UIBarButtonItem *buttonMore = [[UIBarButtonItem alloc] initWithCustomView:btnMore] ;
    self.navigationItem.rightBarButtonItem = buttonMore;
    
}
//---------------------------------------------------------
//More button to connect AppStore
- (void) btnMoreTouchUpInside {
    UIAlertController* alert = [UIAlertController
                                alertControllerWithTitle:@"Total Stickers"
                                message:nil
                                preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* btnCancel = [UIAlertAction
                                actionWithTitle:@"Cancel"
                                style:UIAlertActionStyleCancel
                                handler:^(UIAlertAction * action)
                                {
                                    //UIAlertController will automatically dismiss the view
                                }];
    
    UIAlertAction* btnMoreApp = [UIAlertAction
                                 actionWithTitle:@"More Apps"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     //Go to AppStore
                                 }];
    
    UIAlertAction* btnRateApp = [UIAlertAction
                                 actionWithTitle:@"Rate App"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     //Go to AppStore
                                 }];
    UIAlertAction* btnGiftApp = [UIAlertAction
                                 actionWithTitle:@"Gift App"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     //Go to AppStore
                                 }];
    UIAlertAction* btnRecommendApp = [UIAlertAction
                                      actionWithTitle:@"Recommend App"
                                      style:UIAlertActionStyleDefault
                                      handler:^(UIAlertAction * action)
                                      {
                                          //Go to AppStore
                                      }];
    [alert addAction:btnCancel];
    [alert addAction:btnMoreApp];
    [alert addAction:btnRateApp];
    [alert addAction:btnGiftApp];
    [alert addAction:btnRecommendApp];
    alert.view.tintColor = [UIColor redColor];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) btnBackClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_dictData[@"link2"] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailStickerCell *cell;
    
    NSArray *array = _dictData[@"link2"];
    NSDictionary *dictionary = [array objectAtIndex:indexPath.row];
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell1" forIndexPath:indexPath];
    
    //---------------------------------------------------------
    //set image using SDWebImage
    NSString *url = dictionary[@"link21"];
    NSURL *imgUrl = [NSURL URLWithString:url];
    [cell.imgView sd_setImageWithURL:imgUrl placeholderImage:nil];
    
    [cell addSubview:cell.imgView];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _stickerInfoVC = [storyboard instantiateViewControllerWithIdentifier:@"StickerInfo"];
    NSDictionary *dictDetailData = [_dictData[@"link2"] objectAtIndex:indexPath.row];
    _stickerInfoVC.dictDetailData = dictDetailData;
    UIView* myView = _stickerInfoVC.view;
    UIWindow* currentWindow = [UIApplication sharedApplication].keyWindow;
    [currentWindow addSubview:myView];
}

#pragma mark - Setup collection view cell
//---------------------------------------------------------
// Layout: Set cell size

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize cellSize = CGSizeMake(71, 71);
    return cellSize;
}

//---------------------------------------------------------
// Spacing for cell
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 12;
}

//---------------------------------------------------------
// Spacing for line
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 15;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
