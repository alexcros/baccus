//
//  WineViewController.h
//  Baccus
//
//  Created by Alexandre Cros on 17/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "WineModel.h"
#import "WineryTableViewController.h"
@import UIKit;

@interface WineViewController : UIViewController <UISplitViewControllerDelegate,WineryTableViewControllerDelegate>
                                //View reference
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryLabelName;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *originLabel;
@property (weak, nonatomic) IBOutlet UILabel *grapesLabel;
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
                                //arrayOfUIImageView for score
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *ratingViews;

@property (strong, nonatomic) WineModel *model;


-(id) initWithModel: (WineModel *) aModel;

-(IBAction)displayWeb:(id)sender;

@end
