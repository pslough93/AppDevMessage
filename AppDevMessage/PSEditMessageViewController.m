//
//  PSEditMessageViewController.m
//  AppDevMessage
//
//  Created by Patrick Slough on 5/26/14.
//  Copyright (c) 2014 Patrick Slough. All rights reserved.
//

#import "PSEditMessageViewController.h"
#import <Parse/Parse.h>

@interface PSEditMessageViewController ()

- (void)configureView;

@end

@implementation PSEditMessageViewController

- (void) configureView{
    if (self.editItem) {
        self.editMessageText.text = [self.editItem objectForKey:@"messageText"];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
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

-(IBAction)cancel:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)parseUpdate:(id)sender{
    if([self.editMessageText.text length] == 0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"You must enter text in the field" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alert show];
    }
    else{
    PFQuery *query = [PFQuery queryWithClassName:@"message"];
    NSString *ID = [self.editItem objectId];
    [query getObjectInBackgroundWithId:ID block:^(PFObject *message, NSError *error) {
        message[@"messageText"] = self.editMessageText.text;
        [message saveInBackground];
    }];
    [self cancel:self];
    }
}

@end
