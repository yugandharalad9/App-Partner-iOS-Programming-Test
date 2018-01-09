//
//  ChatClient.m
//  iOSTest
//
//  Created by App Partner on 9/23/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import "ChatClient.h"

@interface ChatClient ()
@property (nonatomic, strong) NSURLSession *session;

@end

@implementation ChatClient

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request to fetch chat data used in this app.
 *
 * 2) Using the following endpoint, make a request to fetch data
 *    URL: http://dev3.apppartner.com/AppPartnerDeveloperTest/scripts/chat_log.php
 **/

- (void)fetchChatData:(void (^)(NSArray<Message *> *))completion withError:(void (^)(NSString *error))errorBlock
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://dev3.apppartner.com/AppPartnerDeveloperTest/scripts/chat_log.php"]];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      NSLog(@"response %@", response);
                                      NSLog(@"data %@", data);
                                      NSLog(@"error %@", error);
                                      if (error != nil) {
                                          errorBlock(error.description);
                                      } else {
                                          NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                                          NSMutableArray<Message *> *messages = [[NSMutableArray alloc] init];

                                          for (NSDictionary *dict1 in dict[@"data"]) {
                                              
                                              [messages addObject:[[Message alloc] initWithDictionary:dict1]];
                                          }
                                          completion(messages);
                                      }
                                  }];
    [task resume];}

@end
