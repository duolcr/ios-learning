//
//  Card.h
//  Matchismo
//
//  Created by cunli on 2/6/15.
//  Copyright (c) 2015 cunli. All rights reserved.
//

@import Foundation;

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
