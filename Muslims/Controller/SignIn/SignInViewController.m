//
//  SignInViewController.m
//  Muslims
//
//  Created by David Tong on 4/30/17.
//  Copyright © 2017 Muslims. All rights reserved.
//

#import "SignInViewController.h"
#import "UIColor+Hex.h"
#import <LKValidators.h>

@interface SignInViewController () <UITextFieldDelegate> {
    UIButton* accessorySignInButton;
}

@property (weak, nonatomic) IBOutlet UITextField *emailAddressTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = TRUE;
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL) prefersStatusBarHidden {
    
    return FALSE;
}

#pragma mark - UITextFieldDelegate

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    if([textField isEqual:_emailAddressTextField]) {
        [_passwordTextField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return  TRUE;
}
    
#pragma mark Actions
    
- (IBAction) onSignInClicked:(id)sender {
    
    LKValidator *validator = [LKEmailValidator validator];
    NSError *error = nil;
    BOOL isValid = [validator validate:_emailAddressTextField.text error:&error];
    
    if (isValid) {
        if ([_passwordTextField.text isEqualToString:@""]) {
            [self showMessage:@"Please enter password."];
        } else {
            //Sign In
            [self.view endEditing:TRUE];
            [self displayDashboard];
        }
    } else {
        [self showMessage:error.localizedFailureReason];
    }
}


#pragma mark - Override methods

- (void) initializeView {
    self.title = @"Sign In";
    self.emailAddressTextField.delegate = self;
    self.passwordTextField.delegate = self;
    accessorySignInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [accessorySignInButton setBackgroundImage:[UIImage imageNamed:@"signIn"] forState:UIControlStateNormal];
    accessorySignInButton.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 65);
    [accessorySignInButton setTitle:@"SIGN-IN" forState:UIControlStateNormal];
    [accessorySignInButton setTitleColor:[UIColor colorWithHex:0x525252] forState:UIControlStateNormal];
    self.emailAddressTextField.inputAccessoryView = accessorySignInButton;
    self.passwordTextField.inputAccessoryView = accessorySignInButton;
    [accessorySignInButton addTarget:self action:@selector(onSignInClicked:) forControlEvents:UIControlEventTouchUpInside];
    [super initializeView];
}

#pragma mark - Helper methods


@end
