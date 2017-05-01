//
//  SignUpViewController.m
//  Muslims
//
//  Created by David Tong on 5/2/17.
//  Copyright © 2017 Muslims. All rights reserved.
//

#import "SignUpViewController.h"
#import "UIColor+Hex.h"
#import <LKValidators.h>

@interface SignUpViewController ()<UITextFieldDelegate> {
    UIButton* accessorySignInButton;
}

@property (weak, nonatomic) IBOutlet UITextField *fullnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailAddressTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
    
@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
    
- (void) viewDidAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = FALSE;
    [super viewDidAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = TRUE;
    [super viewWillDisappear:animated];
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
   
#pragma mark - UITextFieldDelegate
    
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    if([textField isEqual:_fullnameTextField]) {
        [_nicknameTextField becomeFirstResponder];
    } else if([textField isEqual:_nicknameTextField]) {
        [_emailAddressTextField becomeFirstResponder];
    } else if([textField isEqual:_emailAddressTextField]) {
        [_passwordTextField becomeFirstResponder];
    } else if([textField isEqual:_passwordTextField]) {
        [_confirmPasswordTextField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return  TRUE;
}
    
#pragma mark Actions
    
- (IBAction) onNextClicked:(id)sender {
    
    LKValidator *validator = [LKEmailValidator validator];
    NSError *error = nil;
    
    if ([_fullnameTextField.text isEqualToString:@""]) {
        [self showMessage:@"Please enter full name."];
    } else if ([_nicknameTextField.text isEqualToString:@""]) {
        [self showMessage:@"Please enter nickname."];
    } else if ([_emailAddressTextField.text isEqualToString:@""]) {
        [self showMessage:@"Please enter email."];
    } else if ([_passwordTextField.text isEqualToString:@""]) {
        [self showMessage:@"Please enter password."];
    } else {
        BOOL isValid = [validator validate:_emailAddressTextField.text error:&error];
        if (isValid) {
            if (![_passwordTextField.text isEqualToString:_confirmPasswordTextField.text]) {
                [self showMessage:@"Confirm password doesn't match."];
            } else {
                [self performSegueWithIdentifier:@"SegueSelfieVerification" sender:nil];
            }
        } else {
            [self showMessage:error.localizedFailureReason];
        }
    }
}


#pragma mark - Override methods
    
- (void) initializeView {
    self.title = @"Sign Up";
    self.fullnameTextField.delegate = self;
    self.nicknameTextField.delegate = self;
    self.emailAddressTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.confirmPasswordTextField.delegate = self;
    accessorySignInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [accessorySignInButton setBackgroundImage:[UIImage imageNamed:@"signIn"] forState:UIControlStateNormal];
    accessorySignInButton.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 65);
    [accessorySignInButton setTitle:@"NEXT" forState:UIControlStateNormal];
    [accessorySignInButton setTitleColor:[UIColor colorWithHex:0x525252] forState:UIControlStateNormal];
    self.fullnameTextField.inputAccessoryView = accessorySignInButton;
    self.nicknameTextField.inputAccessoryView = accessorySignInButton;
    self.emailAddressTextField.inputAccessoryView = accessorySignInButton;
    self.passwordTextField.inputAccessoryView = accessorySignInButton;
    self.confirmPasswordTextField.inputAccessoryView = accessorySignInButton;
    [accessorySignInButton addTarget:self action:@selector(onNextClicked:) forControlEvents:UIControlEventTouchUpInside];
    [super initializeView];
}
    
@end
