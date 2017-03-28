//
//  ProductListTableViewCell.h
//  Week2assessment - Yohan
//
//  Created by Obiet Panggrahito on 27/03/2017.
//  Copyright © 2017 Obiet Panggrahito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductListTableViewCell : UITableViewCell
//26
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameOfProduct;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateOfProduct;


@end
