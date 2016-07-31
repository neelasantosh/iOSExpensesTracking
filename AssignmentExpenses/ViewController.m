//
//  ViewController.m
//  AssignmentExpenses
//
//  Created by Rajesh on 18/12/15.
//  Copyright © 2015 CDAC. All rights reserved.
//

#import "ViewController.h"
#import "ExpenseTableViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize email,password,rootDictionary;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    NSString *em = email.text;
    NSString *pwd = password.text;
    
    
    NSString *str = [NSString stringWithFormat:@"http://192.168.76.124:82/ExpenseWeb/login.php?email=%@&password=%@",em,pwd];
    
    NSURL *url = [NSURL URLWithString:str];
    NSLog(@"%@",str);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         NSError *jsonError;
         rootDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&jsonError];
         
         NSLog(@"Data:%@",rootDictionary);
         
         ExpenseTableViewController *exp = [self.storyboard instantiateViewControllerWithIdentifier:@"table_expense"];
         
         [self.navigationController pushViewController:exp animated:true];
         
     }];

}

- (IBAction)signUp:(id)sender {
    
    ExpenseTableViewController *exp1 = [self.storyboard instantiateViewControllerWithIdentifier:@"register"];
    
    [self.navigationController pushViewController:exp1 animated:true];
}


@end
