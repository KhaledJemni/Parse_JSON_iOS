//
//  CompletionElement.h
//  Code01
//
//  Created by Khaled JEMNI on 23/05/2015.
//  Copyright (c) 2015 Khaled JEMNI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompletionElement : NSObject

@property (nonatomic, strong) NSString * productId;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * description;
@property (nonatomic, strong) NSString * mediumImageLink;
@property (nonatomic, strong) NSArray * locations;
@end
