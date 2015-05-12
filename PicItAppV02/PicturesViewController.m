//
//  PicturesViewController.m
//  
//
//  Created by Khaled Jemni on 05/02/15.
//
//

#import "PicturesViewController.h"

@interface PicturesViewController ()

@end

@implementation PicturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    if(self.pics.count>0)
        self.image.image = [self.pics objectAtIndex:0];
    else
        
    {
        UIAlertController *alert = [ UIAlertController alertControllerWithTitle:@"0 Pictures" message:@"You have not taken pictures" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK"
                            style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction *action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                             }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 

 
 
*/


- (IBAction)setNext:(id)sender {
    
    if (index<self.pics.count-1) {
        self.image.image= [self.pics objectAtIndex:index+1];
        index++;
    }
    
}









@end
