//
//  WineryModel.m
//  Baccus
//
//  Created by Alexandre Cros on 21/01/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "WineryModel.h"

@interface WineryModel ()

@property (strong, nonatomic) NSArray *redWines;
@property (strong, nonatomic) NSArray *whiteWines;
@property (strong, nonatomic) NSArray *otherWines;

@end

@implementation WineryModel

#pragma mark - Properties

// getters
-(NSUInteger) redWineCount {
    
    return [self.redWines count];
}

-(NSUInteger) whiteWineCount {
    
    return [self.whiteWines count];
}

-(NSUInteger) otherWineCount {
    
    return [self.otherWines count];
}

#pragma mark - init

-(id) init {
    
    if (self = [super init]) {
        
        WineModel *tintorro = [WineModel wineWithName:@"Bembibre"
                                      wineCompanyName:@"Dominio de Tares"
                                                 type:@"Tinto"
                                               origin:@"El Bierzo"
                                               grapes:@[@"Mencia"]
                                       wineCompanyWeb:[NSURL URLWithString:@"http://www.dominiodetares.com/index.php/en/wines/bembibre"]
                                                notes:@"Este vino muestra toda la complejidad y la elegancia de la variedad Mencía. En fase visual luce un color rojo picota muy cubierto con tonalidades violáceas en el menisco. En nariz aparecen recuerdos frutales muy intensos de frutas rojas (frambuesa, cereza) y una potente ciruela negra, así como tonos florales de la gama de las rosas y violetas, vegetales muy elegantes y complementarios, hojarasca verde, tabaco y maderas aromáticas (sándalo) que le brindan un toque ciertamente perfumado."
                                               rating:5 photo:[UIImage imageNamed:@"bembibre.jpg"]];
        
        WineModel *albarinno = [WineModel wineWithName:@"Vina Sol"
                                       wineCompanyName:@"Sangre de Toro"
                                                  type:@"Blanco"
                                                origin:@"me lo invento"
                                                grapes:@[@"Mencia"]
                                        wineCompanyWeb:[NSURL URLWithString:@"http://www.alexcros.com"]
                                                 notes:@"El albariño Zarate es un vino blanco monovarietal que pertenece a la Denominación de Origen Rías Baixas. Considerado por la crítica especializada como uno de los grandes vinos blancos del mundo, el albariño ya es todo un mito."
                                                rating:5 photo:[UIImage imageNamed:@"zarate.gif"]];
        
        WineModel *champagne = [WineModel wineWithName:@"Codorniu"
                                       wineCompanyName:@"Bodegas Lol"
                                                  type:@"Otros"
                                                origin:@"El Toro"
                                                grapes:@[@"Mencia"]
                                        wineCompanyWeb:[NSURL URLWithString:@"http://www.taittinger.fr"]
                                                 notes:@"Este vino muestra toda la complejidad y la elegancia de la variedad Mencía. En fase visual luce un color rojo picota muy cubierto con tonalidades violáceas en el menisco. En nariz aparecen recuerdos frutales muy intensos de frutas rojas (frambuesa, cereza) y una potente ciruela negra, así como tonos florales de la gama de las rosas y violetas, vegetales muy elegantes y complementarios, hojarasca verde, tabaco y maderas aromáticas (sándalo) que le brindan un toque ciertamente perfumado."
                                                rating:5 photo:[UIImage imageNamed:@"comtesDeChampagne.jpg"]];
        
        self.redWines = @[tintorro];
        self.whiteWines = @[albarinno];
        self.otherWines = @[champagne];
    }
    return self;
}



-(WineModel *) redWineAtIndex: (NSUInteger) index {
    
    return [self.redWines objectAtIndex:index];
}
-(WineModel *) whiteWineAtIndex: (NSUInteger) index {
 
    return [self.whiteWines objectAtIndex:index];
}
-(WineModel *) otherWineAtIndex: (NSUInteger) index {
    
    return [self.otherWines objectAtIndex:index];
    
}

@end
