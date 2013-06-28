//
//  DetailViewController.h
//  UITableViewJSON
//
//  Created by El Hassasna Fethi on 6/8/13.
//  Copyright (c) 2013 Fethi El Hassasna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ninja.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UITextView *desc;

- (void)loadFromNinja:(Ninja *)ninja;

@end
