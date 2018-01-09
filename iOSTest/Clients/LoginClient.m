//
//  LoginClient.m
//  iOSTest
//
//  Created by App Partner on 9/23/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import "LoginClient.h"

@interface LoginClient ()
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation LoginClient

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request here to login.
 *
 * 2) Using the following endpoint, make a request to login
 *    URL: http://dev3.apppartner.com/AppPartnerDeveloperTest/scripts/login.php
 *
 * 3) Don't forget, the endpoint takes two parameters 'username' and 'password'
 *
 * 4) A valid username is 'AppPartner'
 *    A valid password is 'qwerty'
 **/

- (void)loginWithUsername:(NSString *)username passwordEntered:(NSString *)password completion:(void (^)(NSDictionary *, NSString *))completion
{

    NSString *post = [[NSString alloc] initWithFormat:@"username=%@&password=%@", username, password];
    
    NSURL *url = [NSURL URLWithString:@"http://dev3.apppartner.com/AppPartnerDeveloperTest/scripts/login.php"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"Post"];
    //[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded"  forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[post dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSDate *startTime = [NSDate date];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      NSString *time = [[NSString alloc] initWithFormat:@"%f", -[startTime timeIntervalSinceNow]*1000];
                                     
                                      NSLog(@"Time: %@", time);
                                      NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                                        //dict[@"time"] = time;
                                        completion(dict, time);
                                }];
    [task resume];
}

@end
