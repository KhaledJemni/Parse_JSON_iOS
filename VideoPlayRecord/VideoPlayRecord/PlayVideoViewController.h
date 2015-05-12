//
//  PlayVideoViewController.h
//  VideoPlayRecord
//
//  Created by Khaled Jemni on 26/01/15.
//  Copyright (c) 2015 SolidApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <MediaPlayer/MediaPlayer.h>

@interface PlayVideoViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
- (IBAction)playVideo:(id)sender;

-(BOOL) startMediaBrowserFromViewController:(UIViewController*)controller usingDelegate:(id)delegate;
@end
