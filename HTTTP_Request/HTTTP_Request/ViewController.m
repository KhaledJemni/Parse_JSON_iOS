//
//  ViewController.m
//  HTTTP_Request
//
//  Created by Khaled Jemni on 12/05/15.
//  Copyright (c) 2015 Khaled Jemni. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSLog(@"HTTPHeaders: %@", httpResponse.allHeaderFields);
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    [_responseData appendData:data];
}


- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //NSLog(@"Received");
    //    NSLog(_responseData);
    NSString* htmlCode = [NSString stringWithUTF8String:[ _responseData bytes]];
    
    NSLog(htmlCode);
    NSLog(@"TEST");
    
    
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    
    
}

-(void) viewWillAppear:(BOOL)animated {
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://khaled-jemni.com/"]];
    
    
    request.HTTPMethod = @"POST";
    
    
    [request setValue:@"application/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    
    NSString *stringData = @"some data";
    NSData *requestBodyData = [stringData dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = requestBodyData;
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    
    
}


@end
