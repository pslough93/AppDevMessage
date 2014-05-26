//
//  PSNewMessageViewController.m
//  AppDevMessage
//
//  Created by Patrick Slough on 5/25/14.
//  Copyright (c) 2014 Patrick Slough. All rights reserved.
//

#import "PSNewMessageViewController.h"
#import <Parse/Parse.h>

@interface PSNewMessageViewController ()

@property (nonatomic, strong) IBOutlet UITextField *author;
@property (nonatomic, strong) IBOutlet UITextView *messageText;

@end

@implementation PSNewMessageViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)cancel:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)parseSave:(id)sender{
    
    NSMutableArray *appDevMembers = [NSMutableArray arrayWithObjects:@"Patrick S.", @"Patrick T." @"Maijid", @"Lea", nil];
    
    if([self.messageText.text length] == 0 || [self.author.text length] == 0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"You must enter text in both fields" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alert show];
    }
    else if(![appDevMembers containsObject:self.author.text]){
        UIAlertView *userAlert = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"You must be in AppDev to create a new message" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [userAlert show];
    }
    else{
    PFObject *message = [PFObject objectWithClassName:@"message"];
    [message setObject:self.messageText.text forKey:@"messageText"];
    [message setObject:self.author.text forKey:@"author"];
    [message saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error){
            [self cancel:self];
        }
    }];
    }
}

@end
