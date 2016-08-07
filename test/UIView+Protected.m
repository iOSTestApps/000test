//
//  UIView+Protected.m
//  test
//
//  Created by Veronica Baldys on 2016-07-11.
//  Copyright © 2016 Veronica Baldys. All rights reserved.
//

#import "UIView+Protected.h"
#import <objc/runtime.h>
//#import "BBProtectedViewManager.h"


/// hey!!!
/// a tag with the level in the view hierarchy - see the logging method at the bottom of this class
//static const void *BBViewHierarchyLevelKey = &BBViewHierarchyLevelKey;
//static const void *ViewIsProtectedKey = &ViewIsProtectedKey;

@implementation UIView (Protected)

//// static char ViewIsProtectedKey = &ViewIsProtectedKey;
//
//- (void) setProtected:(BOOL)protected {
//    
//
//
//    // compare the current protected state of the view
//    if (protected && !self.protected) {
//        // view became protected
//        // add to an array of private views.
////        [[BBProtectedViewManager sharedInstance] setPrivacyView:self];
//        
//    }
//
//    else if (!protected && self.protected) {
//        // view became unprotected
////        [[BBProtectedViewManager sharedInstance] unsetPrivacyView:self];
//        // nsnotification center remove from protected view array.
//        // viewDidBecomeUnprotected:
//    }
//    
//    
//    // xxx_laYOUTSUBviews :::: if view.protected......

///objc_setAssociatedObject(self, ViewIsProtectedKey, @(protected), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (BOOL) protected {
//    
//    NSNumber *protectedNumber = objc_getAssociatedObject(self, ViewIsProtectedKey);
//    return [protectedNumber boolValue];
//    
//}

//
//
//- (NSMutableArray*)allSubViews
//{
//    NSMutableArray *arr = [[NSMutableArray alloc] init];
//    
//    if (self.protected) {
//        [arr addObject:self];
//        return arr;
//    }
//    
//    for (UIView *subview in self.subviews)
//    {
//        if (subview.isHidden) continue;
//        if (CGRectIsEmpty(subview.frame)) continue;
//
//        [arr addObjectsFromArray:(NSArray*)[subview allSubViews]];
//    }
//    
//    return arr;
//}

//
//
//- (NSMutableArray*) privateSubviews:(UIView*)view {
//    if (view.subviews.count == 0)
//        return privateViewRects;
//    
//    for (UIView *subview in self.subviews) {
//        if (subview.superview == nil) continue;
//        if (subview.isHidden)
//            continue;
//        
//        if (subview.protected) {
//            NSValue *rectValue = [NSValue valueWithCGRect:subview.bounds];
//            [privateViewRects addObject:rectValue];
//            continue;
//        }
//        [self privateSubviews:subview];
//    }
//    
//    
//    return privateViewRects;
//    
//    
//}


- (NSMutableArray<UIView*>*)flattenPrivateViews {
    
    NSMutableArray<UIView*> *privateSubviews = [NSMutableArray array];
    
    for (UIView *subview in self.subviews) {
        
        if (subview.hidden) continue;
        [privateSubviews addObject:subview];
            // or get the tag, add to array, call viewWithTag: on UIView when rendering private views.
            
        
        
        //      NSMutableArray *subviewsOfView = [subview privateSubviews];
        
        [privateSubviews addObjectsFromArray:[self flattenPrivateViews]];
        
        
    }
    return privateSubviews;
    
}






@end


@implementation UIView (ViewHierarchyLogging)

- (void)logViewHierarchy:(int)level
{
    NSLog(@"%d - %@", level, self);
    for (UIView *subview in self.subviews)
    {
        if (subview.hidden) {
            NSLog(@"HIDDEN");
        }
        
        
        [subview logViewHierarchy:(level+1)];
    }
}
@end