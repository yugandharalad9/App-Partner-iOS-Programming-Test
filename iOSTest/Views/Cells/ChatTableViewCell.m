//
//  ChatTableViewCell.m
//  iOSTest
//
//  Created by App Partner on 9/23/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import "ChatTableViewCell.h"

@interface ChatTableViewCell ()

@property (nonatomic, strong) Message *message;
@property (weak, nonatomic) IBOutlet UILabel *header;
@property (weak, nonatomic) IBOutlet UILabel *body;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;

@end

@implementation ChatTableViewCell

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Setup cell to match mockup
 * 
 * 2) Include user's avatar image
 **/


- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setCellData:(Message *)message
{
    [self.header setText:message.username];
    [self.body setText:message.text];
    //[message.avatarURL];
    
    //NSURL *url = [message.avatarURL];
    NSData *data = [NSData dataWithContentsOfURL:message.avatarURL];
    self.imageView.image = [UIImage imageWithData:data];
    
}




@end
