//
//  CGViewController.m
//  CityGuide
//
//  Created by Gerardo Barcia Palacios on 22/10/12.
//  Copyright (c) 2012 Gerardo Barcia Palacios. All rights reserved.
//

#import "CGViewController.h"
#import "CGAppDelegate.h" 
#import "City.h"

@interface CGViewController ()

@end

@implementation CGViewController

@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"City Guide";
    CGAppDelegate *delegate =
    (CGAppDelegate *)[[UIApplication sharedApplication] delegate]; cities = delegate.cities;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setEditing:(BOOL)editing animated:(BOOL) animated {
    if( editing != self.editing ) {
    [super setEditing:editing animated:animated];
    [tableView setEditing:editing animated:animated];
        NSArray *indexes =
        [NSArray arrayWithObject:
         [NSIndexPath indexPathForRow:cities.count inSection:0]]; if (editing == YES ) {
            [tableView insertRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationLeft];
        } else {
            [tableView deleteRowsAtIndexPaths:indexes
                             withRowAnimation:UITableViewRowAnimationLeft]; }
    }
}

#pragma mark UITableViewDataSource Methods
- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"]; if( nil == cell ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"cell"];
    }
    if (indexPath.row < cities.count ) {
    City *thisCity = [cities objectAtIndex:indexPath.row];
        cell.textLabel.text = thisCity.cityName;}
    else {
        cell.textLabel.text = @"Add New City...";
        cell.textLabel.textColor = [UIColor lightGrayColor]; cell.editingAccessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell; }

- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section {
    NSInteger count = cities.count; if(self.editing) {
        count = count + 1; }
    return count;
}

#pragma mark UITableViewDelegate Methods
- (UITableViewCellEditingStyle)tableView:(UITableView *)tv editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < cities.count ) {
        return UITableViewCellEditingStyleDelete;
    } else {
        return UITableViewCellEditingStyleInsert; }
}

- (void)tableView:(UITableView *)tv
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CGAppDelegate *delegate = (CGAppDelegate *)[[UIApplication sharedApplication] delegate];
    CityController *city = [[CityController alloc] initWithIndexPath:indexPath];
    [delegate.navController pushViewController:city animated:YES];
    [tv deselectRowAtIndexPath:indexPath animated:YES]; }

@end
