//
//  Imagen.h
//  DualmobileCongress
//
//  Created by Arturo Sanhueza on 14-10-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Evento, Eventopadre, Persona;

@interface Imagen : NSManagedObject

@property (nonatomic, retain) id binarioImagen;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSSet *eventoPadreQueGrafico;
@property (nonatomic, retain) NSSet *eventoQueGrafico;
@property (nonatomic, retain) NSSet *personaQueGrafico;
@end

@interface Imagen (CoreDataGeneratedAccessors)

- (void)addEventoPadreQueGraficoObject:(Eventopadre *)value;
- (void)removeEventoPadreQueGraficoObject:(Eventopadre *)value;
- (void)addEventoPadreQueGrafico:(NSSet *)values;
- (void)removeEventoPadreQueGrafico:(NSSet *)values;

- (void)addEventoQueGraficoObject:(Evento *)value;
- (void)removeEventoQueGraficoObject:(Evento *)value;
- (void)addEventoQueGrafico:(NSSet *)values;
- (void)removeEventoQueGrafico:(NSSet *)values;

- (void)addPersonaQueGraficoObject:(Persona *)value;
- (void)removePersonaQueGraficoObject:(Persona *)value;
- (void)addPersonaQueGrafico:(NSSet *)values;
- (void)removePersonaQueGrafico:(NSSet *)values;

@end
