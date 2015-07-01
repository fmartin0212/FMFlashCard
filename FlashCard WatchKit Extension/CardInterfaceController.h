//
//  CardInterfaceController.h
//  FlashCard
//
//  Created by Frank Martin Jr  on 6/24/15.
//  Copyright © 2015 Frank Martin Jr . All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface CardInterfaceController : WKInterfaceController
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label;
@property (nonatomic, strong) NSString *definitionString;
@property (nonatomic, strong) NSString *termString;
@property (nonatomic, strong) NSString *labelText;

@end
