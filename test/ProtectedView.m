//
//  ProtectedView.m
//  test
//
//  Created by Veronica Baldys on 2016-07-18.
//  Copyright © 2016 Veronica Baldys. All rights reserved.
//

#import "ProtectedView.h"
#import <BuddyBuildSDK/BuddyBuildSDK.h>
@implementation ProtectedView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        
        UIView *coolView = [[UIView alloc] initWithFrame:CGRectMake(0,0, 50,50)];
        coolView.backgroundColor = [UIColor yellowColor];
        
        [self addSubview:coolView];
    
        coolView.buddybuildViewContainsSensitiveInformation = YES;
        
        
        
    }
    return self;
}








@end
