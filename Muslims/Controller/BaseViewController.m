//
//  BaseViewController.m
//  Muslims
//
//  Created by David Tong on 4/30/17.
//  Copyright © 2017 Muslims. All rights reserved.
//

#import "BaseViewController.h"
#import "MuslimsConstant.h"
#import <LGSideMenuController/LGSideMenuController.h>
#import <LGSideMenuController/UIViewController+LGSideMenuController.h>

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

#pragma mark - Actions

- (IBAction) onBackClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:TRUE];
}

#pragma mark - Helper methods

- (void) displayDashboard {
    
    UIViewController *rootViewController = [MAIN_STORY instantiateViewControllerWithIdentifier:@"DashboardViewController"];
    UITableViewController *leftViewController = [UITableViewController new];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    
    LGSideMenuController *sideMenuController = [LGSideMenuController sideMenuControllerWithRootViewController:navigationController
                                                                                           leftViewController:leftViewController
                                                                                          rightViewController:nil];
    
    sideMenuController.leftViewWidth = 250.0;
    sideMenuController.leftViewPresentationStyle = LGSideMenuPresentationStyleScaleFromBig;
    
    sideMenuController.rightViewWidth = 100.0;
    sideMenuController.leftViewPresentationStyle = LGSideMenuPresentationStyleSlideBelow;
    UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
    window.rootViewController = sideMenuController;
    [window makeKeyAndVisible];
}

- (void) initializeView {
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 0, 16, 12);
    [backButton addTarget:self action:@selector(onBackClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.hidesBackButton = TRUE;
    self.navigationItem.backBarButtonItem = nil;
    self.navigationItem.leftBarButtonItem = backBarButtonItem;
}

- (void) showMessage:(NSString*) message {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Muslims" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:okAction];
    [self presentViewController:alert animated:TRUE completion:nil];
    
}

@end
