//
//  ResultTableViewController.m
//  MathProblem
//
//  Created by Rajesh on 7/24/15.
//  Copyright (c) 2015 Org. All rights reserved.
//

#import "ResultTableViewController.h"

typedef void (^completionBlock)(NSString *strValue);



@interface ResultTableViewController ()

@property(nonatomic,strong)NSMutableArray *arrResult;

@end

@implementation ResultTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrResult = [NSMutableArray array];
    completionBlock blockExecution =  ^(NSString *strValue){
        [_arrResult addObject:strValue];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_arrResult.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
    };
    [self getFactorialNumbersBelow:_m completion:blockExecution];
}

- (void)getFactorialNumbersBelow:(unsigned long)mValue completion:(completionBlock)completion
{
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 1; i <= mValue; i++)
        {
            unsigned long factorial = 1;
            unsigned long iteration = 1;
            for (int j = 1; j <=i; j++)
            {
                iteration = j;
               factorial =  factorial * j;
            }
            
            if (factorial > mValue)
            {
                return;
            }
            else
            {
                dispatch_async( dispatch_get_main_queue(), ^{
                    if (completion) completion([NSString stringWithFormat:@" %ld!    =   %ld",iteration,factorial]);
                });
            }
        }
        
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arrResult count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"resuldCellID" forIndexPath:indexPath];
    [cell.textLabel setText:[_arrResult objectAtIndex:indexPath.row]];
    return cell;
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
