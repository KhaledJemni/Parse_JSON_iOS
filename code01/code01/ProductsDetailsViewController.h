//
//  ProductsDetailsViewController.h
//  code01
//
//  Created by Khaled JEMNI on 23/05/2015.
//  Copyright (c) 2015 Khaled JEMNI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIService.h"
#import "CompletionElement.h"

@interface ProductsDetailsViewController : UIViewController<UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray * completionElements;
    NSString * lastSearch;
}


@property (nonatomic, strong) IBOutlet UILabel * titleLabel;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView * lodingIndicator;
@property (nonatomic, strong) IBOutlet UILabel * descriptionLabel;
@property (nonatomic, strong) IBOutlet UIImageView * productImage;
@property (nonatomic, strong) UISearchBar * searchBar;
@property (nonatomic, strong) UIActivityIndicatorView * activityIndicator;
@property (nonatomic, strong) UITableView * completionTableView;
@property (nonatomic, strong) CompletionElement * product;
@property (nonatomic, strong) NSString * searchTerm;

@end
