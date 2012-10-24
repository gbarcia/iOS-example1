//
//  AddCityController.m
//  CityGuide
//
//  Created by Gerardo Barcia Palacios on 24/10/12.
//  Copyright (c) 2012 Gerardo Barcia Palacios. All rights reserved.
//

#import "AddCityController.h"

@interface AddCityController ()

@end

@implementation AddCityController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.title = @"New City";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource Methods
- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil; if( indexPath.row == 0 ) {
        cell = nameCell; } else {
            cell = descriptionCell; }
    return cell; }

- (NSInteger)tableView:(UITableView *)tv
 numberOfRowsInSection:(NSInteger)section { return 2;
}
#pragma mark UITableViewDelegate Methods
- (CGFloat)tableView:(UITableView *)tv heightForRowAtIndexPath:(NSIndexPath *)indexPath { CGFloat height;
    if( indexPath.row == 0 ) { height = 44;
    } else {
        height = 362; }
    return height; }

@end
