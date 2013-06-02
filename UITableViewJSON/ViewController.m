//
//  ViewController.m
//  UITableViewJSON
//
//  Created by El Hassasna Fethi on 6/2/13.
//  Copyright (c) 2013 Fethi El Hassasna. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.ninjas = @[@"Naruto Uzumaki",
                    @"Sakura Haruno",
                    @"Sasuke Uchiwa",
                    @"Kakashi Hatake",
                    @"Gaï Maito",
                    @"Neji Hyûga",
                    @"Shikamaru Nara",
                    @"Itachi Uchiwa",
                    @"Chôji Akimichi",
                    @"Asuma Sarutobi",
                    @"Ino Yamanaka",
                    @"Hinata Hyûga"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.ninjas[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ninjas.count;
}

@end
