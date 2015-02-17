//
//  WineryModel.h
//  Baccus
//
//  Created by Alexandre Cros on 21/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WineModel.h"

@interface WineryModel : NSObject

@property (readonly, nonatomic) NSUInteger redWineCount;
@property (readonly, nonatomic) NSUInteger whiteWineCount;
@property (readonly, nonatomic) NSUInteger otherWineCount;

-(WineModel *) redWineAtIndex: (NSUInteger) index;
-(WineModel *) whiteWineAtIndex: (NSUInteger) index;
-(WineModel *) otherWineAtIndex: (NSUInteger) index;



@end
