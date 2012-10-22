//
//  ViewController.m
//  HelloWorld
//
//  Created by Gerardo Barcia Palacios on 21/10/12.
//  Copyright (c) 2012 Gerardo Barcia Palacios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{ 
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButton:(id)sender {
    _label.text = @"Hi! Gerardo";
}
@end
