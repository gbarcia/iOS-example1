//
//  CityController.m
//  CityGuide
//
//  Created by Gerardo Barcia Palacios on 22/10/12.
//  Copyright (c) 2012 Gerardo Barcia Palacios. All rights reserved.
//

#import "CityController.h"
#import "CGAppDelegate.h" 
#import "City.h"

@interface CityController ()

@end

@implementation CityController

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
    CGAppDelegate *delegate =
    (CGAppDelegate *) [[UIApplication sharedApplication] delegate];
    City *thisCity = [delegate.cities objectAtIndex:index.row];
    self.title = thisCity.cityName; descriptionView.text = thisCity.cityDescription; descriptionView.editable = NO;
    pictureView.image = thisCity.cityPicture;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithIndexPath: (NSIndexPath *)indexPath {
    if ( (self = [super init]) ) { index = indexPath;
    }
    return self; }

@end
