//
//  CGAppDelegate.h
//  CityGuide
//
//  Created by Gerardo Barcia Palacios on 22/10/12.
//  Copyright (c) 2012 Gerardo Barcia Palacios. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CGViewController;

@interface CGAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CGViewController *viewController;

@property (strong, nonatomic) UINavigationController *navController;

@property (strong, nonatomic) NSMutableArray *cities;

@end
