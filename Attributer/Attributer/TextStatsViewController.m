//
//  TextStatsViewController.m
//  Attributer
//
//  Created by cunli on 3/6/15.
//  Copyright (c) 2015 cunli. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *colorfulCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharactersLabel;

@end

@implementation TextStatsViewController

- (void)setTextToAnalyze:(NSAttributedString *)textToAnalyze
{
    _textToAnalyze = textToAnalyze;
    if (self.view.window) [self updateUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (NSAttributedString *)charactersWithAttribute:(NSString *)attributeName
{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc] init];
    
    int index = 0;
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = (int)(range.location + range.length);
        }
        else {
            index++;
        }
    }
    
    return characters;
}

- (void)updateUI
{
    self.colorfulCharactersLabel.text = [NSString stringWithFormat:@"%d colorful characters", (int)[[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
    self.outlinedCharactersLabel.text = [NSString stringWithFormat:@"%d outlined characters", (int)[[self charactersWithAttribute:NSStrokeWidthAttributeName] length]];
    
}

@end
