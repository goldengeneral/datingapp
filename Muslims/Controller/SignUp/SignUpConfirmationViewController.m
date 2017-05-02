//
//  SignUpConfirmationViewController.m
//  Muslims
//
//  Created by David Tong on 5/2/17.
//  Copyright © 2017 Muslims. All rights reserved.
//

#import "SignUpConfirmationViewController.h"

@interface SignUpConfirmationViewController ()

@end

@implementation SignUpConfirmationViewController

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
    self.title = @"Account";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Skip" style:UIBarButtonItemStylePlain target:self action:@selector(onSkipClicked)];
    [super initializeView];
}

#pragma mark - Actions

- (void) onSkipClicked {
    
}

@end
