//
//  ViewController.h
//  TotalStickers
//
//  Created by Quang Dai on 4/16/16.
//  Copyright © 2016 Quang Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *stickerCollectionView;
@property NSArray *jsonLinkArray;

@end

