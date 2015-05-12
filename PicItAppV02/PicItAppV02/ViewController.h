//
//  ViewController.h
//  PicItAppV02
//
//  Created by Khaled Jemni on 05/02/15.
//  Copyright (c) 2015 SolidApps. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h> 
#import "AVCamPreviewView.h"

@interface ViewController : UIViewController<AVCaptureVideoDataOutputSampleBufferDelegate>

{
    BOOL shouldTakePicture;
    AVCaptureStillImageOutput *stillImageOutPut;
    AVCaptureVideoDataOutput *videoDataOutPut;
    dispatch_queue_t videoDataOutPutQueue;
    AVCaptureDevice *videoDevice;
    AVCaptureConnection *videoConnection;
    AVCaptureDeviceInput *deviceInPut;
    NSMutableArray *pictures;
    
}

@property (weak, nonatomic) IBOutlet AVCamPreviewView *previewViewVideo;

@property (weak, nonatomic) IBOutlet UIButton *takePic;

@property(nonatomic,strong) id runtimeErrorHandlingObserver;
@property(nonatomic,strong) AVCaptureSession *session;
@property(nonatomic,strong) AVCaptureDeviceInput *videoDeviceInPut;
@property(nonatomic,strong) AVCaptureMovieFileOutput *movieFileOutPut;
@property(nonatomic,strong) dispatch_queue_t sessionQueue;
@property(nonatomic) UIBackgroundTaskIdentifier backgroundRecordingID;
@property(nonatomic) BOOL lockInterfaceRotation;


+ (AVCaptureDevice *)deviceWithMediaType:(NSString *)mediaType preferringPosition
:(AVCaptureDevicePosition)position;


@end

/*
 
 


 
 */