//
//  UINavigationBar+TBTShadowNavigationBar.m
//  Investment
//
//  Created by XD on 2018/9/19.
//  Copyright © 2018年 方加会. All rights reserved.
//

#import "UINavigationBar+TBTShadowNavigationBar.h"
#import <objc/runtime.h>
#import <objc/objc.h>
@implementation UINavigationBar (TBTShadowNavigationBar)
+ (void)initialize {
    // 获取到UIWindow中sendEvent对应的method
    Method originM = class_getInstanceMethod([UINavigationBar class], @selector(willMoveToSuperview:));//被hooc的方法
    Method tatgetM = class_getInstanceMethod([UINavigationBar class], @selector(willMoveToSuperviewHooked:));//新加的方法
    
    // 将目标函数的原实现绑定到sendEventOriginalImplemention方法上
    IMP sendEventImp = method_getImplementation(originM);//copy方法到willMoveToSuperviewSelf:
    class_addMethod([UINavigationBar class], @selector(willMoveToSuperviewSelf:), sendEventImp, method_getTypeEncoding(originM));
    
    // 然后用我们自己的函数的实现，替换目标函数对应的实现
    IMP sendEventMySelfImp = method_getImplementation(tatgetM);
    class_replaceMethod([UINavigationBar class], @selector(willMoveToSuperview:), sendEventMySelfImp, method_getTypeEncoding(originM));
}
/*
 * 截获到window的sendEvent
 * 我们可以先处理完以后，再继续调用正常处理流程
 */
- (void)willMoveToSuperviewHooked:(UIView *)newSuperview {
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        self.layer.shadowOpacity = 1;
        self.layer.shadowColor = [[UIColor colorWithWhite:240 / 255.0 alpha:0.7] CGColor];
        self.layer.shadowOffset = CGSizeMake( 0 , 0);
    }
    // do something what ever you want
    
    // invoke original implemention
    [self performSelector:@selector(willMoveToSuperviewSelf:) withObject:newSuperview];//执行完自己的方法,再执行系统的,这里放到哪都行,可以控制代码执行顺序
}

//- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event {
//    if (point.y < 0) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationTapStatusBar object:nil];
//    }
//    return [super hitTest:point withEvent:event];
//}
@end
