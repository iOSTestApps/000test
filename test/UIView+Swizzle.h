//
//  UIView+BBSwizzle.h
//  test
//
//  Created by Veronica Baldys on 2016-07-18.
//  Copyright © 2016 Veronica Baldys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>


//void testLoadViewCategory();

@interface UIView (Swizzle)

- (UIImage*)snapshot;

//- (void)xxx_drawRect:(CGRect)rect;


@end
