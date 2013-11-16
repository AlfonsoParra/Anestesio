//
//  mDetalleAboutViewController.m
//  DualmobileCongress
//
//  Created by luis Gonzalez on 13-05-13.
//  Copyright (c) 2013 Luis Gonzalez. All rights reserved.
//

#import "mDetalleHotelWeb.h"
#import "GAI.h"
#import "mConexionRed.h"

@interface mDetalleHotelWeb ()

@end

@implementation mDetalleHotelWeb

- (void)viewDidLoad
{
    [super viewDidLoad];
    //trackenado GA
    
    id trackerJornada = [[GAI sharedInstance] trackerWithTrackingId:@"UA-37133331-5"];
    [trackerJornada sendView:@"DetalleAbout"];
    NSLog(@"%@",self.weburl);
    NSURL        *url       = [NSURL URLWithString:self.weburl];
    NSURLRequest *loadURL   = [[NSURLRequest alloc] initWithURL:url];
    _caga.text = @"Sin acceso";
    [self.WebView loadRequest:loadURL];
    
    NSArray *arr = [NSArray arrayWithObjects:
                    @"publi_bot_1.png",@"publi_bot_2.png", nil];
    [self.animationImageView setImagesArr:arr];
    self.animationImageView.showNavigator = NO;
    [self.animationImageView startAnimating];

}

- (void)webViewDidStartLoad:(UIWebView *)webView
{ [_indicador startAnimating];
    _caga.text = @"Cargando...";
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{ [_indicador stopAnimating]; _indicador.hidden = TRUE;
  [_caga setHidden:YES];
}


- (void)viewDidUnload {
    [self setWebView:nil];
    [super viewDidUnload];
}
- (IBAction)RevelarNotificaciones:(id)sender {
    [self.slidingViewController anchorTopViewTo:ECLeft];
}
@end
