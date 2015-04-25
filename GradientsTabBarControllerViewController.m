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

@end

@implementation GradientsTabBarControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AccelerometerGradientViewController *accelerometerExampleVC = [self makeAccelerometerVC];
    AnimatedLocationsViewController *locationsExampleVC = [self makeLocationsVC];
    AnimatedColorsViewController *colorsExampleVC = [self makeColorsVC];
    
    
    self.viewControllers = @[colorsExampleVC,locationsExampleVC,accelerometerExampleVC];
    
}


- (AnimatedLocationsViewController *)makeLocationsVC {
    AnimatedLocationsViewController *locationsExampleVC = [[AnimatedLocationsViewController alloc]init];
    
    UIImage *locationsExampleImage = [[FAKFontAwesome arrowsVIconWithSize:20] imageWithSize:CGSizeMake(30, 30)];
    locationsExampleVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Locations" image:locationsExampleImage tag:1];
    
    return locationsExampleVC;
}



- (AnimatedColorsViewController *)makeColorsVC {
    AnimatedColorsViewController *colorsExampleVC = [[AnimatedColorsViewController alloc]init];
    
    UIImage *colorsExampleImage = [[FAKFontAwesome arrowsHIconWithSize:20] imageWithSize:CGSizeMake(30, 30)];
    colorsExampleVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Locations" image:colorsExampleImage tag:1];
    
    return colorsExampleVC;
}


- (AccelerometerGradientViewController *)makeAccelerometerVC {
    AccelerometerGradientViewController *accelerometerExampleVC = [[AccelerometerGradientViewController alloc]init];
    
    UIImage *accelerometerExampleImage = [[FAKFontAwesome refreshIconWithSize:20] imageWithSize:CGSizeMake(30, 30)];
    accelerometerExampleVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Accelerometer" image:accelerometerExampleImage tag:1];
    
    return accelerometerExampleVC;
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
