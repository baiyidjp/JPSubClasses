//
//  TestViewController.m
//  JPSubClasses
//
//  Created by SteyDong on 2021/5/17.
//

#import "TestViewController.h"
#import "JPThread.h"
#import "JPOperation.h"
#import "JPOperationQueue.h"
#import "JPProxy.h"

@interface TestViewController ()

/** thread */
@property(nonatomic,strong) JPThread *thread;
/** link */
//@property(nonatomic,strong) CADisplayLink *link;
/** timer */
//@property(nonatomic,strong) NSTimer *timer;
/** timer */
@property(nonatomic,strong) dispatch_source_t timer;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//
    self.thread = [[JPThread alloc] init];

    [self.thread start];
    
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//
//    dispatch_queue_t queue = dispatch_queue_create("MyQueue", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t queue1 = dispatch_queue_create("MyQueue11", DISPATCH_QUEUE_SERIAL);
//
//
//    dispatch_sync(queue, ^{
//        dispatch_async(dispatch_get_main_queue(), ^{
//            for (int i = 0; i < 5; i++) {
//                NSLog(@"1 - %d %@",i, [NSThread currentThread]);
//            }
//        });
//    });
    
    // 主线程: 在主队列中同步执行任务会造成 死锁
//    NSLog(@"任务1");
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"任务2");
//    });
//    NSLog(@"任务3");
    
    // 不会死锁
//    dispatch_async(queue, ^{
//        NSLog(@"1- %@", [NSThread currentThread]);
//        // 非主线程: 在串行队列中同步执行另外一个队列的任务不会造成 死锁
//        dispatch_sync(queue1, ^{
//            NSLog(@"2- %@", [NSThread currentThread]);
//        });
//        NSLog(@"3- %@", [NSThread currentThread]);
//    });

//    dispatch_async(queue, ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"2 - %d %@",i, [NSThread currentThread]);
//        }
//    });
    
//    dispatch_group_t group = dispatch_group_create();
//
//    dispatch_group_async(group, queue, ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"任务1 - %@ - %d", [NSThread currentThread], i);
//        }
//    });
//
//    dispatch_group_async(group, queue, ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"任务2 - %@ - %d", [NSThread currentThread], i);
//        }
//    });
//
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"任务3 - %@ - %d", [NSThread currentThread], i);
//        }
//    });
    
//    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(__test)];
//    [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:[JPProxy proxyWidthTarget:self] selector:@selector(__test) userInfo:nil repeats:YES];
    
//    __weak typeof(self) weakSelf = self;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [weakSelf __test];
//    }];
    
//    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
//    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), 1 * NSEC_PER_SEC, 0);
//    dispatch_source_set_event_handler(timer, ^{
//        NSLog(@"timer");
//    });
//    dispatch_resume(timer);
//    self.timer = timer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    JPOperationQueue *queue = [[JPOperationQueue alloc] init];
//
//    for (int i = 0; i < 10; i++) {
//
//        JPOperation *op = [[JPOperation alloc] initWithName:[NSString stringWithFormat:@"operation%d", i] parameters:@{} completion:^(JPOperation * _Nonnull operation) {
//            NSLog(@"执行 operation - %d ", i);
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                [operation done];
//            });
//        }];
//        [queue addOperation:op];
//    }
//
//    queue.operationsAllDone = ^{
//        NSLog(@"all done");
//    };
//
//    NSThread *thread = [[NSThread alloc] initWithBlock:^{
//        NSLog(@"1");
//        // 启动runLoop
//        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
//    }];
//    [thread start];
//
//    [self performSelector:@selector(__test) onThread:thread withObject:nil waitUntilDone:YES];
    
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    dispatch_async(queue, ^{
//        NSLog(@"1");
//        [self performSelector:@selector(__test) withObject:nil afterDelay:0];
//        NSLog(@"3");
//        // 启动runLoop
////        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
//    });
//
//    NSLog(@"1");
//    [self performSelector:@selector(__test) withObject:nil afterDelay:0];
//    NSLog(@"3");
    
    [self.thread executeTask:^{
        NSLog(@"执行Task %@", [NSThread currentThread]);
    }];
}

- (void)__test {
    
    NSLog(@"2");
}

- (IBAction)onClickStop:(id)sender {
    
//    [self.thread stop];
}

- (void)dealloc {
    
    NSLog(@"%s", __func__);
//    [self.link invalidate];
//    [self.timer invalidate];
//    dispatch_source_cancel(self.timer);
}

@end
