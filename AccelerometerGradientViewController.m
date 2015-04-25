//
//  AccelerometerGradientViewController.m
//  PlayingMoreWithGradients
//
//  Created by Damon Skinner on 4/25/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "AccelerometerGradientViewController.h"
#import <CoreMotion/Coremotion.h>
#import "UIColor+SampleColors.h"

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


-(void) kickOffAnimation;
-(void) setUpGradientLayer;
-(void) adjustLocation: (NSString *)accelerationDirection;
-(void) animateLayerWithLocations: (NSArray *) locations;


@end

@implementation AccelerometerGradientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor whiteColor];
    
    self.animateStep=0;
    
    [self setUpGradientLayer];
    
    [self kickOffAnimation];
    
}


-(void) kickOffAnimation {
    self.motionManager = [[CMMotionManager alloc] init];
    if([self.motionManager isAccelerometerAvailable]) {
        [self.motionManager startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc] init] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            if(accelerometerData.acceleration.x >0.1){
                NSString *accelerationDirection=@"right";
                [self adjustLocation:accelerationDirection];
            } else if(accelerometerData.acceleration.x <-0.1){
                NSString *accelerationDirection=@"left";
                [self adjustLocation:accelerationDirection];
            }
            
        }];
    }
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
    self.secondLocation=[NSNumber numberWithFloat:0.5];
    self.thirdLocation=[NSNumber numberWithFloat:1.3];
    
    self.firstColor =  [UIColor SampleRed];
    self.secondColor = [UIColor SampleOrange];
    self.thirdColor = [UIColor SampleYellow];
    
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(1, 1);
    
    
    self.gradientLayer.colors= [NSArray arrayWithObjects:(id)self.firstColor.CGColor, (id)self.secondColor.CGColor,(id)self.thirdColor.CGColor, nil];
    self.gradientLayer.locations = [NSArray arrayWithObjects:self.firstLocation, self.secondLocation, self.thirdLocation, nil];
    [self.view.layer addSublayer:self.gradientLayer];
}


#pragma -mark Animations

-(void) adjustLocation: (NSString *)accelerationDirection {
    if ([accelerationDirection isEqualToString:@"right"] && ([self.secondLocation floatValue]<0.99)) {
        self.secondLocation=[NSNumber numberWithFloat:[self.secondLocation floatValue] +0.01];
    } else if ([accelerationDirection isEqualToString:@"left"] && ([self.secondLocation floatValue]>0.01)) {
 
        self.secondLocation=[NSNumber numberWithFloat:[self.secondLocation floatValue] -0.01];
    }
    
    
    NSArray *newLocations = @[self.firstLocation,self.secondLocation, self.thirdLocation];
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self animateLayerWithLocations:newLocations];
    }];
    
}

-(void)animateLayerWithLocations: (NSArray *) locations {
    
    NSArray *fromLocations = self.gradientLayer.locations;
    NSArray *toLocations = locations;
    
    [self.gradientLayer setLocations:toLocations];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
    
    animation.fromValue             = fromLocations;
    animation.toValue               = toLocations;
    animation.duration              = 0.01;
    animation.removedOnCompletion   = YES;
    animation.fillMode              = kCAFillModeForwards;
    animation.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.delegate              = self;
    
    
    // Add the animation to the layer
    [self.gradientLayer addAnimation:animation forKey:@"animateGradient"];
    
}


@end
