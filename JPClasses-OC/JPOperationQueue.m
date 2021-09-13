//
//  JPOperationQueue.m
//  JPSubClasses
//
//  Created by SteyDong on 2021/5/18.
//

#import "JPOperationQueue.h"

@interface JPOperationQueue ()

/** innerOperationQueue */
@property(nonatomic,strong) NSOperationQueue *innerOperationQueue;

@end

@implementation JPOperationQueue

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.innerOperationQueue = [[NSOperationQueue alloc] init];
        self.innerOperationQueue.maxConcurrentOperationCount = 1;
        
        [self.innerOperationQueue addObserver:self forKeyPath:@"operationCount" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
    return self;
}


- (instancetype)initWithMaxConcurrentOperationCount:(NSInteger)maxConcurrentOperationCount {
    
    if (self = [super init]) {
        
        self.innerOperationQueue = [[NSOperationQueue alloc] init];
        self.innerOperationQueue.maxConcurrentOperationCount = maxConcurrentOperationCount;
        
        [self.innerOperationQueue addObserver:self forKeyPath:@"operationCount" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
    return self;
}

- (void)addOperation:(NSOperation *)op {
    
    [self.innerOperationQueue addOperation:op];
}
- (void)addOperations:(NSArray<NSOperation *> *)ops waitUntilFinished:(BOOL)wait {
    
    [self.innerOperationQueue addOperations:ops waitUntilFinished:wait];
}
- (void)addOperationWithBlock:(void (^)(void))block {
    
    [self.innerOperationQueue addBarrierBlock:block];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSLog(@"change %@", change);
    if ([@"operationCount" isEqualToString:keyPath]) {
        if (self.innerOperationQueue.operationCount == 0) {
            // 任务执行完毕
            if (self.operationsAllDone) {
                self.operationsAllDone();
            }
        }
    }
}

- (void)dealloc {
    
    [self.innerOperationQueue removeObserver:self forKeyPath:@"operationCount" context:nil];
}

@end
