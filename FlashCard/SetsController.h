//
//  SetsController.h
//  FlashCard
//
//  Created by Frank Martin Jr  on 6/8/15.
//  Copyright (c) 2015 Frank Martin Jr . All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Quizlet.h"

@interface SetsController : NSObject
@property (strong, retain) NSArray *setsArray;
@property (strong, retain) NSArray *termsArray;
@property (strong, retain) NSArray *classesArray;
@property (strong, retain) NSArray *termsClassesDetailArray;
@property (nonatomic, strong) NSArray *classesDetailArray;
@property (strong, retain) NSDictionary *termsDict;
@property (strong, retain) NSString *definitionString;
@property (strong, retain) NSDictionary *definitionsDictionary;
+ (SetsController *)sharedInstance;
-(void) getUserSets;
-(void) getUserClasses;
@end
