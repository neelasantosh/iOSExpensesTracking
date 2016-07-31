//
//  NewExpenseViewController.m
//  AssignmentExpenses
//
//  Created by Rajesh on 18/12/15.
//  Copyright © 2015 CDAC. All rights reserved.
//

#import "NewExpenseViewController.h"
#import "ViewController.h"
@interface NewExpenseViewController ()

@end

@implementation NewExpenseViewController
@synthesize regId,itemName,price,category,date,remarks,dicAdd,dic,reg;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    self.navigationItem.title=@"New Expense";
    
    UIBarButtonItem *buttonAdd=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(AddExpenseToList)];
    self.navigationItem.rightBarButtonItem=buttonAdd;
    
    ViewController *con=[[self.navigationController viewControllers] objectAtIndex:0];
    
    dic=con.rootDictionary;
    
    reg=[[dic objectForKey:@"data"] objectForKey:@"reg_id"];
    regId.text=[NSString stringWithFormat:@" Reg Id : %@",reg];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)AddExpenseToList
{
    
    NSString *str=[NSString stringWithFormat:@"http://192.168.76.124:82/ExpenseWeb/add_expense.php?reg_id=%@&item_name=%@&price=%@&category=%@&date=%@&remark=%@",reg,itemName.text,price.text,category.text,date.text,remarks.text];
    NSLog(@" url : %@",str);
    NSURL *urlLogIn=[NSURL URLWithString:str];
    
    NSURLRequest *req=[NSURLRequest requestWithURL:urlLogIn];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        {
            NSError *parseError;
            dicAdd=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&parseError];
            NSString *result=[dicAdd objectForKey:@"message"];
            
            if([result isEqualToString:@"success"])
            {
                regId.text = @"";
                price.text = @"";
                category.text = @"";
                date.text =@"";
                remarks.text = @"";
                
                
            }
            
        }
        
    }];
    
    
    
}


@end
