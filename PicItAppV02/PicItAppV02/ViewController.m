//
//  ViewController.m
//  PicItAppV02
//
//  Created by Khaled Jemni on 05/02/15.
//  Copyright (c) 2015 SolidApps. All rights reserved.
//

#import "ViewController.h"
#import "PicturesViewController.h"


@interface ViewController ()

@end


static void * CapturingStillImageContext = &CapturingStillImageContext;
static void *RecordingContext = &RecordingContext;
static void *SessionRunningAndDeviceAuthorizedContext = & SessionRunningAndDeviceAuthorizedContext;


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    pictures = [NSMutableArray new];
    [self setupAVCapture];
    
}



-(void)viewWillAppear:(BOOL)animated
{
   
    [super viewWillAppear:animated];

}

-(void) setupAVCapture
{
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePic:(id)sender {
    
    
}



@end
