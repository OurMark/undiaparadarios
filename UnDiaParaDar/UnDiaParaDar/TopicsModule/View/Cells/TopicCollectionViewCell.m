//
//  TopicCollectionViewCell.m
//  UnDiaParaDar
//
//  Created by Facundo Menzella on 8/14/15.
//  Copyright (c) 2015 ITBA. All rights reserved.
//

#import "TopicCollectionViewCell.h"
#import "Topic.h"
#import <UIView+AutoLayout.h>

@interface TopicCollectionViewCell ()

@property (nonatomic, strong) UIImageView *topicImageView;
@property (nonatomic, strong) UILabel *topicLabel;

@end

@implementation TopicCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildSubviews];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self buildSubviews];
    }
    return self;
}

- (void)buildSubviews
{
    [self buildTopicImageView];
    [self buildTopicLabel];
    [self styleCellSubviews];
}

 - (void)buildTopicImageView
{
    self.topicImageView = [[UIImageView alloc] initForAutoLayout];
    [self.contentView addSubview:self.topicImageView];
    [self.topicImageView autoSetDimension:ALDimensionWidth toSize:123 / 2];
    [self.topicImageView autoSetDimension:ALDimensionHeight toSize:128 / 2];
    [self.topicImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [self.topicImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [self.topicImageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
}

- (void)buildTopicLabel
{
    self.topicLabel = [[UILabel alloc] initForAutoLayout];
    [self.contentView addSubview:self.topicLabel];
    [self.topicLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.topicImageView];
    [self.topicLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [self.topicLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [self.topicLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
}

 - (void)styleCellSubviews
{
    [self styleTopicLabel];
}

 - (void)styleTopicLabel
{
    self.topicLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)populateCellWithTopic:(Topic *)topic
{
    UIImage *topicImage = [UIImage imageNamed: topic.img];
    [self.topicImageView setImage:topicImage];
    
    [self.topicLabel setText:topic.name];
}

@end