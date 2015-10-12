//
//  MSFakeProgress.h
//  MSFakeProgress
//
//  Created by MrSong on 15/8/8.
//  Copyright (c) 2015年 MrSong. All rights reserved.
//

#import <Foundation/Foundation.h>

#define timerInterval 0.005             // 定时器间隔时间
#define progressIncrement 0.0025f       // 进度条的增量

@protocol MSFakeProgressDelegate <NSObject>

@optional

// 进度开始时回调的方法
- (void)fakeProgressStart;
// 进度走动中回调的方法
- (void)fakeProgressRunning:(float)progress;
// 进度完成时回调的方法
- (void)fakeProgressFinish;

@end

@interface MSFakeProgress : NSObject

@property (weak, nonatomic) id<MSFakeProgressDelegate> fakeProgressDelegate;

- (instancetype)initWithDelegate:(id<MSFakeProgressDelegate>)delegate;
// 重置进度
- (void)reset;
// 进度开始走动
- (void)start;
// 进度完成
- (void)finish;

@end
