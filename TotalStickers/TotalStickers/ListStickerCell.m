//
//  ListStickerCell.m
//  TotalStickers
//
//  Created by Quang Dai on 4/28/16.
//  Copyright © 2016 Quang Dai. All rights reserved.
//

#import "ListStickerCell.h"

@implementation ListStickerCell
@synthesize imgMainSticker, numberOfStickerInEachMainSticker, imgNumberFolder;
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        imgMainSticker = [[UIImageView alloc] init];
        numberOfStickerInEachMainSticker = [[UILabel alloc] init];
        imgNumberFolder = [[UIImageView alloc] init];
        [self addSubview:imgMainSticker];
        [self addSubview:numberOfStickerInEachMainSticker];
        [self addSubview:imgNumberFolder];
    }
    return  self;
}
@end
