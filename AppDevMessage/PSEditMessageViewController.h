//
//  PSEditMessageViewController.h
//  AppDevMessage
//
//  Created by Patrick Slough on 5/26/14.
//  Copyright (c) 2014 Patrick Slough. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSEditMessageViewController : UIViewController

@property (strong, nonatomic) id editItem;

@property (weak, nonatomic) IBOutlet UITextView *editMessageText;

@end
