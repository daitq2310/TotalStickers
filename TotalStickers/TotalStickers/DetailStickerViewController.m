//
//  DetailStickerViewController.m
//  TotalStickers
//
//  Created by Quang Dai on 4/19/16.
//  Copyright © 2016 Quang Dai. All rights reserved.
//

#import "DetailStickerViewController.h"
#import "DetailStickerCell.h"

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
    //set first title
    self.navigationItem.title = _dictData[@"title"];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"ChalkboardSE-Bold" size:23], NSFontAttributeName, nil]];
    
    //change back button icon
//    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIImage *backBtnImage = [UIImage imageNamed:@"back.png"]  ;
//    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(btnBackClicked) forControlEvents:UIControlEventTouchUpInside];
//    backBtn.frame = CGRectMake(0, 0, 25, 25);
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn] ;
//    self.navigationItem.leftBarButtonItem = backButton;
    UIButton *btnMore = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:@"more1.png"]  ;
    [btnMore setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [btnMore addTarget:self action:@selector(btnMoreTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
    btnMore.frame = CGRectMake(0, 0, 25, 25);
    UIBarButtonItem *buttonMore = [[UIBarButtonItem alloc] initWithCustomView:btnMore] ;
    self.navigationItem.rightBarButtonItem = buttonMore;
}

- (void) btnMoreTouchUpInside {
    UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:@"Total Stickers" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:nil otherButtonTitles:@"More Apps", @"Rate App", @"Gift App", @"Recommend App", nil];
    [actionSheet showInView : self.view];
}

- (void) btnBackClicked {
    [self.navigationController popViewControllerAnimated:YES];
    //[self.revealViewController revealToggleAnimated:YES];
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
    //NSLog(@"%@", array);
    //self.navigationItem.title = _dictData[@"title"];
    
    NSString *url = dictionary[@"link21"];
    
    //UIImageView *imgDetailSticker = [cell.contentView viewWithTag:101];
    //cell.imgView = [cell.contentView viewWithTag:101];
    NSURL *imgUrl = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:imgUrl];
    //NSData *data = [NSData dataWithContentsOfURL:imgUrl];
    //[imgDetailSticker setImage:[UIImage imageWithData:data]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (!connectionError) {
            
            //[imgDetailSticker setImage:[UIImage imageWithData:data]];
            cell.imgView.image = [UIImage imageWithData:data];
            
        }
    }];
    //[cell addSubview:imgDetailSticker];
    
    [cell addSubview:cell.imgView];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _stickerInfoVC = [storyboard instantiateViewControllerWithIdentifier:@"StickerInfo"];
     NSDictionary *dictDetailData = [_dictData[@"link2"] objectAtIndex:indexPath.row];
    _stickerInfoVC.dictDetailData = dictDetailData;
    //[self.view addSubview:_stickerInfoVC.view];
    UIView* myView = _stickerInfoVC.view;
    UIWindow* currentWindow = [UIApplication sharedApplication].keyWindow;
    [currentWindow addSubview:myView];
    //[self presentViewController:_stickerInfoVC animated:NO completion:^{}];
}

#pragma mark - Setup collection view cell

// Layout: Set cell size

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize cellSize = CGSizeMake(71, 71);
    return cellSize;
}

// Spacing for cell
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 12;
}

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

- (IBAction)btnBackClicked:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
