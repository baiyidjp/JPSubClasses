//
//  JPOperation.m
//  JPSubClasses
//
//  Created by SteyDong on 2021/5/19.
//

#import "JPOperation.h"

@interface JPOperation ()

/** parameters */
@property(nonatomic,strong) NSDictionary *parameters;
/** completion */
@property(nonatomic,copy) JPOperationCompletion completion;

@end

@implementation JPOperation

@synthesize finished = _finished;
@synthesize executing = _executing;

- (instancetype)init {
    
    if (self = [super init]) {
        
        _finished = NO;
        _executing = NO;
    }
    return self;
}

- (JPOperation *)initWithName:(NSString *)opName parameters:(NSDictionary *)parameters completion:(JPOperationCompletion)completion {
    
    JPOperation *op = [[JPOperation alloc] init];
    op.name = opName;
    op.parameters = parameters;
    op.completion = completion;
    return op;
}

- (void)start {
    
    if (self.isCancelled) {
        [self __done];
        return;
    }
    
    self.executing = YES;
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        if (self.completion) {
            self.completion(self);
        }
    }];
}

- (void)done {
    
    [self __done];
}

- (void)__done {
    
    if (_executing) {
        
        self.executing = NO;
        self.finished = YES;
    }
}

- (void)setExecuting:(BOOL)executing {
    
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

//- (BOOL)isExecuting {
//    return _executing;
//}

- (void)setFinished:(BOOL)finished
{
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

//- (BOOL)isFinished {
//    return _finished;
//}
//
//- (BOOL)isAsynchronous {
//    return YES;
//}

@end
