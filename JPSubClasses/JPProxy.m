//
//  JPProxy.m
//  JPSubClasses
//
//  Created by SteyDong on 2021/5/21.
//

#import "JPProxy.h"

@interface JPProxy ()

/** target */
@property(nonatomic,weak) id target;

@end

@implementation JPProxy

+ (instancetype)proxyWidthTarget:(id)target {
    
    JPProxy *proxy = [JPProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    
    [invocation invokeWithTarget:self.target];
}

@end
