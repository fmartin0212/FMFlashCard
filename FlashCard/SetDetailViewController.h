//
//  SetDetailViewController.h
//  FlashCard
//
//  Created by Frank Martin Jr  on 6/10/15.
//  Copyright (c) 2015 Frank Martin Jr . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetsController.h"
#import "SetsTableViewController.h"
#import "SetDetailTableViewCell.h"
@interface SetDetailViewController : UITableViewController
@property (nonatomic, strong) NSString *definitionString;
@property SetDetailViewController *detailViewController;

@end

