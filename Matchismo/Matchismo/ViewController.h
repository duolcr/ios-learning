//
//  ViewController.h
//  Matchismo
//
//  Created by cunli on 1/29/15.
//  Copyright (c) 2015 cunli. All rights reserved.
//
//  Abstract class.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController

//protected
//for subclasses
- (Deck *)createDeck;

@end

