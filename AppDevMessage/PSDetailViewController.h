//
//  PSDetailViewController.h
//  AppDevMessage
//
//  Created by Patrick Slough on 5/25/14.
//  Copyright (c) 2014 Patrick Slough. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSEditMessageViewController.h"

@interface PSDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UITextView *detailMessageText;
@property (weak, nonatomic) IBOutlet UILabel *detailAuthorText;

@end
