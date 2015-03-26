//
//  ViewController.m
//  PlayingMoreWithGradients
//
//  Created by Damon Skinner on 3/25/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()

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

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.animateStep=0;
    
    self.motionManager = [[CMMotionManager alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = self.view.bounds;
//    self.firstLocation=[NSNumber numberWithFloat:0.0];
//    self.secondLocation=[NSNumber numberWithFloat:0.1];
//    self.thirdLocation=[NSNumber numberWithFloat:1.0];
    
    self.firstLocation=[NSNumber numberWithFloat:0.2];
    self.secondLocation=[NSNumber numberWithFloat:0.5];
    self.thirdLocation=[NSNumber numberWithFloat:0.8];
    
    self.firstColor =  [UIColor colorWithRed:255/255.0f green:0/255.0f blue:0/255.0f alpha:0.6f];
    self.secondColor = [UIColor colorWithRed:255/255.0f green:150/255.0f blue:0/255.0f alpha:0.7f];
    self.thirdColor = [UIColor colorWithRed:255/255.0f green:200/255.0f blue:0/255.0f alpha:0.7f];
    
//    self.firstColor =  [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:0.1f];
//    self.secondColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:0.25f];
//    self.thirdColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:0.1f];
    
//    UIColor *fourthColor = [UIColor greenColor];
//    UIColor *fifthColor = [UIColor blueColor];
//    UIColor *sixthColor = [UIColor purpleColor];
//    self.gradientLayer.colors= [NSArray arrayWithObjects:(id)firstColor.CGColor, (id)secondColor.CGColor,(id)thirdColor.CGColor,(id)fourthColor.CGColor,(id)fifthColor.CGColor, (id)sixthColor.CGColor, nil];
    self.gradientLayer.colors= [NSArray arrayWithObjects:(id)self.firstColor.CGColor, (id)self.secondColor.CGColor,(id)self.thirdColor.CGColor, nil];
    
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(1, 1);
    
   
    
    self.gradientLayer.locations = [NSArray arrayWithObjects:self.firstLocation, self.secondLocation, self.thirdLocation, nil];
    

    self.view.backgroundColor= [UIColor whiteColor];
    [self.view.layer addSublayer:self.gradientLayer];

    
//    if([self.motionManager isAccelerometerAvailable]) {
//        [self.motionManager startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc] init] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
//            if(accelerometerData.acceleration.x >0.1){
//                NSString *accelerationDirection=@"right";
//                [self adjustLocation:accelerationDirection];
//            } else if(accelerometerData.acceleration.x <-0.1){
//                NSString *accelerationDirection=@"left";
//                [self adjustLocation:accelerationDirection];
//            }
// 
//        }];
//    }
    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(shiftLocationsAndColors) userInfo:nil repeats:YES];
    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(shiftLocations) userInfo:nil repeats:YES];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(pickColors) userInfo:nil repeats:YES];
    
    [timer fire];
    // Do any additional setup after loading the view.
}


-(void) shiftLocationsAndColors {
    

    NSArray *colors = [[NSArray alloc] init];
    
    if (self.animateStep==0) {
        colors = @[(id)self.secondColor.CGColor,
                   (id)self.thirdColor.CGColor,
                   (id)self.firstColor.CGColor];
        
        
        self.animateStep=1;
    } else if (self.animateStep==1){
        colors = @[(id)self.thirdColor.CGColor,
                   (id)self.firstColor.CGColor,
                   (id)self.secondColor.CGColor];
        
        self.animateStep=2;
    }   else if (self.animateStep==2){
        colors = @[(id)self.firstColor.CGColor,
                   (id)self.secondColor.CGColor,
                   (id)self.thirdColor.CGColor];
        
        self.animateStep=0;
    }

    
    
    NSArray *locations = [[NSArray alloc] init];
    if (self.animateStep==0) {
        
        locations=@[self.firstLocation,
                    [NSNumber numberWithFloat:0.5],
                    self.thirdLocation];
        
        self.animateStep=1;
    } else if (self.animateStep==1){
        locations=@[self.firstLocation,
                    [NSNumber numberWithFloat:0.8],
                    self.thirdLocation];
        self.animateStep=2;
    } else if (self.animateStep==2){
        locations=@[self.firstLocation,
                    [NSNumber numberWithFloat:1],
                    self.thirdLocation];
        self.animateStep=0;
    }
    
   
    
    [self animateLayerWithLocations:locations andColors:colors];
}

