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
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iolaniLogoImageView;
@property (assign, nonatomic) BOOL isShowingIntro;
@end

@implementation AAViewController

- (void)awakeFromNib
{
    self.isShowingIntro = YES;
}

- (void)displayIntroPhase2
{
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:0
                     animations:^{
                         for (UIView *subview in self.view.subviews) {
                             subview.alpha = 1.0;
                         }
                     }
                     completion:nil];
}

- (void)displayIntroPhase1
{
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:0
                     animations:^{
                         self.titleLabel.alpha = 1.0;
                         self.iolaniLogoImageView.alpha = 1.0;
                     }
                     completion:^(BOOL finished) {
                         [self displayIntroPhase2];
                     }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.isShowingIntro) {
        for (UIView *subview in self.view.subviews) {
            subview.alpha = 0.0;
        }
        [self displayIntroPhase1];
    }
}

- (IBAction)newQuotePressed:(UIButton *)sender {
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:0
                     animations:^{
                         self.quoteTextView.alpha = 0.0;
                         self.mugImageView.alpha = 0.0;
                     }
                     completion:^(BOOL finished) {
                         [self showNewRandomQuote];
                         [UIView animateWithDuration:0.5
                                               delay:0.0
                                             options:0
                                          animations:^{
                                              self.quoteTextView.alpha = 1.0;
                                              self.mugImageView.alpha = 1.0;
                                          }
                                          completion:nil];
                     }];
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
                  @"images.jpeg"
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
                    @"While we're living, we need to get over ourselves and accept others if we want to enchant people.",
                    @"Patience is the art of concealing your impatience.",
                    @"Pursuing your passions makes you more interesting, and interesting people are enchanting.",
                    @"Lots of things made the first Mac in 1984 a piece of crap, but it was a revolutionary piece of crap.",
                    @"Inertia. Guy’s law of enchantment: “People at rest will remain at rest, and people in motion will keep moving in the same direction unless an outside enchanter acts upon them.",
                    @"What I lack is talent, I compensate by willing to grind it out. That's the secret of my life."


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
