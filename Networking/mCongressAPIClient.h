#import "AFIncrementalStore.h"
#import "AFRestClient.h"
#import "mCongressAPIClient.h"

@interface mCongressAPIClient : AFRESTClient <AFIncrementalStoreHTTPClient>

+ (mCongressAPIClient *)sharedClient;

@property BOOL estadoAutorizadorSincronizacion;
@property BOOL estadoAutorizadorUnaVezSync;


@end
