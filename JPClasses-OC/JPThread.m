//
//  JPThread.m
//  JPSubClasses
//
//  Created by SteyDong on 2021/5/17.
//

#import "JPThread.h"

@interface JPThread ()

/** thread */
@property(nonatomic,strong) NSThread *innerThread;
/** stopped */
@property(nonatomic,assign, getter=isStopped) BOOL stopped;

@end

@implementation JPThread

- (instancetype)init {
    
    if (self = [super init]) {
    
        self.stopped = NO;
        
        __weak typeof(self) weakSelf = self;
        
        self.innerThread = [[NSThread alloc] initWithBlock:^{
           
//            [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
            
            while (weakSelf && !weakSelf.isStopped) {
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
            
            NSLog(@"Thread stop");
            
        }];
        
    }
    return self;
}

- (void)start {
    
    [self __threadStart];
}

- (void)__threadStart {
    
    [self.innerThread start];
}

- (void)executeTask:(JPThreadTask)task {
    
    if (!self.innerThread || !task) {
        return;
    }
    
    [self performSelector:@selector(__threadExecuteTask:) onThread:self.innerThread withObject:task waitUntilDone:NO];
}

- (void)__threadExecuteTask:(JPThreadTask)task {
    
    task();
}

- (void)stop {
    
    if (!self.innerThread || !self.innerThread.isExecuting) {
        return;
    }
    
    [self performSelector:@selector(__threadStop) onThread:self.innerThread withObject:nil waitUntilDone:YES];
    
    NSLog(@"%s",__func__);
}

- (void)__threadStop {
    
    self.stopped = YES;
    
    CFRunLoopStop(CFRunLoopGetCurrent());
    
    self.innerThread = nil;
}

- (void)dealloc {
    
    NSLog(@"%s",__func__);
    
    [self stop];
}

@end
