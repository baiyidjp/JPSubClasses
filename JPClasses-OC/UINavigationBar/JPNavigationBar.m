//
//  JPNavigationBar.m
//  JPSubClasses
//
//  Created by SteyDong on 2021/2/2.
//

#import "JPNavigationBar.h"
#import "JPLayoutUtils.h"

@implementation JPNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.jp_alpha = 1.0;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    //注意导航栏及状态栏高度适配
    self.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), JP_NAVIGATIONBARHEIGHT);
    for (UIView *view in self.subviews) {
        if ([NSStringFromClass([view class]) containsString:@"Background"]) {
            view.frame = self.bounds;
            for (UIView *subView in view.subviews) {
                if ([subView isKindOfClass:[UIImageView class]]) {
                    subView.backgroundColor = [UIColor clearColor];
                }

                if ([NSStringFromClass([subView class]) containsString:@"EffectView"]) {
                    subView.backgroundColor = [UIColor whiteColor];
                    for (UIView *effectSubView in subView.subviews) {
                        if ([NSStringFromClass([effectSubView class]) containsString:@"BackdropView"]) {
                            effectSubView.backgroundColor = [UIColor whiteColor];
                        }
                    }
                }
            }
        } else if ([NSStringFromClass([view class]) containsString:@"ContentView"]) {
            //适配 iOS11 后的导航栏
            CGRect frame = view.frame;
            frame.origin.y = JP_STATUSBARHEIGHT;
            frame.size.height = self.bounds.size.height - frame.origin.y;
            view.frame = frame;
        }
    }

    // viewDidLoad中 subViews 里并不包含要找的 backgroundView 在此从新赋值
    self.jp_alpha = self.jp_alpha;
}

- (void)setJp_alpha:(CGFloat)jp_alpha {

    _jp_alpha = jp_alpha;

    for (UIView *view in self.subviews) {
        if ([NSStringFromClass([view class]) containsString:@"Background"]) {
            view.alpha = jp_alpha;
        }
    }

    self.clipsToBounds = jp_alpha = 0.0;
}

@end
