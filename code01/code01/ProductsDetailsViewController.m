//
//  ProductsDetailsViewController.m
//  code01
//
//  Created by Khaled JEMNI on 23/05/2015.
//  Copyright (c) 2015 Khaled JEMNI. All rights reserved.
//

#import "ProductsDetailsViewController.h"

@interface ProductsDetailsViewController ()

@end

@implementation ProductsDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



-(void)viewWillAppear:(BOOL)animated
{
    self.searchBar = [[UISearchBar alloc]init];
    self.searchBar.text = self.searchTerm;
    self.searchBar.delegate = self;
    self.navigationItem.titleView = self.searchBar;
    self.activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView:self.activityIndicator];
    self.navigationItem.rightBarButtonItem = barButton;
    self.activityIndicator.hidesWhenStopped = YES;
    [self setProductDetails];
    
    
}

-(void)setProductDetails
{
    [self.lodingIndicator startAnimating];
    self.titleLabel.text = self.product.name;
    self.descriptionLabel.text = self.product.description;
    self.descriptionLabel.hidden = NO;
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSURL *imageURL = [NSURL URLWithString:self.product.mediumImageLink];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage * resultImg = [UIImage imageWithData:imageData];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [self.lodingIndicator stopAnimating];
            if(resultImg)
            {
                
                self.productImage.image = resultImg;
                
            }
        });
        
        
    });
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)hideKeyboard:(id)sender
{
    [self.searchBar resignFirstResponder];
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self.completionTableView removeFromSuperview];
    self.completionTableView = [[UITableView alloc]initWithFrame:CGRectMake(searchBar.frame.origin.x, searchBar.frame.origin.y+searchBar.frame.size.height+10, searchBar.frame.size.width, 150)];
    self.completionTableView.hidden = YES;
    self.completionTableView.delegate = self;
    self.completionTableView.dataSource = self;
    [self.view addSubview:self.completionTableView];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
    
    [self.activityIndicator startAnimating];
    if(!completionElements)
        completionElements = [NSMutableArray new];
    else
    {
        [completionElements removeAllObjects];
        [self.completionTableView reloadData];
    }
    
    
    
    
    NSString * parameter = [NSString stringWithFormat:@"http://codeyourapp.net/products.json"];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[APIService sharedManager] getTextCompletionElementsWithUrl:parameter completion:^(NSArray * json)
         {
             
             
             for (NSDictionary * elementObject in json) {
                 if([elementObject isKindOfClass:[NSDictionary class]] && [[elementObject objectForKey:@"indexable_name"] isKindOfClass:[NSString class]] && [[[elementObject objectForKey:@"indexable_name"] uppercaseString] containsString:[searchText uppercaseString]])
                 {
                     
                     
                     CompletionElement * element = [CompletionElement new];
                     [element setProductId:[elementObject objectForKey:@"_id"]];
                     [element setName:[elementObject objectForKey:@"indexable_name"]];
                     [element setDescription:[elementObject objectForKey:@"description"]];
                     if([elementObject.allKeys containsObject:@"location"])
                     {
                         [element setLocations:[elementObject objectForKey:@"location"] ];
                     }
                     
                     if([elementObject.allKeys containsObject:@"images"])
                     {
                         if([[elementObject objectForKey:@"images"] isKindOfClass:[NSArray class]] && ((NSArray*)[elementObject objectForKey:@"images"]).count>0)
                         {
                             [element setMediumImageLink:[[[elementObject objectForKey:@"images"] objectAtIndex:0] objectForKey:@"medium"]];
                         }
                     }
                     dispatch_async(dispatch_get_main_queue(), ^{
                         
                         
                         [completionElements addObject:element];
                         [self.completionTableView reloadData];
                         if(completionElements.count>0)
                             self.completionTableView.hidden = NO;
                     });
                 }
             }
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 
                 [self.activityIndicator stopAnimating];
                 [self.completionTableView reloadData];
                 if(completionElements.count==0)
                     self.completionTableView.hidden = YES;
             });
             
             
         }];
    });
    
    
    
}



-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    
    [completionElements removeAllObjects];
    [self.completionTableView reloadData];
    self.completionTableView.hidden = YES;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.lodingIndicator stopAnimating];
    self.productImage.image = [UIImage imageNamed:@"logo.png"];
    self.descriptionLabel.hidden = YES;
    
    int totalCountLocations = 0;
    for (CompletionElement * element in completionElements) {
        totalCountLocations+=element.locations.count;
    }
    self.titleLabel.text = [NSString stringWithFormat:@"Search available in %i locations", totalCountLocations];
    self.titleLabel.hidden = NO;
    [completionElements removeAllObjects];
    [self.completionTableView reloadData];
    self.completionTableView.hidden = YES;
    
    [searchBar resignFirstResponder];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return completionElements.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = nil;
    static NSString *AutoCompleteRowIdentifier = @"AutoComplete";
    cell = [tableView dequeueReusableCellWithIdentifier:AutoCompleteRowIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AutoCompleteRowIdentifier];
    }
    CompletionElement * element = [completionElements objectAtIndex:indexPath.row];
    cell.textLabel.text = element.name;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.product = [completionElements objectAtIndex:indexPath.row];
    [self setProductDetails];
    [self.searchBar resignFirstResponder];
}





@end
