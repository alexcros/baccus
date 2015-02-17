//
//  WineryTableViewController.h
//  Baccus
//
//  Created by Alexandre Cros on 21/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

@import UIKit;
#import "WineryModel.h"
#import "WineModel.h"

//constants

#define RED_WINE_SECTION 0
#define WHITE_WINE_SECTION 1
#define OTHER_WINE_SECTION 2

#define DID_SELECT_WINE_NOTIFICATION_NAME @"newWineSelected"
#define WINE_KEY @"wine"

#define SECTION_KEY @"section"
#define ROW_KEY @"row"
#define LAST_WINE_KEY @"lastWine"

@class WineryTableViewController;

@protocol WineryTableViewControllerDelegate <NSObject>

-(void) WineryTableViewController: (WineryTableViewController *) wineryVC
                    didSelectWine: (WineModel *) aWine;

@end

@interface WineryTableViewController : UITableViewController <WineryTableViewControllerDelegate>

@property (strong, nonatomic) WineryModel *model;
@property (nonatomic, weak) id<WineryTableViewControllerDelegate> delegate;

-(id) initWithModel: (WineryModel*) aModel
              style: (UITableViewStyle) aStyle; // UITableViewStyle constant

- (WineModel *)lastSelectedWine;

@end