//
//  ListStickerCell.h
//  TotalStickers
//
//  Created by Quang Dai on 4/28/16.
//  Copyright © 2016 Quang Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListStickerCell : UICollectionViewCell
@property (retain, nonatomic) IBOutlet UIImageView *imgMainSticker;
@property (retain, nonatomic) IBOutlet UILabel *numberOfStickerInEachMainSticker;
@property (retain, nonatomic) IBOutlet UIImageView *imgNumberFolder;

@end
