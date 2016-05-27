//
//  ActionSheetViewController.m
//  TotalStickers
//
//  Created by Quang Dai on 5/27/16.
//  Copyright © 2016 Quang Dai. All rights reserved.
//

#import "ActionSheetViewController.h"

@interface ActionSheetViewController ()

@end

@implementation ActionSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:100.0f / 255.0f green:100.0f / 255.0f blue:100.0f / 255.0f alpha:0.4f];
    [self layoutActionSheet];
    [self setImageForLabel];
    [self displayCustomActionSheet];
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

- (void) layoutActionSheet {
    _btnCancel.layer.cornerRadius = 7;
    _btnGiftApp.layer.cornerRadius = 7;
    _btnMoreApps.layer.cornerRadius = 7;
    _btnRateApp.layer.cornerRadius = 7;
    _btnRecommendApp.layer.cornerRadius = 7;
    _viewBound.layer.cornerRadius = 7;
}

- (void) setImageForLabel {
    UIImage *img = [UIImage imageNamed:@"Test1"];
    CGSize imgSize = _lblTitle.frame.size;
    
    UIGraphicsBeginImageContext( imgSize );
    [img drawInRect:CGRectMake(0,0,imgSize.width,imgSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    _lblTitle.backgroundColor = [UIColor colorWithPatternImage:newImage];
}


- (void) displayCustomActionSheet {
    [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveLinear animations:^{
        _viewBound.frame = CGRectMake(_viewBound.frame.origin.x, _viewBound.frame.origin.y - _viewBound.frame.size.height, _viewBound.frame.size.width, _viewBound.frame.size.height);
        
        _btnCancel.frame = CGRectMake(_btnCancel.frame.origin.x, _btnCancel.frame.origin.y - _viewBound.frame.size.height, _btnCancel.frame.size.width, _btnCancel.frame.size.height);
        
        _btnRecommendApp.frame = CGRectMake(_btnRecommendApp.frame.origin.x, _btnRecommendApp.frame.origin.y - _viewBound.frame.size.height, _btnRecommendApp.frame.size.width, _btnRecommendApp.frame.size.height);
        
        _btnGiftApp.frame = CGRectMake(_btnGiftApp.frame.origin.x, _btnGiftApp.frame.origin.y - _viewBound.frame.size.height, _btnGiftApp.frame.size.width, _btnGiftApp.frame.size.height);
        
        _btnRateApp.frame = CGRectMake(_btnRateApp.frame.origin.x, _btnRateApp.frame.origin.y - _viewBound.frame.size.height, _btnRateApp.frame.size.width, _btnRateApp.frame.size.height);
        
        _btnMoreApps.frame = CGRectMake(_btnMoreApps.frame.origin.x, _btnMoreApps.frame.origin.y - _viewBound.frame.size.height, _btnMoreApps.frame.size.width, _btnMoreApps.frame.size.height);
        
        _lblTitle.frame = CGRectMake(_lblTitle.frame.origin.x, _lblTitle.frame.origin.y - _viewBound.frame.size.height, _lblTitle.frame.size.width, _lblTitle.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void) dismissCustomActionSheet {
    [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveLinear animations:^{
        _viewBound.frame = CGRectMake(_viewBound.frame.origin.x, _viewBound.frame.origin.y + _viewBound.frame.size.height, _viewBound.frame.size.width, _viewBound.frame.size.height);
        
        _btnCancel.frame = CGRectMake(_btnCancel.frame.origin.x, _btnCancel.frame.origin.y + _viewBound.frame.size.height, _btnCancel.frame.size.width, _btnCancel.frame.size.height);
        
        _btnRecommendApp.frame = CGRectMake(_btnRecommendApp.frame.origin.x, _btnRecommendApp.frame.origin.y + _viewBound.frame.size.height, _btnRecommendApp.frame.size.width, _btnRecommendApp.frame.size.height);
        
        _btnGiftApp.frame = CGRectMake(_btnGiftApp.frame.origin.x, _btnGiftApp.frame.origin.y + _viewBound.frame.size.height, _btnGiftApp.frame.size.width, _btnGiftApp.frame.size.height);
        
        _btnRateApp.frame = CGRectMake(_btnRateApp.frame.origin.x, _btnRateApp.frame.origin.y + _viewBound.frame.size.height, _btnRateApp.frame.size.width, _btnRateApp.frame.size.height);
        
        _btnMoreApps.frame = CGRectMake(_btnMoreApps.frame.origin.x, _btnMoreApps.frame.origin.y + _viewBound.frame.size.height, _btnMoreApps.frame.size.width, _btnMoreApps.frame.size.height);
        
        _lblTitle.frame = CGRectMake(_lblTitle.frame.origin.x, _lblTitle.frame.origin.y + _viewBound.frame.size.height, _lblTitle.frame.size.width, _lblTitle.frame.size.height);
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
}

- (IBAction)btnRecommendAppTouchUpInside:(id)sender {
    [self dismissCustomActionSheet];
}

- (IBAction)btnGiftAppTouchUpInside:(id)sender {
    [self dismissCustomActionSheet];
}

- (IBAction)btnRateAppTouchUpInside:(id)sender {
    [self dismissCustomActionSheet];
}

- (IBAction)btnMoreAppsTouchUpInside:(id)sender {
    [self dismissCustomActionSheet];
}

- (IBAction)btnCancelTouchUpInside:(id)sender {
    [self dismissCustomActionSheet];
}

- (IBAction)btnDismissTouchUpInside:(id)sender {
    [self dismissCustomActionSheet];
}


@end
