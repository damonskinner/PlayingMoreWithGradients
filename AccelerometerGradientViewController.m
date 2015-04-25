//
//  AccelerometerGradientViewController.m
//  PlayingMoreWithGradients
//
//  Created by Damon Skinner on 4/25/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "AccelerometerGradientViewController.h"
#import <CoreMotion/Coremotion.h>

@interface AccelerometerGradientViewController ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic) NSInteger animateStep;
@property (strong) CMMotionManager *motionManager;


@property (nonatomic, strong) UIColor *firstColor;
@property (nonatomic, strong) UIColor *secondColor;
@property (nonatomic, strong) UIColor *thirdColor;


@property (nonatomic, strong) NSNumber *firstLocation;
@property (nonatomic, strong) NSNumber *secondLocation;
@property (nonatomic, strong) NSNumber *thirdLocation;

@end

@implementation AccelerometerGradientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
