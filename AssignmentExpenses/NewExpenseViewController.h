//
//  NewExpenseViewController.h
//  AssignmentExpenses
//
//  Created by Rajesh on 18/12/15.
//  Copyright © 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewExpenseViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *regId;

@property (strong, nonatomic) IBOutlet UITextField *itemName;

@property (strong, nonatomic) IBOutlet UITextField *price;
@property (strong, nonatomic) IBOutlet UITextField *category;
@property (strong, nonatomic) IBOutlet UITextField *date;
@property (strong, nonatomic) IBOutlet UITextField *remarks;

@property NSMutableDictionary *dic,*dicAdd;
@property NSNumber *reg;
-(void)AddExpenseToList;
@end
