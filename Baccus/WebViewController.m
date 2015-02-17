//
//  WebViewController.m
//  Baccus
//
//  Created by Alexandre Cros on 19/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "WebViewController.h"
#import "WineryTableViewController.h"



@implementation WebViewController

-(id) initWithModel: (WineModel *) aModel{
    
    if (self = [super initWithNibName:nil
                                bundle:nil]){
        
        _model = aModel;
        self.title = @"Web";
    }
    return self;
}

#pragma mark - View lifecycle

-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.5
                                                                        green:0
                                                                         blue:0.13
                                                                        alpha:1];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRed:0
                                                                       green:1
                                                                        blue:0
                                                                       alpha:1];
    
    [self displayUrl: self.model.wineCompanyWeb];
    
    // alta notification
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(wineDidChange:)
                   name:DID_SELECT_WINE_NOTIFICATION_NAME
                 object:nil];
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    // baja notification
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void) wineDidChange: (NSNotification*) notification {
    // dictionary wine
    NSDictionary *dict = [notification userInfo];
    //
    WineModel *newWine = [dict objectForKey:WINE_KEY];
    // update model
    self.model = newWine;
    [self displayUrl:self.model.wineCompanyWeb];
    
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.activityView setHidden:NO];
    [self.activityView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityView stopAnimating];
    [self.activityView setHidden:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.activityView stopAnimating];
    [self.activityView setHidden:YES];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:[error localizedDescription]
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}

#pragma mark - Utils

-(void) displayUrl: (NSURL *) aURL {
    
    self.browser.delegate = self;
    
    [self.browser loadRequest:[NSURLRequest requestWithURL:aURL]];
    
    self.activityView.hidden = NO;
    [self.activityView startAnimating];
    

}

@end
