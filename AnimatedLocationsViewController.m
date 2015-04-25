//
//  AnimatedLocationsViewController.m
//  PlayingMoreWithGradients
//
//  Created by Damon Skinner on 4/25/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "AnimatedLocationsViewController.h"
#import "UIColor+SampleColors.h"

@interface AnimatedLocationsViewController ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic) NSInteger animateStep;


@property (nonatomic, strong) UIColor *firstColor;
@property (nonatomic, strong) UIColor *secondColor;
@property (nonatomic, strong) UIColor *thirdColor;


@property (nonatomic, strong) NSNumber *firstLocation;
@property (nonatomic, strong) NSNumber *secondLocation;
@property (nonatomic, strong) NSNumber *thirdLocation;


@end

@implementation AnimatedLocationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.animateStep=0;
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = self.view.bounds;
    
    self.firstLocation=[NSNumber numberWithFloat:-0.2];
    self.secondLocation=[NSNumber numberWithFloat:0.5];
    self.thirdLocation=[NSNumber numberWithFloat:1.3];
    
    self.firstColor =  [UIColor SampleRed];
    self.secondColor = [UIColor SampleOrange];
    self.thirdColor = [UIColor SampleYellow];
    
    
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
