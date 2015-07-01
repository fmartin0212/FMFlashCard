//
//  TermTableInterfaceController.m
//  FlashCard
//
//  Created by Frank Martin Jr  on 6/24/15.
//  Copyright © 2015 Frank Martin Jr . All rights reserved.
//

#import "TermTableInterfaceController.h"

@interface TermTableInterfaceController ()

@end

@implementation TermTableInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    
    // Grab termsArray from user defaults
    NSUserDefaults *defaults = [[NSUserDefaults alloc]
                                initWithSuiteName:@"group.fm.wristlet"];
    NSData *data = [defaults objectForKey:@"termsArray"];
    NSArray *termsArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    self.termsArray = termsArray;
    // Populate table
    [self.table setNumberOfRows:termsArray.count withRowType:@"row"];
    for (int i = 0; i < self.table.numberOfRows; i++) {
        TermTableRowSelector* theRow = [self.table rowControllerAtIndex:i];
        NSDictionary *dict = [termsArray objectAtIndex:i];
        NSString *string = [dict objectForKey:@"term"];
        NSLog(@"%@", string);
        [theRow.termLabel setText:string];
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
    // Create term and definition string based on row selected
    NSDictionary *dict = [self.termsArray objectAtIndex:rowIndex];
    NSString *termString = dict[@"term"];
    NSString *definitionString = dict[@"definition"];
    NSLog(@"%@", definitionString);

    // Save string to user defauts to be used in card interface controller
    NSUserDefaults *defaults = [[NSUserDefaults alloc]
                                initWithSuiteName:@"group.fm.wristlet"];
//    [defaults setObject:termString forKey:@"termString"];
    [defaults setObject:definitionString forKey:@"definitionString"];
    [defaults synchronize];

    
    
    [self presentControllerWithName:@"cardInterfaceController" context:termString];
}
@end



