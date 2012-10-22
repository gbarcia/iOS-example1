//
//  CGViewController.h
//  CityGuide
//
//  Created by Gerardo Barcia Palacios on 22/10/12.
//  Copyright (c) 2012 Gerardo Barcia Palacios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *cities;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
