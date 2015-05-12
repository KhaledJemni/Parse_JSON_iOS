//
//  RecordVideoViewController.h
//  VideoPlayRecord
//
//  Created by Khaled Jemni on 27/01/15.
//  Copyright (c) 2015 SolidApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface RecordVideoViewController : UIViewController

- (IBAction)recordAndPlay:(id)sender;

-(BOOL) startCameraControllerFromViewController:(UIViewController*)controller
                                  usingDelegate:(id)delegate;
-(void)video:(NSString*)videoPath didFinishSavingWithError:(NSError *) error contextInfo:(void*)contextInfo;

@end
