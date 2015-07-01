//
//  SetsTableViewController.h
//  FlashCard
//
//  Created by Frank Martin Jr  on 6/8/15.
//  Copyright (c) 2015 Frank Martin Jr . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetsController.h"
#import "SetDetailViewController.h"
@interface SetsTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *terms;
@property (nonatomic, strong) NSArray *setsArray;
@property (nonatomic, strong) NSArray *termsArray;
@property (nonatomic, strong) NSArray *definitionArray;
@property (nonatomic, strong) NSMutableDictionary *mutableDefDict;
@property (nonatomic, strong) NSString *string;
@end
