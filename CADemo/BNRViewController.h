//
//  BNRViewController.h
//  CADemo
//
//  Created by Jonathan Blocksom on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNRViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *chaseButton;

- (IBAction)startChase:(id)sender;

@end
