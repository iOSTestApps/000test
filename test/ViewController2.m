//
//  ViewController2.m
//  test
//
//  Created by Veronica Baldys on 2016-04-30.
//  Copyright © 2016 Veronica Baldys. All rights reserved.
//

#import "ViewController2.h"
#import "UIView+Protected.h"
#import <BuddyBuildSDK/BuddyBuildSDK.h>


@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    strcpy("FUCK",0);
    
//    self.view.protected = YES;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50,100,self.view.frame.size.width-100,80)];

    button.center = CGPointMake(CGRectGetMidX(self.view.frame),CGRectGetMidY(self.view.frame));
    [button addTarget:self action:@selector(showNewView:) forControlEvents:UIControlEventTouchDown];
    
    button.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:button];

    button.buddybuildViewContainsSensitiveInformation = YES;
    // Do any additional setup after loading the view.
}

- (void)showNewView:(id)sender {
    
    UIView *newView = [[UIView alloc] initWithFrame:self.view.frame];
    newView.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:newView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIViewController *newVC = [[UIViewController alloc] init];
        
//        [self presentViewController:newVC animated:YES completion:^{
//            
//            
//            
//        }];
        
        [self showDetailViewController:newVC sender:sender];
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    //strcpy(0,"This is a bad bug");
}


//- (void) viewWillLayoutSubviews {
//    [super viewWillLayoutSubviews];
//    
//    
//}
//
//- (void) viewDidLayoutSubviews {
//    
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
