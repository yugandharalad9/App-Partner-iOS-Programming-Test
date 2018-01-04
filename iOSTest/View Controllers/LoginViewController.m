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
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;



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
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"hehe" style:UIBarButtonItemStylePlain target:nil action:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender
{
    MenuViewController *mainMenuViewController = [[MenuViewController alloc] init];
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
}

- (IBAction)didPressLoginButton:(id)sender
{
    //Mark: - Log In request sucessful
    {
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"LogIn"
                                     message:@"Log In Successful!!"
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        //Add Buttons
        
        UIAlertAction* continueButton = [UIAlertAction
                                    actionWithTitle:@"Continue"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                    }];
        
        UIAlertAction* cancelButton = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
                                   }];
        
        //Add your buttons to alert controller
        
        [alert addAction:continueButton];
        [alert addAction:cancelButton];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"http://dev3.apppartner.com/AppPartnerDeveloperTest/scripts/login.php"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"response %@", response);
        NSLog(@"data %@", data);
        
        //NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //NSLog(@"%@", str);
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        NSLog(@"%@", dict);
        
        
        
        
        
    }
      ] resume
     ];
    //Mark: - Log In request failed
    
    
    
   /* {
        UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"LogIn"
                                 message:@"Log In UnSuccessful"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    //Add Buttons
    
        UIAlertAction* TryAgainButton = [UIAlertAction
                                     actionWithTitle:@"Try-Again"
                                     style:UIAlertActionStyleDefault
                                     handler:^(UIAlertAction * action) {
                                     }];
        [alert addAction:TryAgainButton];
        
        [self presentViewController:alert animated:YES completion:nil];
    } */
    
}




- (IBAction)loginButton:(id)sender {
    
  /*  @try {
        
        if ([[_email text] isEqualToString:@""] || [[_password text] isEqualToString:@""]) {
            [self alertFailed:@"Please enter correct username and password" :@"Login Failed!"];
            
        } else { */

   
    /* NSString *post = [[NSString alloc] initWithFormat:@"username=%@&password=%@", [_email text], [_password text]];
    NSLog(@"PostData: %@", post);
    NSURL *url = [NSURL URLWithString:@"http://dev3.apppartner.com/AppPartnerDeveloperTest/scripts/login.php"];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"Post"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoder"  forHTTPHeaderField:@"Content-Type"];
    
    //Mark: - NSURLRequest
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *response = nil;
    
    NSDate *startTime = [NSDate date]; */
    
    
    
    
    
    
    
}
@end
