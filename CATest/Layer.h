//
//  Layer.h
//  CATest
//
//  Created by Robin van Dijke on 09-10-12.
//  Copyright (c) 2012 Robin van Dijke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Layer : CALayer {
    CGFloat _animationFactor;
}

@property (nonatomic, assign) CGFloat animationFactor;

@end
