//
//  DetailStickerCell.m
//  TotalStickers
//
//  Created by Quang Dai on 4/19/16.
//  Copyright © 2016 Quang Dai. All rights reserved.
//

#import "DetailStickerCell.h"

@implementation DetailStickerCell
@synthesize imgView;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        imgView = [[UIImageView alloc] init];
        [self addSubview:imgView];
    }
    return self;
}
@end
