//
//  PicturesViewController.h
//  
//
//  Created by Khaled Jemni on 05/02/15.
//
//

#import <UIKit/UIKit.h>

@interface PicturesViewController : UIViewController


{
    int index;
}




@property(nonatomic,strong) NSMutableArray *pics;


@property (weak, nonatomic) IBOutlet UIImageView *image;



@end
