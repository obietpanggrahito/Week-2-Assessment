//
//  Product.h
//  Week2assessment - Yohan
//
//  Created by Obiet Panggrahito on 27/03/2017.
//  Copyright © 2017 Obiet Panggrahito. All rights reserved.
//

#import <Foundation/Foundation.h>
//1
#import <UIKit/UIKit.h>

@interface Product : NSObject
//2
@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *releaseDate;
@property (strong, nonatomic) UIImage *productImage;
@property (strong, nonatomic) NSString *wikipediaURL; 

//7
- (id) initWithProductName : (NSString *) productName withReleaseDate : (NSString *) releaseDate withProductImage : (UIImage *) productImage withWikipediaURL : (NSString *) wikipediaURL;

@end
