//
//  JPOperation.h
//  JPSubClasses
//
//  Created by SteyDong on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class JPOperation;

typedef void(^JPOperationCompletion)(JPOperation *operation);

@interface JPOperation : NSOperation

- (JPOperation *)initWithName:(NSString *)opName parameters:(NSDictionary *)parameters completion:(JPOperationCompletion)completion;

- (void)done;

@end

NS_ASSUME_NONNULL_END
