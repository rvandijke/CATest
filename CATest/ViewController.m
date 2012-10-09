//
//  ViewController.m
//  CATest
//
//  Created by Robin van Dijke on 09-10-12.
//  Copyright (c) 2012 Robin van Dijke. All rights reserved.
//

#import "ViewController.h"
#import "Layer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Layer *layer = [Layer layer];
    [self.view.layer addSublayer:layer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"animationFactor"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 3.0;
    [layer addAnimation:animation forKey:nil];
}

@end
