//
//  ViewController.h
//  SnapshotsV1
//
//  Created by Khaled Jemni on 21/01/15.
//  Copyright (c) 2015 Khaled Jemni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>


@property (weak, nonatomic) IBOutlet UIButton *BtnPicture;

@property (weak, nonatomic) IBOutlet UIButton *BtnFlash;


@end

