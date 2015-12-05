//
//  ViewController.m
//  Attributer
//
//  Created by cunli on 3/5/15.
//  Copyright (c) 2015 cunli. All rights reserved.
//

#import "ViewController.h"
#import "TextStatsViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UILabel *headline;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;

@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Analyze Text"]) {
        if ([segue.destinationViewController isKindOfClass:[TextStatsViewController class]]) {
            TextStatsViewController *tsvc = (TextStatsViewController *)segue.destinationViewController;
            tsvc.textToAnalyze = self.body.textStorage;
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:self.outlineButton.currentTitle];
    [title setAttributes:@{ NSStrokeWidthAttributeName : @3, NSStrokeColorAttributeName : self.outlineButton.tintColor} range:NSMakeRange(0, [title length])];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self usePreferredFonts];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferredFontsChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
}

//Not a good place to do that
- (void)viewWillDisappear:(BOOL)animated
{
    TextStatsViewController *tsvc = (TextStatsViewController *)[[self.tabBarController viewControllers] objectAtIndex:1];
        tsvc.textToAnalyze = self.body.textStorage;
}

- (void)preferredFontsChanged:(NSNotification *)notification
{
    [self usePreferredFonts];
}

- (void)usePreferredFonts
{
    self.body.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.headline.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    
}

- (IBAction)changeBodySelectionColorToMatchBackgroundOfButton:(UIButton *)sender
{
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName value: sender.backgroundColor range:self.body.selectedRange];
}

- (IBAction)outlineBodySelection:(id)sender {
    [self.body.textStorage addAttributes:@{ NSStrokeWidthAttributeName : @-3, NSStrokeColorAttributeName : [UIColor blackColor]} range:self.body.selectedRange];
}

- (IBAction)unoutlineBodySelection:(id)sender {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName
                                     range:self.body.selectedRange];
}


@end
