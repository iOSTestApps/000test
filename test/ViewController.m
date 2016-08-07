//
//  ViewController.m
//  test
//
//  Created by Veronica Baldys on 2016-03-28.
//  Copyright © 2016 Veronica Baldys. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Protected.h"
#import <BuddyBuildSDK/BuddyBuildSDK.h>
//#import "UIView+Swizzle.h"
#import "ProtectedView.h"


@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *textFiel1;
@property (nonatomic, strong) UITextField *textFiel2;
@property (nonatomic, strong) UIView *aView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.textFiel2 = [[UITextField alloc] initWithFrame:CGRectMake(50,200,self.view.frame.size.width-100,55)];
    self.textFiel2.backgroundColor = [UIColor orangeColor];
    self.textFiel2.borderStyle = UITextBorderStyleRoundedRect;
    self.textFiel2.delegate = self;
    
    
    self.aView = [[UIView alloc] initWithFrame:CGRectMake(0,0,100,100)];
    self.aView.center = CGPointMake(CGRectGetMidX(self.view.frame), self.view.frame.size.height*3/4+75);
    
    
    self.aView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.aView];
    
    self.aView.buddybuildViewContainsSensitiveInformation = YES;
    
    
    [self.view addSubview:self.textFiel2];
    
    
//    [BuddyBuildSDK setPrivacyView:self.textFiel2];
    
    

    //ProtectedView *v = [[ProtectedView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-100, 100, 100)];
    //v.backgroundColor = [UIColor redColor];
    //[self.view addSubview:v];
    
    //[BuddyBuildSDK setPrivacyView:v];
    //[self changeBoundsOfView:v];
    
    
    
    
//    [BuddyBuildSDK setPrivacyView:v];
//    v.protected = YES;
    
}

- (void) changeBoundsOfView:(UIView*)view {
    
    // fucked up: instant replay wont record this part....
    [UIView animateWithDuration:2.0 delay:1.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        view.frame = CGRectMake(0, 0, 500, 300);
        
    } completion:^(BOOL finished) {
        
        view.buddybuildViewContainsSensitiveInformation = YES;
        //        NSLog(@"call setNeedsDisplay");
//        [self.view setNeedsDisplay];
        
        
    }];
    
}

//- (void)viewDidLayoutSubviews {
//    
//    [super viewDidLayoutSubviews];
//    NSLog(@"VIEW DID LAYOUT SUBVIEWS");
//
//
//}

//- (void)viewWillDisappear:(BOOL)animated {
//    
//    
//    [super viewWillDisappear:animated];
//    
////    self.textFiel2 = nil;
//}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.buddybuildViewContainsSensitiveInformation = YES;
    self.aView.buddybuildViewContainsSensitiveInformation = NO;
    
    
//    if ([[[[UIApplication sharedApplication] keyWindow] class] isEqualToString:@"UITextEffectsWinow"]) {
////
        if ([[UIApplication sharedApplication].keyWindow isKindOfClass:NSClassFromString(@"UITextEffectsWindow")]) {
            NSLog(@"TextEffectsWindow");
        }
    
    
}



//
// - (void) viewWillLayoutSubviews {
//    NSLog(@"view will layout subviews");
//    
//    
//}
//



- (IBAction)pressedButton:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Text" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        
    }];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
