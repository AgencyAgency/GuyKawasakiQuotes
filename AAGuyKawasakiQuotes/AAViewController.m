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
                  @"Screen Shot 2013-10-11 at 11.47.08 AM.png",
                  @"GuyKawasaki1.jpg",
                  @"GuyKawasaki2.jpg",
                  @"GuyKawasaki3.jpeg",
                  @"GuyKawasaki4.jpg",
                  @"GuyKawasaki5.jpg",
                  ];
    }
    return _mugs;
}

- (NSArray *)quotes
{
    if (!_quotes) {
        _quotes = @[
                    @"Poopoo pills fight gut bacterial infection.",
                    @"Patience is the art of concealing your impatience.",
                    @"Steve [Jobs] proves that it's OK to be an asshole... He just has a different OS.",
<<<<<<< HEAD
                    @"Don’t evangelize crap.",
                    @"Be unique and valuable.",
                    @"Don't worry, be crappy.",
                    @"Ask, “So what? … Who gives a shiitake?”",
                    @"The hardest thing about getting started is getting started.",
                    @"Try stuff.",
                    @"Tolerate criticism.",
                    @"It's a little ridiculous.",
                    @"I am a bozo.",
                    @"They make cool stuff work. Sometimes the cool stuff works. And sometimes the cool stuff doesn't work",
                    @"Evangelism is selling a dream.",
                    @"If you don't toot your own horn, don't complain if there's no music.",
=======
                    @"While we're living, we need to get over ourselves and accept others if we want to enchant people."
>>>>>>> 267a2251a663f402495f11e38a1ef322cee231c0
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
