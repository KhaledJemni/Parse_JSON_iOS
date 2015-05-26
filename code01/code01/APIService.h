//
//  APIService.h
//  Code01
//
//  Created by Khaled JEMNI on 23/05/2015.
//  Copyright (c) 2015 Khaled JEMNI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIService : NSObject


-(void)getTextCompletionElementsWithUrl:(NSString*)url completion:(void (^)(NSArray * json))completion;
+ (id)sharedManager;
@end
