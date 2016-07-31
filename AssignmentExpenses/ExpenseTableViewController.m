//
//  ExpenseTableViewController.m
//  AssignmentExpenses
//
//  Created by Rajesh on 18/12/15.
//  Copyright © 2015 CDAC. All rights reserved.
//

#import "ExpenseTableViewController.h"
#import "ViewController.h"
#import "NewExpenseViewController.h"
@interface ExpenseTableViewController ()

@end

@implementation ExpenseTableViewController
@synthesize arrayData,arrayDict;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    ViewController *con=[[self.navigationController viewControllers] objectAtIndex:0];
    
    arrayDict=con.rootDictionary;
    //  NSLog(@" dic data %@",dicDta);
    NSNumber *regId=[[arrayDict objectForKey:@"data"] objectForKey:@"reg_id"];
    
    NSNumber *name=[[arrayDict objectForKey:@"data"] objectForKey:@"name"];
    
    // NSLog(@" id : %@",regId);
    NSString *str=[NSString stringWithFormat:@"http://192.168.76.124:82/ExpenseWeb/getall_expense.php?reg_id=%@",regId];
    //  NSLog(@" url : %@",str);
    NSURL *urlLogIn=[NSURL URLWithString:str];
    
    NSURLRequest *req=[NSURLRequest requestWithURL:urlLogIn];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        {
            NSError *parseError;
            arrayData=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&parseError];
            [self.tableView reloadData];
        }
        //   NSLog(@"%@",arrayData);
        
    }];
    
    
    self.navigationItem.title=[NSString stringWithFormat:@"Expense List(%@)",name];
    
    UIBarButtonItem *buttonAdd=[[UIBarButtonItem alloc]initWithTitle:@"Add Expense" style:UIBarButtonItemStylePlain target:self action:@selector(showAddExpenseController)];
    self.navigationItem.rightBarButtonItem=buttonAdd;
    
    
}
    
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return arrayData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    NSString *itemName=[[arrayData objectAtIndex:indexPath.row] objectForKey:@"item_name"];
    
    NSString *itemprice=[[arrayData objectAtIndex:indexPath.row] objectForKey:@"price"];
    
    NSString *itemDate=[[arrayData objectAtIndex:indexPath.row] objectForKey:@"date"];
    
    NSString *str=[NSString stringWithFormat:@"%@  %@",itemprice,itemDate];
    cell.textLabel.text=itemName;
    cell.detailTextLabel.text=str;
    return cell;
}

-(void)showAddExpenseController
{
    NewExpenseViewController *newExp=[self.storyboard instantiateViewControllerWithIdentifier:@"new_expense"];
    [self.navigationController pushViewController:newExp animated:true];
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
