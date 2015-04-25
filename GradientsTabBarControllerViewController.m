//
//  GradientsTabBarControllerViewController.m
//  PlayingMoreWithGradients
//
//  Created by Damon Skinner on 4/25/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "GradientsTabBarControllerViewController.h"
#import "AccelerometerGradientViewController.h"
#import "AnimatedLocationsViewController.h"
#import "AnimatedColorsViewController.h"
#import <FAKFontAwesome.h>

@interface GradientsTabBarControllerViewController ()


- (AnimatedLocationsViewController *)makeLocationsVC;
- (AnimatedColorsViewController *)makeColorsVC;
- (AccelerometerGradientViewController *)makeAccelerometerVC;


@end

@implementation GradientsTabBarControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AccelerometerGradientViewController *accelerometerExampleVC = [self makeAccelerometerVC];
    AnimatedLocationsViewController *locationsExampleVC = [self makeLocationsVC];
    AnimatedColorsViewController *colorsExampleVC = [self makeColorsVC];
    
    
    self.viewControllers = @[colorsExampleVC,locationsExampleVC,accelerometerExampleVC];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma -mark SetupChildViewControllers

- (AnimatedLocationsViewController *)makeLocationsVC {
    AnimatedLocationsViewController *locationsExampleVC = [[AnimatedLocationsViewController alloc]init];
    
    UIImage *locationsExampleImage = [[FAKFontAwesome arrowsVIconWithSize:20] imageWithSize:CGSizeMake(30, 30)];
    locationsExampleVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Locations" image:locationsExampleImage tag:1];
    
    return locationsExampleVC;
}



- (AnimatedColorsViewController *)makeColorsVC {
    AnimatedColorsViewController *colorsExampleVC = [[AnimatedColorsViewController alloc]init];
    
    UIImage *colorsExampleImage = [[FAKFontAwesome arrowsHIconWithSize:20] imageWithSize:CGSizeMake(30, 30)];
    colorsExampleVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Colors" image:colorsExampleImage tag:1];
    
    return colorsExampleVC;
}


- (AccelerometerGradientViewController *)makeAccelerometerVC {
    AccelerometerGradientViewController *accelerometerExampleVC = [[AccelerometerGradientViewController alloc]init];
    
    UIImage *accelerometerExampleImage = [[FAKFontAwesome refreshIconWithSize:20] imageWithSize:CGSizeMake(30, 30)];
    accelerometerExampleVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Accelerometer" image:accelerometerExampleImage tag:1];
    
    return accelerometerExampleVC;
}








@end
