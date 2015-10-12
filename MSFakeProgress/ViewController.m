//
//  ViewController.m
//  MSFakeProgress
//
//  Created by MrSong on 15/8/8.
//  Copyright (c) 2015年 MrSong. All rights reserved.
//

#import "ViewController.h"
#import "MSFakeProgress.h"

@interface ViewController ()<MSFakeProgressDelegate>

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UISlider *sliderView;

@property (strong, nonatomic) MSFakeProgress *fakeProgress;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fakeProgress = [[MSFakeProgress alloc] initWithDelegate:self];
    self.sliderView.value = 0.f;
    UIImage *thumbImage = [UIImage imageNamed:@"slider.png"];
    [_sliderView setThumbImage:thumbImage forState:UIControlStateNormal];
}

- (IBAction)startAction:(id)sender
{
    [_fakeProgress start];
}

- (IBAction)resetAction:(id)sender
{
    [_fakeProgress reset];
}

- (IBAction)finishAction:(id)sender
{
    [_fakeProgress finish];
}

#pragma mark - MSFakeProgress Delegate

- (void)fakeProgressStart
{
    
}

- (void)fakeProgressRunning:(float)progress
{
    NSLog(@"progress = %f",progress);
    _sliderView.value = progress;
}

- (void)fakeProgressFinish
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
