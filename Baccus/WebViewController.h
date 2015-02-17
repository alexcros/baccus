//
//  WebViewController.h
//  Baccus
//
//  Created by Alexandre Cros on 19/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WineModel.h"

@interface WebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) WineModel *model;
@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

-(id) initWithModel: (WineModel *) aModel;


@end
