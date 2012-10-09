//
//  Layer.m
//  CATest
//
//  Created by Robin van Dijke on 09-10-12.
//  Copyright (c) 2012 Robin van Dijke. All rights reserved.
//

#import "Layer.h"

#define kLayerConvertRange(a, b, x)   ((x - a) / (b - a))

@implementation Layer
@dynamic animationFactor;

- (id)init {
    self = [super init];
    
    if (self){
        self.frame = CGRectMake(200, 200, 200, 200);
        self.backgroundColor = [UIColor redColor].CGColor;
        self.borderColor = [UIColor greenColor].CGColor;
        self.borderWidth = 1.0;
    }
    
    return self;
}

- (id)initWithLayer:(id)layer {
    self = [super initWithLayer:layer];
    
    if (self){
        if ([layer isKindOfClass:[self class]])
            self.animationFactor = [layer animationFactor];
    }
    
    return self;
}

- (void)setAnimationFactor:(CGFloat)animationFactor {
    _animationFactor = animationFactor;
    NSLog(@"F: %f", _animationFactor);
    
    if (_animationFactor < 0.5){
        CGFloat correctedFactor = kLayerConvertRange(0, 0.5, _animationFactor);
        self.transform = CATransform3DMakeScale(correctedFactor * 0.5 + 0.5, correctedFactor * 0.5 + 0.5, 1.0);
    }
    
    if (_animationFactor >= 0.5){
        CGFloat correctedFactor = kLayerConvertRange(0.5, 1.0, _animationFactor);
        self.transform = CATransform3DMakeRotation(M_PI * correctedFactor, 1, 0, 0);
    }
}

+ (BOOL)needsDisplayForKey:(NSString *)key {
    return [key isEqualToString:@"animationFactor"] || [super needsDisplayForKey:key];
}

@end
