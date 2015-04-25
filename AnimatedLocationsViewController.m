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

-(void) kickOffAnimation;
-(void) setUpGradientLayer;
-(void) shiftLocations;
-(void)animateLayerWithLocations: (NSArray *) locations;


@end

@implementation AnimatedLocationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor whiteColor];
    
    self.animateStep=0;
    
    [self setUpGradientLayer];
    
    [self kickOffAnimation];
    
}


-(void) kickOffAnimation {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(shiftLocations) userInfo:nil repeats:YES];
    [timer fire];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark InitialSetup

-(void) setUpGradientLayer {
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = self.view.bounds;
    
    self.firstLocation=[NSNumber numberWithFloat:-0.2];
    self.secondLocation=[NSNumber numberWithFloat:0.1];
    self.thirdLocation=[NSNumber numberWithFloat:1.3];
    
    self.firstColor =  [UIColor SampleBlueLight];
    self.secondColor = [UIColor SampleTeal];
    self.thirdColor = [UIColor SampleBlue];
    
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(0, 1);
    
    
    self.gradientLayer.colors= [NSArray arrayWithObjects:(id)self.firstColor.CGColor, (id)self.secondColor.CGColor,(id)self.thirdColor.CGColor, nil];
    self.gradientLayer.locations = [NSArray arrayWithObjects:self.firstLocation, self.secondLocation, self.thirdLocation, nil];
    [self.view.layer addSublayer:self.gradientLayer];
}


#pragma -mark Animations

-(void) shiftLocations {
    
    
    NSArray *locations = [[NSArray alloc] init];
    if (self.animateStep==0) {
        
        locations=@[self.firstLocation,
                    self.secondLocation,
                    self.thirdLocation];
        
        self.animateStep=1;
    } else if (self.animateStep==1){
        locations=@[self.firstLocation,
                    [NSNumber numberWithFloat:0.9],
                    self.thirdLocation];
        self.animateStep=0;
    }
    
    [self animateLayerWithLocations:locations];
}

-(void)animateLayerWithLocations: (NSArray *) locations {
    
    NSArray *fromLocations = self.gradientLayer.locations;
    NSArray *toLocations = locations;
    
    [self.gradientLayer setLocations:toLocations];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
    
    animation.fromValue             = fromLocations;
    animation.toValue               = toLocations;
    animation.duration              = 3.0;
    animation.removedOnCompletion   = YES;
    animation.fillMode              = kCAFillModeForwards;
    animation.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.delegate              = self;
    
    
    // Add the animation to the layer
    [self.gradientLayer addAnimation:animation forKey:@"animateGradient"];
    
}






@end
