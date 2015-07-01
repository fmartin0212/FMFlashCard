//
//  InterfaceController.h
//  FlashCard WatchKit Extension
//
//  Created by Frank Martin Jr  on 6/13/15.
//  Copyright (c) 2015 Frank Martin Jr . All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import "HomeScreenRowSelector.h"
@interface InterfaceController : WKInterfaceController
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *table;
@property (nonatomic, strong) NSArray *setsArray;
@end
