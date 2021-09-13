//
//  JPProxy.h
//  JPSubClasses
//
//  Created by SteyDong on 2021/5/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JPProxy : NSProxy

+ (instancetype)proxyWidthTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
