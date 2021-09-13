//
//  JPNavigationController.m
//  JPSubClasses
//
//  Created by SteyDong on 2021/2/2.
//

#import "JPNavigationController.h"

@interface JPNavigationController ()

@end

@implementation JPNavigationController

- (instancetype)init {

    self = [super init];
    if (self) {
        // 默认隐藏系统自带的导航栏
        self.navigationBar.hidden = NO;
    }
    return self;
}

- (instancetype)initWithNavigationBarHidden:(BOOL)isHidden {

    self = [self init];
    if (self) {
        // 默认隐藏系统自带的导航栏
        self.navigationBar.hidden = isHidden;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 * 在 Info.plist 文件中添加 View controller-based status bar appearance 设置为 YES。
 * 但是当UIViewController嵌套在UINavigationController中时，不生效。
 * 因为UINavigationController中也有 preferredStatusBarStyle 这个方法。
 * 在NavigationController中重写，在调用子ViewController的方法才可改变。
 * @return
 */
- (UIStatusBarStyle)preferredStatusBarStyle {

    UIViewController *controller = self.topViewController;
    UIStatusBarStyle statusBarStyle = [controller preferredStatusBarStyle];
    return statusBarStyle;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    // 判断是否进入二级页面
    if (self.childViewControllers.count > 0) {

        // 进入二级页面 隐藏TabBar
        viewController.hidesBottomBarWhenPushed = YES;
    }

    [super pushViewController:viewController animated:animated];
}

@end
