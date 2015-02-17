//
//  WineModel.m
//  Baccus
//
//  Created by Alexandre Cros on 17/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "WineModel.h"

@implementation WineModel

#pragma mark - Class Methods

// class methods .m
+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin
            grapes: (NSArray *) arrayOfGrapes
    wineCompanyWeb: (NSURL *) aUrl
             notes: (NSString *) aNotes
            rating: (int) aRating
             photo: (UIImage *) aPhoto{
    
    return [[self alloc ] initWithName:aName
                       wineCompanyName:aWineCompanyName
                                  type:aType
                                origin:anOrigin
                                grapes:arrayOfGrapes
                        wineCompanyWeb:aUrl
                                 notes:aNotes
                                rating:aRating
                                 photo:aPhoto];
}

+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin{
    
    return [[self alloc] initWithName:aName
                      wineCompanyName:aWineCompanyName
                                 type:aType
                               origin:anOrigin];
    
}

#pragma mark - Init

-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin
            grapes: (NSArray *) arrayOfGrapes
    wineCompanyWeb: (NSURL *) aUrl
             notes: (NSString *) aNotes
            rating: (int) aRating
             photo: (UIImage *) aPhoto{
    
    if (self = [super init]) {
        // assign parameters to var instances
        _name = aName;
        _wineCompanyName = aWineCompanyName;
        _type = aType;
        _origin =anOrigin;
        _grapes = arrayOfGrapes;
        _wineCompanyWeb = aUrl;
        _notes = aNotes;
        _rating = aRating;
        _photo = aPhoto;
        
    }
    return self;
}

-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin{
    
    return [self initWithName:aName
              wineCompanyName:aWineCompanyName
                         type:aType
                       origin:anOrigin
                       grapes:nil
               wineCompanyWeb:nil
                        notes:nil
                       rating:NO_RATING
                        photo:nil];
    
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"Name: %@\nCompany name: %@\nType: %@\nOrigin: %@\nGrapes: %@\nWine company web: %@\nNotes: %@\nRating: %d\n", self.name, self.wineCompanyName, self.type, self.origin, self.grapes, self.wineCompanyWeb, self.notes, self.rating];
}


@end
