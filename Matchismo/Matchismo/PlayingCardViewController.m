//
//  PlayingCardViewController.m
//  Matchismo
//
//  Created by cunli on 3/6/15.
//  Copyright (c) 2015 cunli. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"

@implementation PlayingCardViewController

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}
@end
