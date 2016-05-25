//
//  DetailStickerViewController.h
//  TotalStickers
//
//  Created by Quang Dai on 4/19/16.
//  Copyright © 2016 Quang Dai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StickerInfoViewController.h"

@interface DetailStickerViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>


@property NSDictionary *dictData;
@property (weak, nonatomic) IBOutlet UICollectionView *detailStickerCollectionView;
@property StickerInfoViewController *stickerInfoVC;

@end
