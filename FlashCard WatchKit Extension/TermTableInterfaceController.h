//
//  TermTableInterfaceController.h
//  FlashCard
//
//  Created by Frank Martin Jr  on 6/24/15.
//  Copyright © 2015 Frank Martin Jr . All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import "TermTableRowSelector.h"
@interface TermTableInterfaceController : WKInterfaceController
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *table;
@property (nonatomic, strong) NSArray *termsArray;
@end
