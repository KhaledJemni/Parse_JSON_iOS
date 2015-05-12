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
   
    // We have a response here so we can use the variable we already declared in the .h file
    
    //this method is called each time there is a redirect
   
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSLog(@"HTTPHeaders: %@", httpResponse.allHeaderFields);
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    //using the new data
    [_responseData appendData:data];
}


- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    //not required to store a response
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    //showing the result of the request
    NSString* htmlCode = [NSString stringWithUTF8String:[ _responseData bytes]];
    //this will show the HTML Code of the website in the output
    NSLog(htmlCode);
   
    
    
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed
   
    
    
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
