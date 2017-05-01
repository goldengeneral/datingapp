//
//  SelfieVerificationViewController.m
//  Muslims
//
//  Created by David Tong on 5/2/17.
//  Copyright © 2017 Muslims. All rights reserved.
//

#import "SelfieVerificationViewController.h"

@interface SelfieVerificationViewController ()

@end

@implementation SelfieVerificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
    
- (BOOL) prefersStatusBarHidden {
    
    return FALSE;
}
    
#pragma mark - Override methods
    
- (void) initializeView {
    self.navigationController.navigationBarHidden = FALSE;
    self.title = @"Sign Up";
    [super initializeView];
}


@end
