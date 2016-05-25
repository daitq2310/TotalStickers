//
//  StickerInfoViewController.m
//  TotalStickers
//
//  Created by Quang Dai on 4/27/16.
//  Copyright © 2016 Quang Dai. All rights reserved.
//

#import "StickerInfoViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import <MessageUI/MessageUI.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <FBSDKMessengerShareKit/FBSDKMessengerShareKit.h>

@interface StickerInfoViewController () 
@end

@implementation StickerInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self backgroundStickerInfo];
    [self closeButton];
    [self sendToMessengerButton];
    [self stickerInfoImage];
}

- (void) backgroundStickerInfo {
    self.view.backgroundColor = [UIColor colorWithRed:100.0f / 255.0f green:100.0f / 255.0f blue:100.0f / 255.0f alpha:0.8f];
    _background.layer.cornerRadius = 20.0f;
    _background.layer.borderWidth = 3.0f;
    _background.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.navigationController.view.alpha = 0.8;
}

- (void) stickerInfoImage {
    NSArray *array = _dictDetailData[@"link22"];
    for (NSDictionary *dictionary in array) {
        NSString *url = dictionary[@"link3"];
        NSURL *imgUrl = [NSURL URLWithString:url];
        [_imgStickerInfo sd_setImageWithURL:imgUrl placeholderImage:nil];
    }
    _imgStickerInfo.frame = CGRectMake(0.f, 0.f, 170.0f, 170.0f);
    _imgStickerInfo.center = CGPointMake(_background.frame.size.width / 2, _background.frame.size.height / 2 - 40.0f);
    _imgStickerInfo.contentMode = UIViewContentModeScaleAspectFill;
    _imgStickerInfo.layer.masksToBounds = YES;
}
- (void) closeButton {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = _btnClose.layer.bounds;
    [_btnClose setTitle:@"X" forState:UIControlStateNormal];
    [_btnClose setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btnClose.layer.cornerRadius = _btnClose.frame.size.width / 2;
    _btnClose.layer.borderWidth = 3.0f;
    _btnClose.layer.borderColor = [UIColor lightGrayColor].CGColor;
    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[UIColor colorWithWhite:1.0f alpha:0.1f].CGColor,
                            (id)[UIColor colorWithWhite:0.4f alpha:0.5f].CGColor,
                            nil];
    
    gradientLayer.locations = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.0f],
                               [NSNumber numberWithFloat:1.0f],
                               nil];
    
    gradientLayer.cornerRadius = _btnClose.layer.cornerRadius;
    [_btnClose.layer addSublayer:gradientLayer];
}

- (void) sendToMessengerButton {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = _btnSendToMessenger.layer.bounds;
    [_btnSendToMessenger setTitle:@"Send To Messenger" forState:UIControlStateNormal];
    [_btnSendToMessenger setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btnSendToMessenger.layer.cornerRadius = 10.0f;
    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[UIColor colorWithWhite:1.0f alpha:0.1f].CGColor,
                            (id)[UIColor colorWithWhite:0.4f alpha:0.5f].CGColor,
                            nil];
    
    gradientLayer.locations = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.0f],
                               [NSNumber numberWithFloat:1.0f],
                               nil];
    
    gradientLayer.cornerRadius = _btnSendToMessenger.layer.cornerRadius;
    [_btnSendToMessenger.layer addSublayer:gradientLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)btnCloseClicked:(id)sender {
    [self.view removeFromSuperview];
}
- (IBAction)btnSendToMessengerClicked:(id)sender {
    [FBSDKMessengerSharer shareImage:_imgStickerInfo.image withOptions:nil];
}

- (IBAction)btnBackTouchUpInside:(id)sender {
    [self.view removeFromSuperview];
    //[self dismissViewControllerAnimated:NO completion:^{}];
    
}
@end
