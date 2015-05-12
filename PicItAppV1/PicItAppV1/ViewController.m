//
//  ViewController.m
//  PicItAppV1
//
//  Created by Khaled Jemni on 02/02/15.
//  Copyright (c) 2015 SolidApps. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

//global variable used to set up the camera and take a photo
AVCaptureSession *session;
AVCaptureStillImageOutput *stillImageOutput;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    session = [[AVCaptureSession alloc]init];
    [session setSessionPreset:AVCaptureSessionPresetPhoto];
    AVCaptureDevice *inputDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error;
    AVCaptureDeviceInput *deviceInPut = [AVCaptureDeviceInput deviceInputWithDevice:inputDevice error:&error];
    
    if ([session canAddInput:deviceInPut])
    {
        [session addInput:deviceInPut];
    }
    
    
    AVCaptureVideoPreviewLayer *previewlayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    
    [previewlayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
   
    CALayer *rootLayer = [[self view] layer];
    [rootLayer setMasksToBounds:YES];
    CGRect frame = self.frameForCapture.frame;
    //CGRect frame = self.frameForCapture.frame;
    [previewlayer setFrame:self.imageView.layer.bounds];
    
    [self.imageView.layer insertSublayer:previewlayer above:0];
    
    stillImageOutput = [[AVCaptureStillImageOutput alloc ] init];
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjects:@[AVVideoCodecJPEG] forKeys:@[@"JPEGCodec"]];
    
    [stillImageOutput setOutputSettings:outputSettings];
    
    [session addOutput:stillImageOutput];
    [session startRunning];
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (IBAction)turnOnOffFlash:(id)sender {
    
    if ([sender isOn]) {
        NSLog(@"ON");
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch]) {
            [device lockForConfiguration:nil];
            [device setTorchMode:AVCaptureTorchModeOn];
            [device unlockForConfiguration];
        }
    } else {
        NSLog(@"OFF");
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch]) {
            [device lockForConfiguration:nil];
            [device setTorchMode:AVCaptureTorchModeOff];
            [device unlockForConfiguration];
        }
        
    }
    
}

- (IBAction)switchCamera:(id)sender {
    
    
    
    
    
    
    
    
}
- (IBAction)viewTapped:(id)sender {
    NSLog(@"view tapped, take single picture");
    AVCaptureConnection *videoConnection = nil;
    
    for (AVCaptureConnection *connection in stillImageOutput.connections) {
        for (AVCaptureInputPort *port in [connection inputPorts]) {
            if ([[port mediaType] isEqual:AVMediaTypeVideo]) {
                videoConnection = connection;
                break;
            }
        }
        
        if(videoConnection) {
            break;
        }
    }
    
    [stillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        if (imageDataSampleBuffer != NULL) {
            NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
            UIImage *image = [UIImage imageWithData:imageData];
            self.imageView.image=image;
            
            
        }
    }];

}
@end
