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
        //NSString *author = [self.detailItem objectForKey:@"author"];
        //NSString *senderText = [@"Sender: " stringByAppendingString:author];
        self.editAuthorText.placeholder = [self.editItem objectForKey:@"author"];
        NSLog(@"%@", [self.editItem objectId]);
    }

}

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
    [self configureView];
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

-(IBAction)parseUpdate:(id)sender{
    PFQuery *query = [PFQuery queryWithClassName:@"message"];
    NSString *ID = [self.editItem objectId];
    [query getObjectInBackgroundWithId:ID block:^(PFObject *message, NSError *error) {
        message[@"messageText"] = self.editMessageText.text;
        message[@"author"] = self.editAuthorText.text;
        [message saveInBackground];
    }];
    [self cancel:self];
}

@end
