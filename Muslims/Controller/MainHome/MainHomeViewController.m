//
//  MainHomeViewController.m
//  Muslims
//
//  Created by David Tong on 4/30/17.
//  Copyright © 2017 Muslims. All rights reserved.
//

#import "MainHomeViewController.h"

@interface MainHomeViewController ()

@end

@implementation MainHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = TRUE;
}

- (void) viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = FALSE;
    [super viewWillDisappear:animated];
}

- (BOOL) prefersStatusBarHidden {
    
    return TRUE;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
