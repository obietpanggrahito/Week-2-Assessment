//
//  DetailViewController.m
//  Week2assessment - Yohan
//
//  Created by Obiet Panggrahito on 27/03/2017.
//  Copyright © 2017 Obiet Panggrahito. All rights reserved.
//

#import "DetailViewController.h"
//30 before this add safari framework first
#import "SafariServices/SafariServices.h"

@interface DetailViewController ()

//21
@property (weak, nonatomic) IBOutlet UITextField *date;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UIButton *viewInWikipedia;
@property (weak, nonatomic) IBOutlet UIButton *changeTitle;
//33
@property (weak, nonatomic) IBOutlet UIBarButtonItem *edit;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //24
    [self.name setText:self.selectedProduct.productName];
    [self.productImageView setImage:self.selectedProduct.productImage];
    [self.date setText:self.selectedProduct.releaseDate];
    [self.viewInWikipedia addTarget:self action:@selector(viewInWikipediaButton) forControlEvents:UIControlEventTouchUpInside];
    [self.changeTitle addTarget:self action:@selector(changeTitleButton) forControlEvents:UIControlEventTouchUpInside];
    [self setTitle:self.selectedProduct.productName];
    
}

//31 link to SFSafari
-(void) viewInWikipediaButton {
    
    NSURL *URL = [NSURL URLWithString:self.selectedProduct.wikipediaURL];
    if ([SFSafariViewController class] != nil) {
        SFSafariViewController *sfvc = [[SFSafariViewController alloc] initWithURL:URL];
        [self presentViewController:sfvc animated:YES completion:nil];
    } else {
        [[UIApplication sharedApplication] openURL:URL];
    }
}


//32 to handle done button
- (void)safariViewControllerDidFinish:(nonnull SFSafariViewController *)controller {
    [controller dismissViewControllerAnimated:YES completion:nil];}

//34
- (IBAction)editAction:(id)sender {

    if (!self.date.userInteractionEnabled) {
        [self.edit setTitle:@"Done"];
        [self.edit setTintColor:[UIColor redColor]];
        self.date.userInteractionEnabled = YES;
        self.name.hidden = NO;
        self.name.userInteractionEnabled = YES;
    }
    else {
        [self.edit setTitle:@"Edit"];
        [self.edit setTintColor:[UIColor blueColor]];
        self.name.hidden = NO;
        self.name.userInteractionEnabled = NO;
        self.date.userInteractionEnabled = NO;
        self.selectedProduct.releaseDate = self.date.text;
        self.selectedProduct.productName = self.name.text;
        NSLog(@"%@", self.selectedProduct.releaseDate);
        NSLog(@"%@", self.selectedProduct.productName);
        [self setTitle:self.name.text];
    }
}

//39 set delegate
-(void) changeTitleButton {
    
    NSString *newTitle = self.name.text;
    if (self.delegate) {
        [self.delegate didUpdateTitle : newTitle];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
