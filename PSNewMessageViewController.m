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
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)cancel:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)parseSave:(id)sender{
    PFObject *message = [PFObject objectWithClassName:@"message"];
    [message setObject:self.messageText.text forKey:@"messageText"];
    [message setObject:self.author.text forKey:@"author"];
    
    [message saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error){
            [self cancel:self];
        }
    }];
    
}

@end
