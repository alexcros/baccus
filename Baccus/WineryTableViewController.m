//
//  WineryTableViewController.m
//  Baccus
//
//  Created by Alexandre Cros on 21/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "WineViewController.h"
#import "WineryTableViewController.h"

@implementation WineryTableViewController

#pragma mark -  Init

-(id) initWithModel: (WineryModel*) aModel
              style: (UITableViewStyle) aStyle { // style: UITableViewStyle constant
    
    if (self = [super initWithStyle:aStyle]) {
        
        _model = aModel;
        self.title = @"Baccus";
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBariPhonePortrait.png"] forBarMetrics:UIBarMetricsDefault];
    }
    return self;
}

#pragma mark -  View Lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.5
                                                                        green:0
                                                                         blue:0.13                                                                        alpha:1];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setDefaults];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    NSInteger count = 0;
    
    if (section == RED_WINE_SECTION) {
        count = [self.model redWineCount];
    }
    else if (section == WHITE_WINE_SECTION) {
        count = [self.model whiteWineCount];
    }
    else {
        count = [self.model otherWineCount];
    }
    
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell"; // constant, una constante por cada tipo de tabla
                            //method
    WineModel *wine = [self wineForIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // cell empty?
    if (cell == nil) {
        
        //Create new cell
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier];
        
        // aplicamos diseño
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_bg.png"]];
        cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.detailTextLabel.backgroundColor = [UIColor clearColor];
    }
    
    // Syncro model with view
    /*cell.imageView.image = wine.photo;
    cell.textLabel.text = wine.name;
    cell.detailTextLabel.text = wine.wineCompanyName;*/
    
    // Sincronizamos modelo con vista (celda)
    if (wine.photo) {
        cell.imageView.image = wine.photo;
    }
    else {
        cell.imageView.image = [UIImage imageNamed:@"cell_icon_bg.png"];
    }
    cell.textLabel.text = wine.name;
    cell.detailTextLabel.text = wine.wineCompanyName;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName = nil;
    
    if (section == RED_WINE_SECTION) {
        sectionName = @"Tinto";
    }
    else if (section == WHITE_WINE_SECTION){
        sectionName = @"Blanco";
    }
    else{
        sectionName = @"Otros";
    }
    
    return sectionName;
}

#pragma mark - table view delegate

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Select wine
    WineModel *wine = [self wineForIndexPath:indexPath];
    
    // Notify to delegate
    [self.delegate WineryTableViewController:self
                               didSelectWine:wine];
    // create and send notificación
    NSNotification *n = [NSNotification notificationWithName:DID_SELECT_WINE_NOTIFICATION_NAME
                                                      object:self
                                                    userInfo:@{WINE_KEY: wine}];
    
    [[NSNotificationCenter defaultCenter] postNotification:n];
    
    // saving lastSelectedWine
    [self saveLastSelectedWineAtSection:indexPath.section
                                    row:indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // devolvemos el tamaño al mismo que el background que hemos puesto
    return 72;
}

#pragma mark - WineryTableViewControllerDelegate

- (void)WineryTableViewController:(WineryTableViewController *)wineryVC didSelectWine:(WineModel *)aWine{
    
    WineViewController *wineVC = [[WineViewController alloc]initWithModel:aWine];
    
    [self.navigationController pushViewController:wineVC
                                         animated:YES];
}

/*
 #pragma mark -  WineryTableViewControllerDelegate
 
 - (void)wineryTableViewController:(WineryTableViewController *)wineryVC
 didSelectWine:(WineModel *)aWine
 {
 // create controller with model
 WineViewController *wineVC = [[WineViewController alloc]initWithModel:aWine];
 
 // Hacer un push
 [self.navigationController pushViewController:wineVC
 animated:YES];
 }
 
 */

#pragma mark -  Utils

- (WineModel *)wineForIndexPath:(NSIndexPath *)indexPath
{
    // Wich kind of wine?
    WineModel *wine = nil;
    
    if (indexPath.section == RED_WINE_SECTION) {
        wine = [self.model redWineAtIndex:indexPath.row];
    }
    else if (indexPath.section == WHITE_WINE_SECTION) {
        wine = [self.model whiteWineAtIndex:indexPath.row];
    }
    else {
        wine = [self.model otherWineAtIndex:indexPath.row];
    }
    
    return wine;
}

#pragma mark - NSUserDefaults

- (NSDictionary *)setDefaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // show the first wine by default
    NSDictionary *defaultWineCoords = @{SECTION_KEY : @(RED_WINE_SECTION), ROW_KEY : @0};
    
    // object assignement
    [defaults setObject:defaultWineCoords
                 forKey:LAST_WINE_KEY];
    // saving (optional)
    [defaults synchronize];
    
    return defaultWineCoords;
    
}

- (void)saveLastSelectedWineAtSection:(NSUInteger)section row:(NSUInteger)row
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@{SECTION_KEY : @(section),
                          ROW_KEY     : @(row)}
                 forKey:LAST_WINE_KEY];
    
    [defaults synchronize]; // saving, optional
}
     
-(WineModel*)lastSelectedWine{

    
        NSIndexPath *indexPath = nil;
        NSDictionary *coords = nil;
        
        coords = [[NSUserDefaults standardUserDefaults] objectForKey:LAST_WINE_KEY];
        
        if (coords == nil) {
           // coords = nil means no key in LAST_WINE_KEY
           // app loaded by the first time
            // We put a default value: the first red
            coords = [self setDefaults];
        }
        
        // coords to indexpath
        indexPath = [NSIndexPath indexPathForRow:[[coords objectForKey: ROW_KEY] integerValue]
                                       inSection:[[coords objectForKey: SECTION_KEY] integerValue]];

        // return wine by indexPath
        return [self wineForIndexPath:indexPath];
}
@end