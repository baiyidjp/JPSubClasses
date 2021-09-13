//
//  JPThread.h
//  JPSubClasses
//
//  Created by SteyDong on 2021/5/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^JPThreadTask)(void);

@interface JPThread : NSObject

- (void)start;

- (void)executeTask:(JPThreadTask)task;

- (void)stop;

@end

NS_ASSUME_NONNULL_END
