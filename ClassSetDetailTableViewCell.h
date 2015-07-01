//
//  ClassesSetDetailTableViewCell.h
//  FlashCard
//
//  Created by Frank Martin Jr  on 6/30/15.
//  Copyright © 2015 Frank Martin Jr . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassSetDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *termLabel;
@property (weak, nonatomic) IBOutlet UITextView *definitionTextView;
@end
