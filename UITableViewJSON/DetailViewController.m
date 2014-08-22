//
//  DetailViewController.m
//  UITableViewJSON
//
//  Created by El Hassasna Fethi on 8/22/14.
//  Copyright (c) 2014 Fethi El Hassasna. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UITextView *desc;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = [self.ninja name];
    [self.photo setImageWithURL:[NSURL URLWithString:self.ninja.photo]
               placeholderImage:[UIImage imageNamed:@"300-300.jpg"]];
    self.desc.text = self.ninja.desc;
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

@end
