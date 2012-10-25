//
//  AddCityController.h
//  CityGuide
//
//  Created by Gerardo Barcia Palacios on 24/10/12.
//  Copyright (c) 2012 Gerardo Barcia Palacios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCityController : UIViewController
<UITableViewDataSource, UITableViewDelegate,
UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    IBOutlet UITableView *tableView;
    IBOutlet UITableViewCell *nameCell;
    IBOutlet UITableViewCell *pictureCell;
    IBOutlet UITableViewCell *descriptionCell;
    
    UIImage *cityPicture;
    UIImagePickerController *pickerController;
}

- (IBAction)addPicture:(id)sender;

@end
