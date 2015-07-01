//
//  ClassDetailTableViewController.m
//  FlashCard
//
//  Created by Frank Martin Jr  on 6/30/15.
//  Copyright © 2015 Frank Martin Jr . All rights reserved.
//

#import "ClassDetailTableViewController.h"
#import "ClassSetDetailTableViewController.h"
@interface ClassDetailTableViewController ()

@end

@implementation ClassDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [SetsController sharedInstance].classesDetailArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSDictionary *dict = [[SetsController sharedInstance].classesDetailArray objectAtIndex:indexPath.row];
   
    cell.textLabel.text = dict[@"title"];
    // Configure the cell...
    
    return cell;
}
-(CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return 120;
}
-(void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSDictionary *dict = [[SetsController sharedInstance].classesDetailArray objectAtIndex:indexPath.row];
    NSString *setID = dict[@"id"];
    [[Quizlet sharedQuizlet] viewSetBySetId:setID success:^(id responseObject) {
        NSArray *termsClassesDetailArray = responseObject[@"terms"];
        self.termsClassesDetailArray = termsClassesDetailArray;
        NSLog(@"%@", self.termsClassesDetailArray);

    } failure:^(NSError *error) {
        
    }];
}

//-(void)prepareForSegue:(nonnull UIStoryboardSegue *)segue sender:(nullable id)sender {
//    if ([segue.identifier isEqualToString:@"setDetailSegue"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        ClassSetDetailTableViewController *detailViewController = segue.destinationViewController;
//        [SetsController sharedInstance].termsClassesDetailArray = self.termsClassesDetailArray;
//        NSLog(@"%@", self.termsClassesDetailArray);
//        
//    }
//}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
