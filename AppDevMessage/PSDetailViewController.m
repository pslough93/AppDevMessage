//
//  PSDetailViewController.m
//  AppDevMessage
//
//  Created by Patrick Slough on 5/25/14.
//  Copyright (c) 2014 Patrick Slough. All rights reserved.
//

#import "PSDetailViewController.h"
#import <Parse/Parse.h>

@interface PSDetailViewController ()
- (void)configureView;
@end

@implementation PSDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        [self configureView];
    }
}

- (void)configureView
{
    if (self.detailItem) {
        self.detailMessageText.text = [self.detailItem objectForKey:@"messageText"];
        NSString *author = [self.detailItem objectForKey:@"author"];
        NSString *senderText = [@"Sender: " stringByAppendingString:author];
        self.detailAuthorText.text = senderText;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowEdit"]) {
        PFObject *object = self.detailItem;
        [[segue destinationViewController] setEditItem:object];
    };
}

@end
