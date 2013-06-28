//
//  ViewController.h
//  UITableViewJSON
//
//  Created by El Hassasna Fethi on 6/2/13.
//  Copyright (c) 2013 Fethi El Hassasna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ninja.h"

@interface ViewController : UIViewController

@property (nonatomic, strong)NSMutableArray *ninjas;
@property (weak, nonatomic) IBOutlet UITableView *table;

@end
