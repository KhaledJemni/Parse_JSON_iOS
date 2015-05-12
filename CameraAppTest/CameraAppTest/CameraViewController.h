//
//  CameraViewController.h
//  CameraAppTest
//
//  Created by Khaled Jemni on 29/01/15.
//  Copyright (c) 2015 SolidApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface CameraViewController : UIViewController
<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property BOOL newMedia;
@property(strong,nonatomic) IBOutlet UIImageView *imageView;

@end