-(void) shiftLocations {
    self.firstLocation=[NSNumber numberWithFloat:0.0];
    self.secondLocation=[NSNumber numberWithFloat:0.1];
    self.thirdLocation=[NSNumber numberWithFloat:1.0];
    self.gradientLayer.startPoint = CGPointMake(0, 0.0);
    self.gradientLayer.endPoint = CGPointMake(0, 1.0);
    self.firstColor =  [UIColor colorWithRed:120/255.0f green:200/255.0f blue:251/255.0f alpha:1.0f];
    self.secondColor = [UIColor colorWithRed:77/255.0f green:186/255.0f blue:225/255.0f alpha:1.0f];
    self.thirdColor = [UIColor colorWithRed:50/255.0f green:140/255.0f blue:246/255.0f alpha:1.0f];
    self.gradientLayer.colors=[NSArray arrayWithObjects:(id)self.firstColor.CGColor, (id)self.secondColor.CGColor,(id)self.thirdColor.CGColor, nil];

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

-(void) pickColors {
    
    
    
    NSArray *colors = [[NSArray alloc] init];

    if (self.animateStep==0) {
        colors = @[(id)self.secondColor.CGColor,
                   (id)self.thirdColor.CGColor,
                   (id)self.firstColor.CGColor];
    
        
        self.animateStep=1;
    } else if (self.animateStep==1){
        colors = @[(id)self.thirdColor.CGColor,
                            (id)self.firstColor.CGColor,
                            (id)self.secondColor.CGColor];
     
        self.animateStep=2;
    }   else if (self.animateStep==2){
        colors = @[(id)self.firstColor.CGColor,
                   (id)self.secondColor.CGColor,
                   (id)self.thirdColor.CGColor];
    
        self.animateStep=0;
    }
    
//    [self animateLayerWithLocations:locations];
    [self animateLayerWithColors:colors];
}


-(void) adjustLocation: (NSString *)accelerationDirection {
    if ([accelerationDirection isEqualToString:@"right"] && ([self.secondLocation floatValue]<0.99)) {
//        self.firstLocation=[NSNumber numberWithFloat:[self.firstLocation floatValue] +0.01];
        self.secondLocation=[NSNumber numberWithFloat:[self.secondLocation floatValue] +0.01];
//        self.thirdLocation=[NSNumber numberWithFloat:[self.thirdLocation floatValue] +0.01];
    } else if ([accelerationDirection isEqualToString:@"left"] && ([self.secondLocation floatValue]>0.01)) {
//        self.firstLocation=[NSNumber numberWithFloat:[self.firstLocation floatValue] -0.01];
        self.secondLocation=[NSNumber numberWithFloat:[self.secondLocation floatValue] -0.01];
//        self.thirdLocation=[NSNumber numberWithFloat:[self.thirdLocation floatValue] -0.01];
    }
    
    
    NSArray *newLocations = @[self.firstLocation,self.secondLocation, self.thirdLocation];
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self animateLayerWithLocations:newLocations];
    }];
    
}


-(void)animateLayerWithLocations: (NSArray *) locations
{
    
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
    
    
    // Add the animation to our layer
    
    [self.gradientLayer addAnimation:animation forKey:@"animateGradient"];

}


