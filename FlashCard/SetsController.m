//
//  SetsController.m
//  FlashCard
//
//  Created by Frank Martin Jr  on 6/8/15.
//  Copyright (c) 2015 Frank Martin Jr . All rights reserved.
//

#import "SetsController.h"
@implementation SetsController

+ (SetsController *)sharedInstance {
    static SetsController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^{
        sharedInstance = [SetsController new];
        
    });
    return sharedInstance;
}

-(void) getUserSets{
    [[Quizlet sharedQuizlet]userSets:^(NSArray * setsArray) {
        self.setsArray = setsArray;
        // Instantiate group defaults
        NSUserDefaults *defaults = [[NSUserDefaults alloc]
                                    initWithSuiteName:@"group.fm.wristlet"];
        // Encode and save setsArray to defaults so that it can be used in watchkit
        NSData *setsArrayEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:self.setsArray];
        [defaults setObject:setsArrayEncodedObject forKey:@"array"];
        [defaults synchronize];
    
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

-(void) getUserClasses {
    [[Quizlet sharedQuizlet]userClasses:^(NSArray *classesArray) {
//        NSLog(@"%@", classesArray);
        self.classesArray = classesArray;
        // Instantiate group defaults
        NSUserDefaults *defaults = [[NSUserDefaults alloc]
                                    initWithSuiteName:@"group.fm.wristlet"];
        // Encode and save setsArray to defaults so that it can be used in watchkit
        NSData *classesArrayEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:self.classesArray];
        [defaults setObject:classesArrayEncodedObject forKey:@"array"];
        [defaults synchronize];
        
    } failure:^(NSError *error) {
        
    }];
}

@end
