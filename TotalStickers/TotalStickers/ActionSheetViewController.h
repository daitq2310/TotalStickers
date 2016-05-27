//
//  ActionSheetViewController.h
//  TotalStickers
//
//  Created by Quang Dai on 5/27/16.
//  Copyright © 2016 Quang Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionSheetViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *viewBound;
@property (weak, nonatomic) IBOutlet UIButton *btnRecommendApp;
- (IBAction)btnRecommendAppTouchUpInside:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnGiftApp;
- (IBAction)btnGiftAppTouchUpInside:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnRateApp;
- (IBAction)btnRateAppTouchUpInside:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnMoreApps;
- (IBAction)btnMoreAppsTouchUpInside:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;
- (IBAction)btnCancelTouchUpInside:(id)sender;
- (IBAction)btnDismissTouchUpInside:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@end
