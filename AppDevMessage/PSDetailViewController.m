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
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

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
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowEdit"]) {
        //PSEditMessageViewController *controller = (PSEditMessageViewController *)segue.destinationViewController;
        //controller.messageText = [self.detailItem objectForKey:@"messageText"];
        PFObject *object = self.detailItem;
        [[segue destinationViewController] setEditItem:object];
    };
}

@end
