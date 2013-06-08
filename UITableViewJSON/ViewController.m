//
//  ViewController.m
//  UITableViewJSON
//
//  Created by El Hassasna Fethi on 6/2/13.
//  Copyright (c) 2013 Fethi El Hassasna. All rights reserved.
//

#import "ViewController.h"
#import "AFJSONRequestOperation.h"
#import "UIImageView+AFNetworking.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"Characters";
    self.ninjas = [[NSArray alloc] init];
    
    NSURL *json = [[NSURL alloc] initWithString:@"http://fethica.github.io/UITableViewJSON/characters.json"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:json];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        self.ninjas = [JSON allObjects];
        [self.table reloadData];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"NSError: %@", error.localizedDescription);
    }];
    
    [operation start];
    
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
    
    cell.textLabel.text = self.ninjas[indexPath.row][@"name"];
    [cell.imageView setImageWithURL:[NSURL URLWithString:self.ninjas[indexPath.row][@"thumbnail"]]
                   placeholderImage:[UIImage imageNamed:@"50-50.jpg"]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ninjas.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *detail =[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    
    [self.navigationController pushViewController:detail animated:YES];
    
    detail.title = self.ninjas[indexPath.row][@"name"];
    [detail.photo setImageWithURL:[NSURL URLWithString:self.ninjas[indexPath.row][@"photo"]] placeholderImage:[UIImage imageNamed:@"300-300.jpg"]];
    detail.desc.text = self.ninjas[indexPath.row][@"description"];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)viewDidUnload {
    [self setTable:nil];
    [super viewDidUnload];
}
@end
