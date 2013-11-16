//
//  Lugar.h
//  DualmobileCongress
//
//  Created by Arturo Sanhueza on 14-10-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Evento, Institucion, Persona;

@interface Lugar : NSManagedObject

@property (nonatomic, retain) NSString * ciudad;
@property (nonatomic, retain) NSString * nombreLugar;
@property (nonatomic, retain) NSString * pais;
@property (nonatomic, retain) NSSet *eventoLugar;
@property (nonatomic, retain) Institucion *institucionAqui;
@property (nonatomic, retain) NSSet *personaDelQueSoyProcedencia;
@end

@interface Lugar (CoreDataGeneratedAccessors)

- (void)addEventoLugarObject:(Evento *)value;
- (void)removeEventoLugarObject:(Evento *)value;
- (void)addEventoLugar:(NSSet *)values;
- (void)removeEventoLugar:(NSSet *)values;

- (void)addPersonaDelQueSoyProcedenciaObject:(Persona *)value;
- (void)removePersonaDelQueSoyProcedenciaObject:(Persona *)value;
- (void)addPersonaDelQueSoyProcedencia:(NSSet *)values;
- (void)removePersonaDelQueSoyProcedencia:(NSSet *)values;

@end
