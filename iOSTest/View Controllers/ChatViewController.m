//
//  ChatViewController.m
//  iOSTest
//
//  Created by App Partner on 9/6/16.
//  Copyright © 2016 AppPartner. All rights reserved.
//

#import "ChatViewController.h"
#import "MenuViewController.h"
#import "ChatTableViewCell.h"
#import "ChatClient.h"

@interface ChatViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *chatTable;
@property (nonatomic, strong) ChatClient *client;
@property (nonatomic, strong) NSMutableArray *messages;

@end

@implementation ChatViewController

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make the UI look like it does in the mock-up.
 *
 * 2) Using the following endpoint, fetch chat data
 *    URL: http://dev3.apppartner.com/AppPartnerDeveloperTest/scripts/chat_log.php
 *
 * 3) Parse the chat data using 'Message' model
 *
 **/


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self configureTable:self.chatTable];
    _client = [[ChatClient alloc]init];
    [_client fetchChatData:^(NSArray<Message *> *messages) {
        
        NSLog(@"Messages %@", messages);
        
        self.messages = [[NSMutableArray alloc] initWithArray:messages];
        dispatch_async(dispatch_get_main_queue(),^{
            
            [self.chatTable reloadData];
        });
        
        
    } withError:^(NSString *error) {
        
        NSLog(@"Error: %@", error);
    
    }];
    self.title = @"Chat";
    
}

- (void)configureTable:(UITableView *)tableView
{
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerNib:[UINib nibWithNibName:@"ChatTableViewCell" bundle:nil] forCellReuseIdentifier:@"ChatTableViewCell"];
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}


#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatTableViewCell *cell = nil;
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ChatTableViewCell" owner:self options:nil];
        cell = (ChatTableViewCell *)[nib objectAtIndex:0];
    }
    [cell setCellData:self.messages[indexPath.row]];
    //Circular Avatar Image
    cell.imageView.layer.cornerRadius = 25.0f;
    cell.imageView.layer.borderWidth = 2.0f;
    cell.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    cell.imageView.clipsToBounds = YES;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 58.0f;
}


#pragma mark - IBAction

@end
