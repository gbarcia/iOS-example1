//
//  CityController.h
//  CityGuide
//
//  Created by Gerardo Barcia Palacios on 22/10/12.
//  Copyright (c) 2012 Gerardo Barcia Palacios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityController : UIViewController {
    NSIndexPath *index;
    IBOutlet UIImageView *pictureView;
    IBOutlet UITextView *descriptionView;
}

- (id)initWithIndexPath:(NSIndexPath *)indexPath;

@end
