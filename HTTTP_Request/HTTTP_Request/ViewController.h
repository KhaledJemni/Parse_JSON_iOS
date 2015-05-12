//
//  ViewController.h
//  HTTTP_Request
//
//  Created by Khaled Jemni on 12/05/15.
//  Copyright (c) 2015 Khaled Jemni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDataDelegate>

//this is an instance variable to hold the response data
{
    NSMutableData *_responseData;
}

@end
