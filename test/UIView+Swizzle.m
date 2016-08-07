//
//  UIView+BBSwizzle.m
//  test
//
//  Created by Veronica Baldys on 2016-07-18.
//  Copyright © 2016 Veronica Baldys. All rights reserved.
//

#import "UIView+Swizzle.h"
#import "UIView+Protected.h"
//#import "BBProtectedViewManager.h"

//void testLoadViewCategory() {
//    NSLog(@"Load view category");
//}
//


@implementation UIView (Swizzle)
//
//
////- (void) xxx_drawRect:(CGRect)rect {
////    
////    [self xxx_drawRect:rect];
////    
////    if (self.protected){
////        NSLog(@"hai i am a protected view");
////    }
////    
////    NSLog(@"swizzle drawRect:");
////    
////    
////    
////    
////}
////
//
//
//////- (void) xxx_setNeedsDisplayInRect:(CGRect)rect {
//////    NSLog(@"VIEW CLASS = %@",NSStringFromClass([self class]));
//////    
//////    NSLog(@"xxx_setNeedsDisplayInRect:%@", NSStringFromCGRect(rect));
//////    if (self.protected){
//////        NSLog(@"hai i am a protected view");
//////    }
////    
////    [self xxx_setNeedsDisplayInRect:rect];
////    
////}
//

- (UIImage*)snapshot {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    UIGraphicsBeginImageContext(screenRect.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor blackColor] set];
    CGContextFillRect(ctx, screenRect);
    
    [self.layer renderInContext:ctx];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

//
//- (void)xxx_layoutSubviews {
//    
//
//    // if is kind of class UIWindow...
//    
//
//
//    NSString *classString = NSStringFromClass([self class]);
//    
//    NSString *firstChar = [classString substringToIndex:0];
//    NSString *underscore = @"_";
//    
//    if (![firstChar isEqualToString:underscore]) {
//        NSLog(@"%@", classString);
//        
//        
//        
//        if (self.hidden) NSLog(@"   Hidden: YES");
//        
//        else  NSLog(@"   Hidden: NO");
//        
//        NSLog(@"   Bounds = %@", NSStringFromCGRect(self.bounds));
//        NSLog(@"   Frame = %@", NSStringFromCGRect(self.frame));
//
//
//        if ([self isKindOfClass:[UIWindow class]]) {
//            if (![self isHidden]) {
//                NSLog(@"draw snapshot");
//                UIView *snapshot = [self snapshotViewAfterScreenUpdates:YES];
//                
//              
//                 
//                 
//        }
//                 
//        
//    }
//
//
//
//    [self xxx_layoutSubviews];
//
//    
//}
//
//
//
////
//+ (void)load {
//    
//    NSLog(@"load");
//    
//    Class class = [self class];
//
//
////    
////    SEL originalSelector2 = @selector(setNeedsDisplayInRect:);
////    SEL swizzledSelector2 = @selector(xxx_setNeedsDisplayInRect:);
////    
////    Method originalMethod2 = class_getInstanceMethod(class, originalSelector2);
////    Method swizzledMethod2 = class_getInstanceMethod(class, swizzledSelector2);
////    
////    BOOL didAddMethod2 =
////    class_addMethod(class,
////                    originalSelector2,
////                    method_getImplementation(swizzledMethod2),
////                    method_getTypeEncoding(swizzledMethod2));
////    
////    if (didAddMethod2) {
////        class_replaceMethod(class,
////                            swizzledSelector2,
////                            method_getImplementation(originalMethod2),
////                            method_getTypeEncoding(originalMethod2));
////    } else {
////        method_exchangeImplementations(originalMethod2, swizzledMethod2);
////    }
////    
////
//    
//    
//    SEL originalSelector = @selector(layoutSubviews);
//    SEL swizzledSelector = @selector(xxx_layoutSubviews);
//    
//    Method originalMethod = class_getInstanceMethod(class, originalSelector);
//    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
//
//    BOOL didAddMethod3 =
//    class_addMethod(class,
//                    originalSelector,
//                    method_getImplementation(swizzledMethod),
//                    method_getTypeEncoding(swizzledMethod));
//    
//    if (didAddMethod3) {
//        class_replaceMethod(class,
//                            swizzledSelector,
//                            method_getImplementation(originalMethod),
//                            method_getTypeEncoding(originalMethod));
//    } else {
//        method_exchangeImplementations(originalMethod, swizzledMethod);
//    }
//    
//
//}


@end
