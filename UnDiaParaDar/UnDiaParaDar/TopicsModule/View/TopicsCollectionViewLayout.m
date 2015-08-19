//
//  TopicsCollectionViewLayout.m
//  UnDiaParaDar
//
//  Created by Facundo Menzella on 8/19/15.
//  Copyright (c) 2015 ITBA. All rights reserved.
//

#import "TopicsCollectionViewLayout.h"
#import "TopicCollectionViewCell.h"

static TopicCollectionViewCell *cell;
static CGFloat MINIMUM_LINE_SPACING = 24;
static CGFloat MINIMUM_INTERITEM_SPACING = 24;
static CGFloat TOP_INSET = 16;
static CGFloat HORIZONTAL_INSET = 48;
static CGFloat BOTTOM_INSET = 16;

@implementation TopicsCollectionViewLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        cell = [[TopicCollectionViewCell alloc] init];
    }
    return self;
}

- (CGSize)itemSize
{
    return [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
}

- (CGFloat)minimumInteritemSpacing
{
    return MINIMUM_INTERITEM_SPACING;
}

- (CGFloat)minimumLineSpacing
{
    return MINIMUM_LINE_SPACING;
}

@end