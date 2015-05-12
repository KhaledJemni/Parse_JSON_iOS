//
//  ViewController.m
//  SnapshotsV1
//
//  Created by Khaled Jemni on 21/01/15.
//  Copyright (c) 2015 Khaled Jemni. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *CameraBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIBarButtonItem *cameraButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(takePicture:)];
//    [self.navigationController.navigationBar.navigationItem setRightBarButtonItem:cameraButtonItem] ;
    
   }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) setupAppearance

{
  
    
}

-(IBAction) takePicture:(id) sender

{
    
    NSLog(@"picture token");
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]  init ] ;
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera ])
       
       {
           [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
           
       }
    
    else {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    //[self presentModalViewController:imagePicker animated:YES];
}


- (IBAction)buttonTapped:(id)sender {
    NSLog(@"button tapped");
}


- (IBAction)flash:(id)sender {
    
    
    NSLog(@"Flash ON/OFF");
   
  /* AVCaptureDevice *device =
     [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
     
     if ([device hasTorch] && [device hasFlash]){
     
     if (device.torchMode == AVCaptureTorchModeOff) {
     
     NSLog(@"ON");
     
     AVCaptureDeviceInput *flashInput =
     [AVCaptureDeviceInput deviceInputWithDevice:device error: nil];
     
     AVCaptureVideoDataOutput *output =
     [[AVCaptureVideoDataOutput alloc] init];
     
     AVCaptureSession *session =
     [[AVCaptureSession alloc] init];
     
     [session beginConfiguration];
     [device lockForConfiguration:nil];
     
     [device setTorchMode:AVCaptureTorchModeOn];
     [device setFlashMode:AVCaptureFlashModeOn];
     
     [session addInput:flashInput];
     [session addOutput:output];
     
     [device unlockForConfiguration];
     
    // [output release];
     
     [session commitConfiguration];
     [session startRunning];
     
     //[self setTorchSession:session];
    // [session release];
     
     }
     else {
     NSLog(@"OFF");
    // [torchSession stopRunning];
     }*/

   
        }






- (IBAction)cam:(id)sender {
    NSLog(@"cam clicked");
}


-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"switchCamera"]) {
        return NO;
    }else
        return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}
    






@end
