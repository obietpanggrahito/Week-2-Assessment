//
//  DetailViewController.h
//  Week2assessment - Yohan
//
//  Created by Obiet Panggrahito on 27/03/2017.
//  Copyright © 2017 Obiet Panggrahito. All rights reserved.
//

#import <UIKit/UIKit.h>
//22
#import "Product.h"

//37 declare delegate
@class DetailViewController;
@protocol updateTitleDelegate <NSObject>
@optional
-(void)didUpdateTitle:(NSString *) title;

@end

@interface DetailViewController : UIViewController
//23
@property (strong, nonatomic) Product *selectedProduct;

//39 
@property (weak, nonatomic) id<updateTitleDelegate> delegate;

@end
