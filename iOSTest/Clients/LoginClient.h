//
//  LoginClient.h
//  iOSTest
//
//  Created by App Partner on 9/23/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginClient : NSObject
- (void)loginWithUsername:(NSString *)username passwordEntered:(NSString *)password completion:(void (^)(NSDictionary *, NSString *))completion;
@end
