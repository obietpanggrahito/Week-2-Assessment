//
//  ViewController.m
//  Week2assessment - Yohan
//
//  Created by Obiet Panggrahito on 27/03/2017.
//  Copyright © 2017 Obiet Panggrahito. All rights reserved.
//

#import "ViewController.h"
//4
#import "Product.h"
//25
#import "DetailViewController.h"
//28
#import "ProductListTableViewCell.h"

                            //13                                          //40 comform
@interface ViewController () <UITableViewDelegate, UITableViewDataSource, updateTitleDelegate>
//9
@property (strong, nonatomic) NSMutableArray *products;
//12
@property (weak, nonatomic) IBOutlet UITableView *productsTableView;
//19
@property (assign, nonatomic) NSInteger selectedIndex;
//@property (weak, nonatomic) IBOutlet UINavigationItem *navigationTitle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //14
    self.productsTableView.delegate = self;
    self.productsTableView.dataSource = self;
    //[self.productsTableView  setEstimatedRowHeight:100];
    //[self.productsTableView setRowHeight:UITableViewAutomaticDimension];
    
    //18
    [self generateProduct];
}

//5
- (void) generateProduct {
    
    //10
    self.products = [[NSMutableArray alloc]init];
    
    //8
    Product *airPods = [[Product alloc] initWithProductName:@"Apple AirPods" withReleaseDate:@"December 19 2016" withProductImage:[UIImage imageNamed:@"AppleAirPods"] withWikipediaURL:@"https://en.wikipedia.org/wiki/AirPods"];
    Product *watchNike = [[Product alloc] initWithProductName:@"Apple Watch Nike+ Series 2" withReleaseDate:@"October 28 2016" withProductImage:[UIImage imageNamed:@"AppleWatchNike+Series2"] withWikipediaURL:@"https://en.wikipedia.org/wiki/Apple_Watch"];
    Product *MacBookPro4thgen15 = [[Product alloc] initWithProductName:@"MacBook Pro with Touch Bar (4th gen) (15inch)" withReleaseDate:@"October 27 2016" withProductImage:[UIImage imageNamed:@"MacBookProwithTouchBar(4thgen)(15inch)"] withWikipediaURL:@"https://en.wikipedia.org/wiki/MacBook_Pro"];
    Product *MacBookPro4thgen13 = [[Product alloc] initWithProductName:@"MacBook Pro with Touch Bar (4th gen) (13inch)" withReleaseDate:@"October 27 2016" withProductImage:[UIImage imageNamed:@"MacBookProwithTouchBar(4thgen)(13inch)"] withWikipediaURL:@"https://en.wikipedia.org/wiki/MacBook_Pro"];
    Product *MacBookPro13 = [[Product alloc] initWithProductName:@"MacBook Pro (4th gen) (13inch)" withReleaseDate:@"October 27 2016" withProductImage:[UIImage imageNamed:@"MacBookPro(4thgen)(13inch)"] withWikipediaURL:@"https://en.wikipedia.org/wiki/MacBook_Pro"];
    
    //11 should put these directly after number 8
    [self.products addObject:airPods];
    [self.products addObject:watchNike];
    [self.products addObject:MacBookPro4thgen15];
    [self.products addObject:MacBookPro4thgen13];
    [self.products addObject:MacBookPro13];
}

//15
#pragma mark - tableView datasource

//16
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.products count];
    
}

//17
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //29
    ProductListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductList"];
    Product *currentProduct = [self.products objectAtIndex:indexPath.row];
    
    [cell.nameOfProduct setText:currentProduct.productName];
    [cell.releaseDateOfProduct setText:currentProduct.releaseDate];
    [cell.productImageView setImage:currentProduct.productImage];
    
    return cell;
}

//20
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.selectedIndex = indexPath.row;
    [self performSegueWithIdentifier:@"productDetails" sender:self];
    
}

//27
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"productDetails"]) {
        
        DetailViewController *destinationViewController = [segue destinationViewController];
        destinationViewController.selectedProduct = [self.products objectAtIndex:self.selectedIndex];
        
        //41 set delegate
        destinationViewController.delegate = self;
    }
}

//36 for saving the editable notes
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.productsTableView reloadData];
}

//42 call
- (void)didUpdateTitle:(NSString *)title {
    
    [self setTitle:title];
    //[self.title setTitle:title];
}

@end
