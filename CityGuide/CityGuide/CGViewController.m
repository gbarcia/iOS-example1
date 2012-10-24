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
#import "AddCityController.h"

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

-(void)setEditing:(BOOL)editing animated:(BOOL) animated { if( editing != self.editing ) {
    [super setEditing:editing animated:animated]; [tableView setEditing:editing animated:animated];
    NSMutableArray *indices = [[NSMutableArray alloc] init]; for(int i=0; i < cities.count; i++ ) {
        [indices addObject:[NSIndexPath indexPathForRow:i inSection:0]]; }
    NSArray *lastIndex = [NSArray arrayWithObject:[NSIndexPath
                                                   indexPathForRow:cities.count inSection:0]];
    if (editing == YES ) {
        for(int i=0; i < cities.count; i++ ) {
            UITableViewCell *cell = [tableView
                                     cellForRowAtIndexPath:[indices objectAtIndex:i]];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        [tableView insertRowsAtIndexPaths:lastIndex
                         withRowAnimation:UITableViewRowAnimationLeft]; } else {
            for(int i=0; i < cities.count; i++ ) { UITableViewCell *cell =
                [tableView
                 cellForRowAtIndexPath:[indices objectAtIndex:i]];
                [cell setSelectionStyle:UITableViewCellSelectionStyleBlue]; }
            [tableView deleteRowsAtIndexPaths:lastIndex
                             withRowAnimation:UITableViewRowAnimationLeft]; }
}
}

#pragma mark UITableViewDataSource Methods
- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"]; if( nil == cell ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"cell"];
    }
    NSLog( @"indexPath.row = %d, cities.count = %d", indexPath.row, cities.count );
    if (indexPath.row < cities.count ) {
    City *thisCity = [cities objectAtIndex:indexPath.row];
        cell.textLabel.text = thisCity.cityName;
        cell.textLabel.textColor = [UIColor blackColor];
        cell.editingAccessoryType = UITableViewCellAccessoryNone;
        if (self.editing) {
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
    }
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
- (void) tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle) editing forRowAtIndexPath:(NSIndexPath *)indexPath {
    if( editing == UITableViewCellEditingStyleDelete ) {
        [cities removeObjectAtIndex:indexPath.row];
        [tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                  withRowAnimation:UITableViewRowAnimationLeft]; }
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
    if (indexPath.row < cities.count && !self.editing ) {
      CityController *city = [[CityController alloc] initWithIndexPath:indexPath];
      [delegate.navController pushViewController:city animated:YES];
    }
    if( indexPath.row == cities.count && self.editing ) {
      AddCityController *addCity = [[AddCityController alloc] init];
      [delegate.navController pushViewController:addCity animated:YES]; }
    [tv deselectRowAtIndexPath:indexPath animated:YES]; }

@end
