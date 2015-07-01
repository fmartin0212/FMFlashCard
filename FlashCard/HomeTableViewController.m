//
//  HomeTableViewController.m
//  FlashCard
//
//  Created by Frank Martin Jr  on 3/10/15.
//  Copyright (c) 2015 Frank Martin Jr . All rights reserved.
//

#import "HomeTableViewController.h"
#import <Quizlet-iOS/Quizlet.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import <FontAwesomeKit/FontAwesomeKit.h>
#import "SetsAndClassesTableViewController.h"
@interface HomeTableViewController ()
@property (strong, nonatomic) IBOutlet UILabel *customIconLabel;
@property (strong, nonatomic) IBOutlet UILabel *customTitleLabel;


@end

@implementation HomeTableViewController
int authd;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"home";


    self.tableView.tableFooterView = [UIView new];
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

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
     // Configure the cell...
    if (indexPath.row == 0) {
        cell.detailTextLabel.text = @"wristlet";
        cell.textLabel.text = @"";
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    if (indexPath.row == 1) {
        cell.detailTextLabel.text = @"review";
        FAKFoundationIcons *customPencilIcon = [FAKFoundationIcons pencilIconWithSize:30];
        cell.textLabel.attributedText = customPencilIcon.attributedString;
    }
    
    if (indexPath.row == 2) {
        cell.detailTextLabel.text = @"import";
        FAKFoundationIcons *customDownArrowIcon = [FAKFoundationIcons arrowDownIconWithSize:30];
        cell.textLabel.attributedText = customDownArrowIcon.attributedString;
    }
 

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 1) {
        [[SetsController sharedInstance] getUserSets];
        [[SetsController sharedInstance] getUserClasses];
        [self performSegueWithIdentifier:@"setsAndClassesSegue" sender:self];
    }

    if (indexPath.row == 2) {
        if (authd == 1) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Already imported" message:@"You have already imported your quizlet flashcards" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
            [alert show];

        } else if (authd == 0) {
            // Authorization
            [[Quizlet sharedQuizlet] authorize:^(void) {
                NSLog(@"User was authorized");
                authd = 1;
            } failure:^(NSError *error) {
                NSLog(@"User wasn't authorized");
            }];
        }
    }
}

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
