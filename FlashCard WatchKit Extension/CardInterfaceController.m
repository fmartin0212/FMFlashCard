//
//  CardInterfaceController.m
//  FlashCard
//
//  Created by Frank Martin Jr  on 6/24/15.
//  Copyright © 2015 Frank Martin Jr . All rights reserved.
//

#import "CardInterfaceController.h"

@interface CardInterfaceController ()
@end
@implementation CardInterfaceController
int i;
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    self.termString = context;
    [self.label setText:self.termString];
    i = 1;
    [self setTitle:@"Back"];
    
    // Configure interface objects here.
    NSUserDefaults *defaults = [[NSUserDefaults alloc]
                                initWithSuiteName:@"group.fm.wristlet"];
    NSString *definitionString = [defaults objectForKey:@"definitionString"];
    self.definitionString = definitionString;

    // Populate table
 
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
- (IBAction)flip {
    if (i == 1) {
    [self.label setText:self.definitionString];
        i = 2;
    } else if (i == 2) {
    [self.label setText:self.termString];
        i = 1;
    }
}


@end



