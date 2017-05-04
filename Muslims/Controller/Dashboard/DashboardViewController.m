//
//  DashboardViewController.m
//  Muslims
//
//  Created by David Tong on 5/4/17.
//  Copyright © 2017 Muslims. All rights reserved.
//

#import "DashboardViewController.h"

@interface DashboardViewController ()

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    self.navigationController.navigationBarHidden = FALSE;
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) initializeView {
    self.title = @"Muslims Of 2 Worlds";
    UIButton* menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [menuButton setImage:[UIImage imageNamed:@"ic_menu"] forState:UIControlStateNormal];
    menuButton.frame = CGRectMake(0, 0, 16, 12);
    [menuButton addTarget:self action:@selector(onMenuClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    self.navigationItem.hidesBackButton = TRUE;
    self.navigationItem.backBarButtonItem = nil;
    self.navigationItem.leftBarButtonItem = backBarButtonItem;
}

#pragma mark Actions

- (IBAction) onMenuClicked:(id)sender {
    
}

@end
