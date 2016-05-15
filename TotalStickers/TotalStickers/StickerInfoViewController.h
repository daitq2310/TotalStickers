//
//  StickerInfoViewController.h
//  TotalStickers
//
//  Created by Quang Dai on 4/27/16.
//  Copyright © 2016 Quang Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StickerInfoViewController : UIViewController
@property (strong, nonatomic) NSDictionary *dictDetailData;
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UIButton *btnClose;
- (IBAction)btnCloseClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnSendToMessenger;
- (IBAction)btnSendToMessengerClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *imgStickerInfo;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
- (IBAction)btnBackTouchUpInside:(id)sender;



@end
