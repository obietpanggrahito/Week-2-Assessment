//
//  Product.m
//  Week2assessment - Yohan
//
//  Created by Obiet Panggrahito on 27/03/2017.
//  Copyright © 2017 Obiet Panggrahito. All rights reserved.
//

#import "Product.h"

@implementation Product

//3 just skipped this
-(instancetype)init {
    self = [super init];
    if (self) {
        // Initialize self
        
        self.productName = @"Product Name";
        self.releaseDate = @"Release Date";
        self.productImage = [UIImage imageNamed:@"Unknown"];
        self.wikipediaURL = @"http://wikipedia.com";
        
    }
    return self;
}

//5
- (id) initWithProductName : (NSString *) productName withReleaseDate : (NSString *) releaseDate withProductImage : (UIImage *) productImage withWikipediaURL : (NSString *) wikipediaURL {
    
    self = [super init];
    if (self) {
        // Initialize self
        
        self.productName = productName;
        self.releaseDate = releaseDate;
        self.productImage = productImage;
        self.wikipediaURL = wikipediaURL;
        
    }
    return self;
}

@end
