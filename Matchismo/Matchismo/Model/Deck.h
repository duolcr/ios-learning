//
//  Deck.h
//  Matchismo
//
//  Created by cunli on 3/2/15.
//  Copyright (c) 2015 cunli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

- (void)addCard:(Card *)card;

@end
