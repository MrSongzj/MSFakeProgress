//
//  MSFakeProgress.m
//  MSFakeProgress
//
//  Created by MrSong on 15/8/8.
//  Copyright (c) 2015年 MrSong. All rights reserved.
//

#import "MSFakeProgress.h"

@implementation MSFakeProgress
{
    NSTimer *_timer;
    float _progress;
    BOOL _isFinish;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _progress = 0.f;
        _isFinish = NO;
    }
    return self;
}

- (instancetype)initWithDelegate:(id<MSFakeProgressDelegate>)delegate
{
    self = [super init];
    if (self) {
        _progress = 0.f;
        self.fakeProgressDelegate = delegate;
    }
    return self;
}

- (void)reset
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    _progress = 0.f;
    _isFinish = NO;
    if ([self.fakeProgressDelegate respondsToSelector:@selector(fakeProgressRunning:)]) {
        [self.fakeProgressDelegate fakeProgressRunning:0.f];
    }
}

- (void)start
{
    if (_progress >= 1.f) {
        return;
    }
    if ([self.fakeProgressDelegate respondsToSelector:@selector(fakeProgressStart)]) {
        [self.fakeProgressDelegate fakeProgressStart];
    }
    _isFinish = NO;
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:timerInterval target:self selector:@selector(timerCallback) userInfo:nil repeats:YES];
    }
}

- (void)finish
{
    _isFinish = YES;
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:timerInterval target:self selector:@selector(timerCallback) userInfo:nil repeats:YES];
    }
}

- (void)timerCallback
{
    if (_isFinish) {
        _progress += progressIncrement * 5;
    }
    else {
        if (_progress >= 0.9f) {
            _progress = 0.9f;
            [_timer invalidate];
            _timer = nil;
        }
        else if (_progress >= 0.75f) {
            _progress += progressIncrement * 0.1;
        }
        else if (_progress >= 0.55f) {
            _progress += progressIncrement * 0.4;
        }
        else {
            _progress += progressIncrement;
        }
    }
    
    if (_progress >= 1.f) {
        _progress = 1.f;
        if ([self.fakeProgressDelegate respondsToSelector:@selector(fakeProgressRunning:)]) {
            [self.fakeProgressDelegate fakeProgressRunning:_progress];
        }
        if ([self.fakeProgressDelegate respondsToSelector:@selector(fakeProgressFinish)]) {
            [self.fakeProgressDelegate fakeProgressFinish];
        }
        
        [_timer invalidate];
        _timer = nil;
    }
    else {
        if ([self.fakeProgressDelegate respondsToSelector:@selector(fakeProgressRunning:)]) {
            [self.fakeProgressDelegate fakeProgressRunning:_progress];
        }
    }
}


@end
