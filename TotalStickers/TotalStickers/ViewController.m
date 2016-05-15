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
    //set color for navigation bar
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:3.0f/255.0f green:155.0f/255.0f blue:229.0f/255.0f alpha:1.0f];
    
    //set title for back button
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //set first title
    self.navigationItem.title = @"Total Stickers";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"ChalkboardSE-Bold" size:23], NSFontAttributeName, nil]];
    
    //change style of StatusBar
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;

    //Right button
    UIButton *btnMore = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:@"more1.png"]  ;
    [btnMore setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [btnMore addTarget:self action:@selector(btnMoreTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
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
    
//    [imgView setImage:[UIImage imageNamed:@"fan1"]];
//    [cell addSubview:imgView];
//    NSString *url = @"http://vignette3.wikia.nocookie.net/weirdal/images/7/73/Pac-Man.jpeg/revision/latest?cb=20110525204224";
//    NSURL *imgURL = [NSURL URLWithString:url];
//    NSData *data = [NSData dataWithContentsOfURL:imgURL];
    
//    for (NSMutableDictionary *url1 in _jsonDict[@"link"]) {
//        NSString *url2 = url1[@"link1"];
//        NSLog(url2);
//        NSURL *imgURL = [NSURL URLWithString:url2];
//        NSData *data = [NSData dataWithContentsOfURL:imgURL];
//        [imgView setImage:[UIImage imageWithData:data]];
//        [cell addSubview:imgView];
//    };
    //[imgView setImage:[UIImage imageWithData:data]];
    //NSDictionary *dictData = [_jsonDict objectAtIndex:indexPath.row];
    
    //self.navigationItem.title = @"Total Stickers";
    
    NSDictionary *dictData = [_jsonLinkArray objectAtIndex:indexPath.row];
    //NSLog(@"%ld", [dictData[@"link2"] count]);
    
    NSString *url = dictData[@"link1"];
    NSURL *imgUrl = [NSURL URLWithString:url];
//    NSData *data = [NSData dataWithContentsOfURL:imgUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:imgUrl];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (!connectionError) {
            
            cell.imgMainSticker.image = [UIImage imageWithData:data];
            cell.numberOfStickerInEachMainSticker.text = [NSString stringWithFormat:@"%ld", [dictData[@"link2"] count]];
            cell.imgNumberFolder.image = [UIImage imageNamed:@"folder2.png"];
        }
    }];

    
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(imgView.frame.origin.x+56, imgView.frame.origin.y+56, 15, 15)];
//    NSInteger *number = [dictData[@"link2"] count];
//    label.text = number;
//    [imgView addSubview:label];
    [cell addSubview:imgView];
    
    return cell;		
}

- (void) btnMoreTouchUpInside {
    UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:@"Total Stickers" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:nil otherButtonTitles:@"More Apps", @"Rate App", @"Gift App", @"Recommend App", nil];
    [actionSheet showInView : self.view];
}

#pragma mark - Select item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dictData = [_jsonLinkArray objectAtIndex:indexPath.row];
    DetailStickerViewController *detaiStickerVC = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"DetailSticker"];
    [self.navigationController pushViewController:detaiStickerVC animated:YES];
    //[self.revealViewController pushFrontViewController:detaiStickerVC animated:YES];
    detaiStickerVC.dictData = dictData;
}

#pragma mark - Setup collection view cell

// Layout: Set cell size

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize cellSize = CGSizeMake(71, 101);
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

@end
