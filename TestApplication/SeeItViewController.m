//
//  SeeItViewController.m
//  TestApplication
//
//  Created by hee-hah on 14-1-3.
//  Copyright (c) 2014年 Hee-Hah iOS Developing. All rights reserved.
//

#import "SeeItViewController.h"

@interface SeeItViewController ()
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (strong, nonatomic) IBOutlet UIProgressView *loadingBar;
@property (strong, nonatomic) IBOutlet UILabel *loadingLabel;
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSTimer *timer2;
- (IBAction)didPressedButton:(UIButton *)sender;
@end

@implementation SeeItViewController

// 有property也有sythesize
@synthesize activity;
@synthesize loadingBar;
@synthesize loadingLabel;
@synthesize timer;
@synthesize startButton;
@synthesize timeLabel;
@synthesize timer2;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.loadingLabel.text = @"Please Hit button";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)countSeconds
{
    int millonseconds = 0;
    int seconds = 0;
    int minutes = 0;
    int hours = 0;
    
    millonseconds += 1;
    
    if (millonseconds == 10)
    {
        seconds += 1;
        millonseconds = 0;
    }else if (seconds == 60)
    {
        minutes += 1;
        seconds = 0;
    }else if (minutes == 60)
    {
        hours += 1;
        minutes = 0;
    }
    timeLabel.text = [NSString stringWithFormat:@"%d:%d:%d.%d",hours,minutes,seconds,millonseconds];
    timeLabel.textColor = [UIColor blueColor];
    
}
- (void)startCounting
{
    self.loadingBar.progress += 0.01;
    if (self.loadingBar.progress == 1)
    {
        self.loadingLabel.text = @"Counting.";
        self.loadingLabel.textColor = [UIColor blueColor];
        timer2 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(countSeconds) userInfo:Nil repeats:YES];
    }
}
- (IBAction)didPressedButton:(UIButton *)sender
{
    [self.activity startAnimating];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(startCounting) userInfo:Nil repeats:YES];
}
@end
