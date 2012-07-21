//
//  BNRViewController.m
//  CADemo
//
//  Created by Jonathan Blocksom on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BNRViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface BNRViewController ()

@end

@implementation BNRViewController
@synthesize chaseButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // Set anchor point to a good spot for the 3D flip
    CALayer *buttonLayer = self.chaseButton.layer;
    CGPoint newPos = CGPointMake(buttonLayer.position.x,
                                 buttonLayer.position.y + self.chaseButton.bounds.size.height / 2.0f);
    [buttonLayer setPosition:newPos];
    [buttonLayer setAnchorPoint:CGPointMake(0.5f, 1.0f)];
    
}

- (void)viewDidUnload
{
    [self setChaseButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)startChase:(id)sender {
    // Get the button's layer
    CALayer *buttonLayer = self.chaseButton.layer;
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0f];

#if 1
//    // Demo 1: Falling
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position.y"];
    [anim setToValue:[NSNumber numberWithFloat:500.0]];
    [anim setDuration:1.0f];
    [buttonLayer addAnimation:anim forKey:@"move"];
#endif
    
#if 1
    // Demo 2: Fade out
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [anim2 setToValue:[NSNumber numberWithFloat:0.0]];
    [anim2 setDuration:1.0f];
    [buttonLayer addAnimation:anim2 forKey:@"fade"];
#endif
    
#if 0
    // Demo 3: 3D fold down
    CABasicAnimation *anim3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    
    CATransform3D perspectiveTransform = CATransform3DIdentity;
    perspectiveTransform.m34 = -1.0 / 2500;
    [buttonLayer setTransform:perspectiveTransform];
    
    [anim3 setToValue:[NSNumber numberWithFloat:-M_PI]];
    [anim3 setDuration:1.0f];
    [buttonLayer addAnimation:anim3 forKey:@"flip"];
#endif
    
    [CATransaction commit];
}

@end
