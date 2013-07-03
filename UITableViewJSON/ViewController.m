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
    self.title = @"Ninjas";
    self.ninjas = [[NSMutableArray alloc] init];
    
    [self loadNinjas];
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
    
    cell.textLabel.text = [self.ninjas[indexPath.row] name];
    [cell.imageView setImageWithURL:[NSURL URLWithString:[self.ninjas[indexPath.row] thumbnail]]
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

    [detail loadFromNinja:self.ninjas[indexPath.row]];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)loadNinjas {
    
    NSURL *json = [[NSURL alloc] initWithString:@"http://fethica.github.io/UITableViewJSON/characters.json"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:json];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        NSMutableArray *tempNinjas = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dic in JSON) {
            Ninja *ninja = [[Ninja alloc] initWithDictionary:dic];
            [tempNinjas addObject:ninja];
        }
        
        self.ninjas = [[NSArray alloc] initWithArray:tempNinjas];
        
        [self.table reloadData];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"NSError: %@", error.localizedDescription);
    }];
    
    [operation start];
}

- (void)viewDidUnload {
    [self setTable:nil];
    [super viewDidUnload];
}
@end
