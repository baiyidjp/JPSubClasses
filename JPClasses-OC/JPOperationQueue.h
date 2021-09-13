//
//  JPOperationQueue.h
//  JPSubClasses
//
//  Created by SteyDong on 2021/5/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^JPOperationsAllDoneCompletion)(void);

@interface JPOperationQueue : NSObject

/** operationsAllDone */
@property(nonatomic,copy) JPOperationsAllDoneCompletion operationsAllDone;

- (instancetype)initWithMaxConcurrentOperationCount:(NSInteger)maxConcurrentOperationCount;

- (void)addOperation:(NSOperation *)op;

- (void)addOperations:(NSArray<NSOperation *> *)ops waitUntilFinished:(BOOL)wait;

- (void)addOperationWithBlock:(void (^)(void))block;

@end

NS_ASSUME_NONNULL_END
