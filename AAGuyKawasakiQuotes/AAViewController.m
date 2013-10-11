//
//  AAViewController.m
//  AAGuyKawasakiQuotes
//
//  Created by Kyle Oba on 10/11/13.
//  Copyright (c) 2013 Kyle Oba. All rights reserved.
//

#import "AAViewController.h"

@interface AAViewController ()
@property (weak, nonatomic) IBOutlet UITextView *quoteTextView;
@property (strong, nonatomic) NSArray *quotes;
@property (strong, nonatomic) NSArray *mugs;
@property (weak, nonatomic) IBOutlet UIImageView *mugImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mugHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mugWidthConstraint;
@end

@implementation AAViewController

- (IBAction)newQuotePressed:(UIButton *)sender {
    [self showNewRandomQuote];
}

- (NSArray *)mugs
{
    if (!_mugs) {
        _mugs = @[
                  @"Screen-Shot-2012-12-11-at-15.24.19.jpg",
                  @"Screen Shot 2013-10-11 at 11.47.08 AM.png"
                  ];
    }
    return _mugs;
}

- (NSArray *)quotes
{
    if (!_quotes) {
        _quotes = @[
                    @"Poopoo pills fight gut bacterial infection http://is.gd/oLS601",
                    @"Patience is the art of concealing your impatience.",
                    @"Steve [Jobs] proves that it's OK to be an asshole... He just has a different OS."
                    ];
    }
    return _quotes;
}

- (void)showNewRandomQuote
{
    NSUInteger randomIndex = arc4random() % [self.quotes count];
    self.quoteTextView.text = [self.quotes objectAtIndex:randomIndex];
    [self showNextMug];
}

- (void)showNextMug
{
    NSUInteger randomIndex = arc4random() % [self.mugs count];
    NSString *mugImageName = [self.mugs objectAtIndex:randomIndex];
    UIImage *mugImage = [UIImage imageNamed:mugImageName];
    self.mugImageView.image = mugImage;
    self.mugHeightConstraint.constant = mugImage.size.height;
    self.mugWidthConstraint.constant = mugImage.size.width;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self showNewRandomQuote];    
}

@end
