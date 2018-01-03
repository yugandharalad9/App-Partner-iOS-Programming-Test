//
//  AnimationViewController.m
//  iOSTest
//
//  Created by App Partner on 12/13/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import "AnimationViewController.h"
#import "MenuViewController.h"

@interface AnimationViewController ()
@property (strong, nonatomic) IBOutlet UIButton *spinButton;

    @property (strong, nonatomic) IBOutlet UIImageView *logoImage;

@end

@implementation AnimationViewController


/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make the UI look like it does in the mock-up.
 *
 * 2) Logo should spin when the user hits the spin button
 *
 * 3) User should be able to drag the logo around the screen with his/her fingers
 *
 * 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation 
 *    section in Swfit to show off your skills. Anything your heart desires!
 *
 **/

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Animation";
    
}




- (IBAction)backAction:(id)sender
{
    MenuViewController *mainMenuViewController = [[MenuViewController alloc] init];
    mainMenuViewController.title = @"Coding Tasks";
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
    
}



// Mark: - Spinning the Logo when Spin button pressed

- (IBAction)didPressSpinButton:(id)sender
{
    CABasicAnimation *fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    fullRotation.fromValue = [NSNumber numberWithFloat:0.0f];
    fullRotation.toValue = [NSNumber numberWithFloat: ((360*M_PI)/180)];
    fullRotation.duration = 2.0f;
    fullRotation.repeatCount = INFINITY;
    [_logoImage.layer addAnimation:fullRotation forKey:@"360"];
    
}



@end

