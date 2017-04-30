//
//  BaseViewController.m
//  Muslims
//
//  Created by David Tong on 4/30/17.
//  Copyright © 2017 Muslims. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Helper methods

- (void) initializeView {
    
}

- (void) showMessage:(NSString*) message {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Muslims" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:okAction];
    [self presentViewController:alert animated:TRUE completion:nil];
    
}

@end
