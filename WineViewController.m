//
//  WebViewController.m
//  Baccus
//
//  Created by Alexandre Cros on 19/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "WineViewController.h"
#import "WebViewController.h" // import for displayWeb method

@implementation WineViewController

- (id)initWithModel:(WineModel *)aModel
{
    NSString *nibName = nil;
    if (IS_IPHONE) {
        nibName = @"WineViewController_iPhone";
    }
    
    if (self = [super initWithNibName:nibName bundle:nil]) {
        _model = aModel;
        self.title = aModel.name;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if([[[UIDevice currentDevice] systemVersion] floatValue]>=7)
    { self.edgesForExtendedLayout =UIRectEdgeNone;
    }
    
    [self syncViewToModel];
}

#pragma mark - Actions

- (IBAction)displayWeb:(id)sender
{
    // Create webViewController
    WebViewController *webVC = [[WebViewController alloc] initWithModel:self.model];
    
    // Push - send message to property navigationController
    [self.navigationController pushViewController:webVC // webView Controller
                                         animated:YES ];
}

#pragma mark - Utils

- (void)clearRatings
{
    for (UIImageView *each in self.ratingViews) {
        each.image = nil;
    }
}

- (void)displayRating:(int)aRatingValue
{
    [self clearRatings];
    
    UIImage *glass = [UIImage imageNamed:@"splitView_score_glass@2x.png"];
    
    for (int i = 0; i < aRatingValue; i++) {
        [[self.ratingViews objectAtIndex:i] setImage:glass];
    }
}

- (void)syncViewToModel
{
    /* self.nameLabel.text = self.model.name;
     self.typeLabel.text = self.model.type;
     self.originLabel.text = self.model.origin;
     self.wineryLabelName.text = self.model.wineCompanyName;
     self.notesLabel.text = self.model.notes;
     
     [self.notesLabel setNumberOfLines:0];// setnumberlines 0 > shows all text
     self.photoView.image = self.model.photo;
     self.grapesLabel.text = [self arrayToString:self.model.grapes];
     [self displayRating:self.model.rating];
     //self.webButton.enabled = (BOOL)self.model.wineCompanyWeb;
     */
    
    self.nameLabel.text = self.model.name;
    self.typeLabel.text = self.model.type;
    self.originLabel.text = self.model.origin;
    self.wineryLabelName.text = self.model.wineCompanyName;
    self.notesLabel.text = self.model.notes;
    self.photoView.image = self.model.photo;
    
    self.grapesLabel.text = [self arrayToString:self.model.grapes];
    
    [self displayRating:self.model.rating];
    
    //self.webButton.enabled = (BOOL)self.model.wineCompanyWeb;
    
    self.title = self.model.name;
    
    // ajustamos los labels según su tamaño o reducimos la fuente en su caso ya que en el iPhone puede ocurrir que no quepa todo el texto
    self.nameLabel.adjustsFontSizeToFitWidth = YES;
    //self.wineryNameLabel.adjustsFontSizeToFitWidth = YES;
    self.wineryLabelName.adjustsFontSizeToFitWidth = YES;
    self.typeLabel.adjustsFontSizeToFitWidth = YES;
    self.originLabel.adjustsFontSizeToFitWidth = YES;
    [self.grapesLabel sizeToFit];
    
    // como las uvas puede tener un tamaño bastante variable (ajustado mediante sizeToFit)
    // necesitamos bastante espacio para las notas movemos subimos el el frame de la nota
    // lo hacemos solo en iPhone por las restricciones obvias de tamaño
    if (IS_IPHONE) {
        //CGRect newFrame = self.notesView.frame;
        CGRect newFrame = self.notesLabel.frame;
        CGFloat offset = newFrame.origin.y - (self.grapesLabel.frame.origin.y + self.grapesLabel.frame.size.height + 10);
        newFrame.origin.y = self.grapesLabel.frame.origin.y + self.grapesLabel.frame.size.height + 10;
        newFrame.size.height += fabsf(offset);
        self.notesLabel.frame = newFrame;
    }
}

- (NSString *)arrayToString:(NSArray *)anArray
{
    NSString *repr = nil;
    
    if ([anArray count] == 1) {
        //cocoa framework
        repr = [@"100% " stringByAppendingString: [anArray lastObject]];
    }
    else {
        repr = [[anArray componentsJoinedByString:@", "] stringByAppendingString:@"."];
    }
    
    return repr;
}

#pragma mark - UISplitViewControllerDelegate
/*
 -(void)splitViewController:(UISplitViewController *)svc
 willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode {
 
 if(displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
 self.navigationItem.rightBarButtonItem = svc.displayModeButtonItem;
 } else {
 self.navigationItem.rightBarButtonItem = nil;
 }
 
 } */

// turn

- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)button
{
    //remove button from navigation bar in detail navigation controller
    ((UINavigationController*)[svc.viewControllers objectAtIndex:1]).topViewController.navigationItem.rightBarButtonItem = nil;;
}

// init

- (void)splitViewController: (UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController: (UIPopoverController*)pc{
    
    //add button to navigation bar in detail navigation controller
    
    barButtonItem.title = @"Baccus";
    ((UINavigationController*)[svc.viewControllers objectAtIndex:1]).topViewController.navigationItem.rightBarButtonItem = barButtonItem;
    
}

#pragma mark - WineryViewControllerDelegate

-(void) WineryTableViewController: (WineryTableViewController *) wineryVC
                    didSelectWine: (WineModel *) aWine {
    
    //WineViewController *wineVC = [[WineViewController alloc] initWithModel:aWine];
   
    self.model = aWine;
    self.title = aWine.name;
    [self syncViewToModel];
    // Hacer un push
    //[self.navigationController pushViewController:wineVC
                                       //  animated:YES];
}

@end