//
//  DashboardViewController.m
//  Muslims
//
//  Created by David Tong on 5/4/17.
//  Copyright © 2017 Muslims. All rights reserved.
//

#import "DashboardViewController.h"
#import <LGSideMenuController/UIViewController+LGSideMenuController.h>
#import <ZLSwipeableView/ZLSwipeableView.h>
#import "CardView.h"

@interface DashboardViewController ()<ZLSwipeableViewDataSource, ZLSwipeableViewDelegate>

@property (weak, nonatomic) IBOutlet ZLSwipeableView *swipeContentView;
@end

@implementation DashboardViewController

- (void)viewDidLoad {
    self.navigationController.navigationBarHidden = FALSE;
    // Required Data Source
    self.swipeContentView.dataSource = self;
    // Optional Delegate
    self.swipeContentView.delegate = self;
    
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews {
    [self.swipeContentView loadViewsIfNeeded];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - ZLSwipeableViewDelegate

- (void)swipeableView:(ZLSwipeableView *)swipeableView
         didSwipeView:(UIView *)view
          inDirection:(ZLSwipeableViewDirection)direction {
    NSLog(@"did swipe in direction: %zd", direction);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView didCancelSwipe:(UIView *)view {
    NSLog(@"did cancel swipe");
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
  didStartSwipingView:(UIView *)view
           atLocation:(CGPoint)location {
    NSLog(@"did start swiping at location: x %f, y %f", location.x, location.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
          swipingView:(UIView *)view
           atLocation:(CGPoint)location
          translation:(CGPoint)translation {
    NSLog(@"swiping at location: x %f, y %f, translation: x %f, y %f", location.x, location.y,
          translation.x, translation.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
    didEndSwipingView:(UIView *)view
           atLocation:(CGPoint)location {
    NSLog(@"did end swiping at location: x %f, y %f", location.x, location.y);
}

#pragma mark - ZLSwipeableViewDataSource

- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView {
    CardView *contentView =
    [[NSBundle mainBundle] loadNibNamed:@"CardView" owner:self options:nil][0];
    contentView.frame = swipeableView.bounds;
    return contentView;
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
    [[self sideMenuController] showLeftView];
}

@end
