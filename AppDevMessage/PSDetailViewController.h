//
//  PSDetailViewController.h
//  AppDevMessage
//
//  Created by Patrick Slough on 5/25/14.
//  Copyright (c) 2014 Patrick Slough. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
