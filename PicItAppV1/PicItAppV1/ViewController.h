//
//  ViewController.h
//  PicItAppV1
//
//  Created by Khaled Jemni on 02/02/15.
//  Copyright (c) 2015 SolidApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *frameForCapture;
@property (strong, nonatomic) NSMutableArray *photos;


- (IBAction)turnOnOffFlash:(id)sender;
- (IBAction)switchCamera:(id)sender;

- (IBAction)viewTapped:(id)sender;

@end

