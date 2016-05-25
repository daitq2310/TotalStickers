//
//  ViewController.m
//  TotalStickers
//
//  Created by Quang Dai on 4/16/16.
//  Copyright © 2016 Quang Dai. All rights reserved.
//

#import "ViewController.h"
#import "DetailStickerViewController.h"
#import "ListStickerCell.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.stickerCollectionView.backgroundColor = [UIColor clearColor];
    [self readResource];
    [self customNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) customNavigation {
    //---------------------------------------------------------
    //set color for navigation bar
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:3.0f/255.0f green:155.0f/255.0f blue:229.0f/255.0f alpha:1.0f];
    
    //---------------------------------------------------------
    //set title for back button
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //---------------------------------------------------------
    //set first title
    self.navigationItem.title = @"Total Stickers";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"ChalkboardSE-Bold" size:23], NSFontAttributeName, nil]];
    
    //---------------------------------------------------------
    //change style of StatusBar
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;

    //---------------------------------------------------------
    //Right button
    UIButton *btnMore = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:@"more"]  ;
    [btnMore setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [btnMore addTarget:self action:@selector(btnMoreTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    btnMore.frame = CGRectMake(0, 0, 25, 25);
    UIBarButtonItem *buttonMore = [[UIBarButtonItem alloc] initWithCustomView:btnMore] ;
    self.navigationItem.rightBarButtonItem = buttonMore;
}

- (void) readResource {
    NSError *jsonError;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"link" ofType:@"txt"];
    
    NSString* content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&jsonError];
    
    NSData *objectData = [content dataUsingEncoding:NSUTF8StringEncoding];
    _jsonLinkArray = [NSJSONSerialization JSONObjectWithData:objectData options:NSJSONReadingMutableContainers
                                                       error:&jsonError];
    NSLog(@"%ld", [_jsonLinkArray count]);
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_jsonLinkArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ListStickerCell * cell;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell1" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 71, 71)];
    
    NSDictionary *dictData = [_jsonLinkArray objectAtIndex:indexPath.row];

    //---------------------------------------------------------
    //set image using SDWebImage
    NSString *url = dictData[@"link1"];
    NSURL *imgUrl = [NSURL URLWithString:url];
    [cell.imgMainSticker sd_setImageWithURL:imgUrl placeholderImage:nil];
    cell.numberOfStickerInEachMainSticker.text = [NSString stringWithFormat:@"%ld", [dictData[@"link2"] count]];
    cell.imgNumberFolder.image = [UIImage imageNamed:@"folder2"];
    [cell addSubview:imgView];
    
    return cell;		
}

- (void) btnMoreTouchUpInside : (id) sender {
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
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Select item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dictData = [_jsonLinkArray objectAtIndex:indexPath.row];
    DetailStickerViewController *detaiStickerVC = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"DetailSticker"];
    
        detaiStickerVC.dictData = dictData;
    
    
    [self.navigationController pushViewController:detaiStickerVC animated:YES];
}

#pragma mark - Setup collection view cell
//---------------------------------------------------------
// Layout: Set cell size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize cellSize = CGSizeMake(71, 101);
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

@end
