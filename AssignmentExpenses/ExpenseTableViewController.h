//
//  ExpenseTableViewController.h
//  AssignmentExpenses
//
//  Created by Rajesh on 18/12/15.
//  Copyright © 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpenseTableViewController : UITableViewController
@property NSMutableDictionary *arrayDict;
@property NSMutableArray *arrayData;
-(void)showAddExpenseController;
@end
