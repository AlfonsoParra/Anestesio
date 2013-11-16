//
//  mAppDelegate.m
//  DualmobileCongress
//
//  Created by luis Gonzalez on 06-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mAppDelegate.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "mCongressIncrementalStore.h"
#import "mConexionRed.h"
#import "Orbiter.h"
#import "GAI.h"
#import "Eventopadre.h"
#import "Persona.h"
#import "Lugar.h"
#import "Evento.h"
#import "Institucion.h"
#import "Notificacion.h"
#import "mCongressAPIClient.h"
#import "SEBViewController.h"

static NSString *const kStoreName = @"Congresos.sqlite";

@implementation mAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024 diskCapacity:20 * 1024 * 1024 diskPath:nil];
    [NSURLCache setSharedURLCache:URLCache];
    
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"HasLaunchedOnce"])
    {}
    else
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    if (![defaults boolForKey:@"kValoresGuardados"])
    {
        NSDictionary *defaultValues = [NSDictionary dictionaryWithObjectsAndKeys:
                                       [NSNumber numberWithFloat:5.0], @"kIntervaloHoraSincro",
                                       
                                       [NSNumber numberWithFloat:30.0], @"kIntervaloHoraNoSincro",
                                       [NSNumber numberWithBool:YES], @"kAutorizadorSincronizacion",
                                       [NSNumber numberWithBool:YES], @"kPrimeraSincro",
                                       
                                       
                                       [NSNumber numberWithBool:YES], @"kValoresGuardados",
                                       nil];
        
        [defaults registerDefaults:defaultValues];
    }
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    [GAI sharedInstance].dispatchInterval = 20;
    [GAI sharedInstance].debug = YES;
    id tracker = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    
    NSLog(@"%@",tracker);
    
    
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound];
    
    return YES;
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

- (NSManagedObjectContext *)managedObjectContext {
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Congresos" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    AFIncrementalStore *incrementalStore = (AFIncrementalStore *)[_persistentStoreCoordinator addPersistentStoreWithType:[mCongressIncrementalStore type] configuration:nil URL:nil options:nil error:nil];
    
    NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:kStoreName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:[storeURL path]]) {
        NSURL *preloadURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Congresos2" ofType:@"sqlite"]];
        NSError* err = nil;
        
        if (![[NSFileManager defaultManager] copyItemAtURL:preloadURL toURL:storeURL error:&err]) {
            NSLog(@"Oops, could copy preloaded data");
    }
}
    NSDictionary *options = @{
                              NSInferMappingModelAutomaticallyOption : @(YES),
                              NSMigratePersistentStoresAutomaticallyOption: @(YES)
                    };
    
    NSError *error = nil;
    if (![incrementalStore.backingPersistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
     NSLog(@"SQLite URL: %@", [[self applicationDocumentsDirectory] URLByAppendingPathComponent:kStoreName]);
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}//

#pragma -mark Notificaciones delegados

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    if (error.code == 3010) {
        NSLog(@"\nPush notifications are not supported in the iOS Simulator.\n");
    } else {
        NSLog(@"\napplication:didFailToRegisterForRemoteNotificationsWithError: %@\n", error);
	}
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    [[ParseOrbiter parseManagerWithApplicationID:@"ei7P4BYnJk8ILaW5JJFdzYPdzzGQikzpB5wjebxa" RESTAPIKey:@"uzp3Rm4bpJZLl2uEr5d39bggHLpitPvYtrO0WefB"] registerDeviceToken:deviceToken withAlias:@"Anestesiologia2013" badge:nil channels:[NSSet setWithArray:[NSArray arrayWithObjects:@"anestesiologia",@"canalete",nil]  ]timeZone:[NSTimeZone defaultTimeZone] success:^(id responseObject) {
        NSLog(@"El Registro (con 'h' el 'ha' ése luchin) ha sido realizado : %@", responseObject);
        
    } failure:^(NSError *error) {
        NSLog(@"Error por : %@", error);
    }];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    id eventoComenzar = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [eventoComenzar sendEventWithCategory:@"uiAction"
                               withAction:@"push"
                                withLabel:@"Recibido"
                                withValue:nil];
    
    [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert];
    [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge];
    
    UIApplicationState estadus = [application applicationState];
    if (estadus == UIApplicationStateActive) {
        
        NSString *titulengue = @"Me parece";
        NSString *texto = [[userInfo valueForKey:@"aps"] valueForKey:@"alert"];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Te informamos que:"
                                                            message:texto
                                                           delegate:self
                                                  cancelButtonTitle:titulengue
                                                  otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];

    NSLog(@"todos los valores de Userinfo ==>%@",[userInfo allValues]);
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"No se ha podido guardar la heua: %@", [error localizedDescription]);
        abort();
        
    }
}

 #pragma mark - Eventos generales de la App

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:nil];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
//    if (![CLLocationManager locationServicesEnabled] || [CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorized ) {
//        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Los servicios de localización están desactivados"
//                                                        message:@"Por favor anda a ajustes pa poder acceder a el servcio de localización de los hoteles"
//                                                       delegate:self
//                                              cancelButtonTitle:@"Mortal, Confiaré en tí..."
//                                              otherButtonTitles:nil];
//        [alert show];
//    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
   [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [self saveContext];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    NSLog(@"llegó la notificación local");
}

@end
