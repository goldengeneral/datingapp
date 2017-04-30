//
//  ViewController.m
//  Muslims
//
//  Created by David Tong on 4/30/17.
//  Copyright © 2017 Muslims. All rights reserved.
//

#import "SplashViewController.h"
#import "MuslimsConstant.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(goMainScreen) withObject:nil afterDelay:2.0];
}

- (BOOL) prefersStatusBarHidden {
    
    return TRUE;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma - mark Helper methods

- (void) goMainScreen {
    [self performSegueWithIdentifier:segueMainScreen sender:nil];
}


@end
