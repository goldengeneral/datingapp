//
//  ForgotPasswordViewController.m
//  Muslims
//
//  Created by David Tong on 5/1/17.
//  Copyright © 2017 Muslims. All rights reserved.
//

#import "ForgotPasswordViewController.h"
#import "UIColor+Hex.h"
#import <LKValidators.h>

@interface ForgotPasswordViewController () <UITextFieldDelegate> {
    UIButton* accessorySignInButton;
}

@property (weak, nonatomic) IBOutlet UITextField *emailAddressTextField;

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL) prefersStatusBarHidden {
    
    return FALSE;
}

#pragma mark - UITextFieldDelegate

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return  TRUE;
}

#pragma mark - Override methods

- (void) initializeView {
    self.navigationController.navigationBarHidden = FALSE;
    self.title = @"Forgot Password";
    self.emailAddressTextField.delegate = self;
    accessorySignInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [accessorySignInButton setBackgroundImage:[UIImage imageNamed:@"signIn"] forState:UIControlStateNormal];
    accessorySignInButton.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 65);
    [accessorySignInButton setTitle:@"SEND" forState:UIControlStateNormal];
    [accessorySignInButton setTitleColor:[UIColor colorWithHex:0x525252] forState:UIControlStateNormal];
    self.emailAddressTextField.inputAccessoryView = accessorySignInButton;
    [accessorySignInButton addTarget:self action:@selector(onSendPasswordClicked:) forControlEvents:UIControlEventTouchUpInside];
    [super initializeView];
}
    
#pragma mark - Actions
    
- (IBAction) onSendPasswordClicked:(id)sender {
    
    LKValidator *validator = [LKEmailValidator validator];
    NSError *error = nil;
    BOOL isValid = [validator validate:_emailAddressTextField.text error:&error];
    
    if (isValid) {
        
    } else {
        [self showMessage:error.localizedFailureReason];
    }
}


@end
