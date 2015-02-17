//
//  WineModel.h
//  Baccus
//
//  Created by Alexandre Cros on 17/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

#define NO_RATING -1

@interface WineModel : NSObject

@property (copy, nonatomic) NSString *type;
@property (strong, nonatomic) UIImage *photo;
@property (strong, nonatomic) NSURL *wineCompanyWeb;
@property (copy, nonatomic) NSString * notes;
@property (copy, nonatomic) NSString *origin;
@property (nonatomic) int rating; // 0-5
@property (strong, nonatomic) NSArray *grapes;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *wineCompanyName;


// classh methods
+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin
            grapes: (NSArray *) arrayOfGrapes
    wineCompanyWeb: (NSURL *) aUrl
             notes: (NSString *) aNotes
            rating: (int) aRating
             photo: (UIImage *) aPhoto;

+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin;


// inicializadores: designado> tantos parametros como tenga la clase

-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin
            grapes: (NSArray *) arrayOfGrapes
    wineCompanyWeb: (NSURL *) aUrl
             notes: (NSString *) aNotes
            rating: (int) aRating
             photo: (UIImage *) aPhoto;

// conveniencia

-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin;



@end
