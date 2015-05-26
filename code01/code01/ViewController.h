//
//  ViewController.h
//  code01
//
//  Created by Khaled JEMNI on 23/05/2015.
//  Copyright (c) 2015 Khaled JEMNI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIService.h"
#import "CompletionElement.h"
#import "ProductsDetailsViewController.h"

@interface ViewController : UIViewController <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray * completionElements;
    NSString * lastSearch;
    
}


@property (nonatomic, strong) IBOutlet UILabel * locationsLabel;
@property (nonatomic, strong) IBOutlet UIImageView * centerImage;
@property (nonatomic, strong) UITableView * completionTableView;
@property (nonatomic, strong) UISearchBar * searchBar;
@property (nonatomic, strong) UIActivityIndicatorView * activityIndicator;

@end

