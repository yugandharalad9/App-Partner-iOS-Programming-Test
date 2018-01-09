//
//  LoginViewController.m
//  iOSTest
//
//  Created by App Partner on 9/6/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import "LoginViewController.h"
#import "MenuViewController.h"
#import "LoginClient.h"

@interface LoginViewController ()
@property (nonatomic, strong) LoginClient *client;
@property (nonatomic, strong) UIAlertController *alertController;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *username;



@end

@implementation LoginViewController

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make the UI look like it does in the mock-up.
 *
 * 2) Take username and password input from the user using UITextFields
 *
 * 3) Using the following endpoint, make a request to login
 *    URL: http://dev3.apppartner.com/AppPartnerDeveloperTest/scripts/login.php
 *    Parameter One: username
 *    Parameter Two: password
 *
 * 4) A valid username is 'AppPartner'
 *    A valid password is 'qwerty'
 *
 * 5) Calculate how long the API call took in milliseconds
 *
 * 6) If the response is an error display the error in a UIAlertView
 *
 * 7) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertView
 *
 * 8) When login is successful, tapping 'OK' in the UIAlertView should bring you back to the main menu.
**/



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Login";
}

- (IBAction)didPressLoginButton:(id)sender
{
    
    _client = [[LoginClient alloc]init];
    [_client loginWithUsername:[_username text] passwordEntered:[_password text] completion:^(NSDictionary *dict, NSString *time) {
        
        NSLog(@"Data in completion block %@ with TIME: %@" , dict, time);
        
        if (dict != nil) {
            [self showAlert:dict time:time];
        }
        
    }];
}


- (void) showAlert:(NSDictionary *)dict time:(NSString*)time {
    
    NSString *message = dict[@"message"];
    
    if([dict[@"message"]  isEqual: @"Success"])
    {
        message = [NSString stringWithFormat:@"%@ %@ %@", message, @"\n Time taken: ", time];
    }
   
    
    
    dispatch_async(dispatch_get_main_queue(),^{
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Login"
                                     message:message
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        
        //Add Buttons
        
        UIAlertAction* okButton = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
                                       if([dict[@"message"]  isEqual: @"Success"])
                                       {
                                           [self.navigationController popViewControllerAnimated:YES];
                                       }
                                   }];
        
        //Add your buttons to alert controller
        
        [alert addAction:okButton];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    });
    
    
}
    
@end
