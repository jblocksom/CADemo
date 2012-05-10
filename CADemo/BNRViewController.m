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
    
    // Demo 1: Falling
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position.y"];
    [anim setToValue:[NSNumber numberWithFloat:500.0]];
    [anim setDuration:1.0f];
    [buttonLayer addAnimation:anim forKey:@"moveit"];

    // Demo 2: Spinning
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [anim2 setToValue:[NSNumber numberWithFloat:0.0]];
    [anim2 setDuration:1.0f];
    [buttonLayer addAnimation:anim2 forKey:@"disappear"];

    [CATransaction commit];
}

@end
