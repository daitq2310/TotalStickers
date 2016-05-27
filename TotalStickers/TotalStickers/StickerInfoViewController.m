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
    [self displayStickerInfo];
}

- (void) backgroundStickerInfo {
    self.view.backgroundColor = [UIColor colorWithRed:100.0f / 255.0f green:100.0f / 255.0f blue:100.0f / 255.0f alpha:0.8f];
    _background.layer.cornerRadius = 7.0f;
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

- (void) displayStickerInfo {
    [UIView animateWithDuration:0.4f delay:0.f options:UIViewAnimationOptionCurveLinear animations:^{
        _background.frame = CGRectMake(_background.frame.origin.x, _background.frame.origin.y - _background.frame.size.height/2 - self.view.frame.size.height/2, _background.frame.size.width, _background.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

- (void) dismissStickerInfo {
    [UIView animateWithDuration:0.4f delay:0.f options:UIViewAnimationOptionCurveLinear animations:^{
        _background.frame = CGRectMake(_background.frame.origin.x, _background.frame.origin.y + _background.frame.size.height/2 + self.view.frame.size.height/2, _background.frame.size.width, _background.frame.size.height);
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
}

- (void) closeButton {
    [_btnClose setTitle:@"X" forState:UIControlStateNormal];
}

- (void) sendToMessengerButton {
    [_btnSendToMessenger setTitle:@"Send To Messenger" forState:UIControlStateNormal];
    [_btnSendToMessenger setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btnSendToMessenger.layer.cornerRadius = 7.0f;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnCloseClicked:(id)sender {
    [self dismissStickerInfo];
}
- (IBAction)btnSendToMessengerClicked:(id)sender {
    [FBSDKMessengerSharer shareImage:_imgStickerInfo.image withOptions:nil];
}

- (IBAction)btnBackTouchUpInside:(id)sender {
    [self dismissStickerInfo];
}
@end
