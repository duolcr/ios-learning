//
//  PlayingCardView.h
//  SuperCard
//
//  Created by cunli on 3/11/15.
//  Copyright (c) 2015 cunli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSInteger rank;
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) BOOL faceUp;

@end
