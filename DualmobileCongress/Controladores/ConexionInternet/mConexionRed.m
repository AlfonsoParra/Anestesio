//
//  mConexionRed.m
//  DualmobileCongress
//
//  Created by luis Gonzalez on 27-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mConexionRed.h"
#define kSITIO_WEB "www.google.com"

@implementation UIDevice (mConexionRed)

/*
 * Esta funcion llama a una subclase de UIDevice la cual hace una consulta a google  y si recibe el
 * Ping  devuelve  un true , en el caso contrario devuleve  un false
 */

+(BOOL) estaConectado {
    
    SCNetworkReachabilityRef referencia = SCNetworkReachabilityCreateWithName (kCFAllocatorDefault, kSITIO_WEB);
    
    SCNetworkReachabilityFlags resultado;
    SCNetworkReachabilityGetFlags ( referencia, &resultado );
    
    CFRelease(referencia);
    
    if (resultado & kSCNetworkReachabilityFlagsReachable) {
        
        return TRUE;
    }
    
    return FALSE;
}

@end
