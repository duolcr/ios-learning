//
//  PlayingCard.h
//  Matchismo
//
//  Created by cunli on 3/2/15.
//  Copyright (c) 2015 cunli. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSArray *)rankStrings;
+ (NSUInteger)maxRank;

@end
