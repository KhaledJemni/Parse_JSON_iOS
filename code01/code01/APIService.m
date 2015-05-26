//
//  APIService.m
//  Code01
//
//  Created by Khaled JEMNI on 23/05/2015.
//  Copyright (c) 2015 Khaled JEMNI. All rights reserved.
//

#import "APIService.h"

static APIService * sharedManager;
@implementation APIService


+ (id)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (sharedManager == nil){
            sharedManager = [[self alloc] init];
        }
    });
    return sharedManager;
}


-(void)getTextCompletionElementsWithUrl:(NSString*)url completion:(void (^)(NSArray * jsonArray))completion
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    NSURLResponse * requestResponse;
    NSError * requestErr;
    NSData *requestData = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:&requestErr];
    NSString* requestReturn = [[NSString alloc] initWithData:requestData encoding:NSUTF8StringEncoding];
    NSData *data = [requestReturn dataUsingEncoding:NSUTF8StringEncoding];
    NSArray * json = [[NSJSONSerialization JSONObjectWithData:data options:0 error:nil] objectForKey:@"products"];
    completion(json);
}

@end