-(void)animateLayerWithLocations: (NSArray *) locations andColors: (NSArray *) colors
{
    
    NSArray *fromLocations = self.gradientLayer.locations;
    NSArray *toLocations = locations;
    NSArray *fromColors = self.gradientLayer.colors;
    NSArray *toColors = colors;
    
    
    [self.gradientLayer setLocations:toLocations];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
    
    animation.fromValue             = fromLocations;
    animation.toValue               = toLocations;
    animation.duration              = 3.0;
    animation.removedOnCompletion   = YES;
    animation.fillMode              = kCAFillModeForwards;
    animation.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.delegate              = self;
    
    CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"colors"];
    
    colorAnimation.fromValue             = fromColors;
    colorAnimation.toValue               = toColors;
    colorAnimation.duration              = 3.0;
    colorAnimation.removedOnCompletion   = YES;
    colorAnimation.fillMode              = kCAFillModeForwards;
    colorAnimation.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    colorAnimation.delegate              = self;
    
    
    
    // Add the animation to our layer
    [self.gradientLayer addAnimation:animation forKey:@"animateGradient"];
    [self.gradientLayer addAnimation:colorAnimation forKey:@"animateGradient"];
    
}




-(void)animateLayerWithColors: (NSArray *) colors
{
    
    NSArray *fromColors = self.gradientLayer.colors;
    NSArray *toColors = colors;
    
    [self.gradientLayer setColors:toColors];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"colors"];
    
    animation.fromValue             = fromColors;
    animation.toValue               = toColors;
    animation.duration              = 3.0;
    animation.removedOnCompletion   = YES;
    animation.fillMode              = kCAFillModeForwards;
    animation.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.delegate              = self;
    
    // Add the animation to our layer
    
    [self.gradientLayer addAnimation:animation forKey:@"animateGradient"];
}


//-(void) changeBackgroundColor {
//    NSLog(@"Timer");
//    
////    void (^animationBlock)() = ^{
////                    [UIView addKeyframeWithRelativeStartTime:0.0
////                                    relativeDuration:1/4
////                                          animations:^{
////                                              self.gradientLayer.locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.8],
////                                                                              [NSNumber numberWithFloat:0.9],
////                                                                              [NSNumber numberWithFloat:1.0], nil];
////                                              [self.view layoutIfNeeded];
////                                              NSLog(@"1");
////                                          }];
////            [UIView addKeyframeWithRelativeStartTime:1/4
////                                    relativeDuration:1/4
////                                          animations:^{
////                                              self.gradientLayer.locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.3],
////                                                                              [NSNumber numberWithFloat:0.6],
////                                                                              [NSNumber numberWithFloat:0.8], nil];
////                                              NSLog(@"2");
////                                              [self.view layoutIfNeeded];
////                                          }];
////            [UIView addKeyframeWithRelativeStartTime:3/4
////                                    relativeDuration:1/4
////                                          animations:^{
////                                              self.gradientLayer.locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],
////                                                                              [NSNumber numberWithFloat:0.1],
////                                                                              [NSNumber numberWithFloat:0.2], nil];
////                                              NSLog(@"3");
////                                              [self.view layoutIfNeeded];
////                                          }];
////    };
////
////    [UIView animateKeyframesWithDuration:2.0
////                                   delay:0.0
////                                 options:0
////                              animations:animationBlock
////                              completion:nil
////        
////    ];
//
//        
//    [UIView animateWithDuration:2.0
//                              delay:0
//                            options:UIViewAnimationOptionCurveEaseInOut
//                         animations:^{
//                             [CATransaction begin];
//                             [CATransaction setAnimationDuration:2.0];
//                             
//                             UIColor *firstColor = [UIColor orangeColor];
//                             UIColor *secondColor = [UIColor yellowColor];
//                             UIColor *thirdColor = [UIColor redColor];
//                             
//                             NSArray* newColors = [NSArray arrayWithObjects:
//                                                   (id)firstColor.CGColor,
//                                                   (id)secondColor.CGColor,
//                                                   (id)thirdColor.CGColor,
//                                                   nil];
//                             [self.gradientLayer setColors:newColors];
//                             
//                             [CATransaction commit];
//                         }
//                         completion:^(BOOL b) {
//                             [self changeBackgroundColor];
//                         }];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
