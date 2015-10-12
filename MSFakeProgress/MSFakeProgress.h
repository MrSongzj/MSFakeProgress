//
//  MSFakeProgress.h
//  MSFakeProgress
//
//  Created by MrSong on 15/8/8.
//  Copyright (c) 2015年 MrSong. All rights reserved.
//

#import <Foundation/Foundation.h>

#define timerInterval 0.005
#define progressIncrement 0.0025f

@protocol MSFakeProgressDelegate <NSObject>

- (void)fakeProgressStart;

- (void)fakeProgressRunning:(float)progress;

- (void)fakeProgressFinish;

@end

@interface MSFakeProgress : NSObject

@property (weak, nonatomic) id<MSFakeProgressDelegate> fakeProgressDelegate;

- (instancetype)initWithDelegate:(id<MSFakeProgressDelegate>)delegate;

- (void)reset;

- (void)start;

- (void)finish;

@end
