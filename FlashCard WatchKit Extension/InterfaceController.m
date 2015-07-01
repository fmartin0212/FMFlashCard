//
//  InterfaceController.m
//  FlashCard WatchKit Extension
//
//  Created by Frank Martin Jr  on 6/13/15.
//  Copyright (c) 2015 Frank Martin Jr . All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()


@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    // Grab setsAray from user defaults
    NSUserDefaults *defaults = [[NSUserDefaults alloc]
                                initWithSuiteName:@"group.fm.wristlet"];
    NSData *data = [defaults objectForKey:@"array"];
    NSArray *setsArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    self.setsArray = setsArray;
    
    // Populate table
    [self.table setNumberOfRows:setsArray.count withRowType:@"row"];
    for (int i = 0; i < self.table.numberOfRows; i++) {
        HomeScreenRowSelector* theRow = [self.table rowControllerAtIndex:i];
        NSDictionary *dict = [setsArray objectAtIndex:i];
        NSString *string = [dict objectForKey:@"title"];
        NSLog(@"%@", string);
        [theRow.setNameLabel setText:string];
    }
}
- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
-(void)table:(nonnull WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    NSDictionary *termsDictionary = [self.setsArray objectAtIndex:rowIndex];
    NSArray *termsArray = termsDictionary[@"terms"];
    NSUserDefaults *defaults = [[NSUserDefaults alloc]
                                initWithSuiteName:@"group.fm.wristlet"];
    NSData *termsArrayEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:termsArray];
    [defaults setObject:termsArrayEncodedObject forKey:@"termsArray"];
    [defaults synchronize];
    
//    NSLog(@"%@", termsArray);
    [self pushControllerWithName:@"termInterfaceController" context:nil];
}
@end
