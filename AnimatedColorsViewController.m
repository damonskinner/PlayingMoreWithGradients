//
//  AnimatedColorsViewController.m
//  PlayingMoreWithGradients
//
//  Created by Damon Skinner on 4/25/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "AnimatedColorsViewController.h"
#import "UIColor+SampleColors.h"

@interface AnimatedColorsViewController ()

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
-(void) changeColors;
-(void)animateLayerWithColors: (NSArray *) colors;

@end

@implementation AnimatedColorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor whiteColor];
    
    self.animateStep=0;
    
    [self setUpGradientLayer];
    
    [self kickOffAnimation];
    
}


-(void) kickOffAnimation {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(changeColors) userInfo:nil repeats:YES];
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

-(void) changeColors {
    
    
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
    
    [self animateLayerWithColors:colors];
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

@end
