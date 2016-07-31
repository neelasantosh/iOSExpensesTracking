//
//  RegisterViewController.m
//  AssignmentExpenses
//
//  Created by Rajesh on 18/12/15.
//  Copyright © 2015 CDAC. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize name,address,contact,email,password,dicReg;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"New Expense";
    
    UIBarButtonItem *buttonAdd=[[UIBarButtonItem alloc]initWithTitle:@"Register" style:UIBarButtonItemStylePlain target:self action:@selector(regToSignUp)];
    self.navigationItem.rightBarButtonItem=buttonAdd;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)regToSignUp
{
    NSString *str=[NSString stringWithFormat:@"http://192.168.76.124:82/ExpenseWeb/registration.php?name=%@&address=%@&contact=%@&email=%@&password=%@",name.text,address.text,contact.text,email.text,password.text];
    NSLog(@" url : %@",str);
    NSURL *urlReg=[NSURL URLWithString:str];
    
    NSURLRequest *req=[NSURLRequest requestWithURL:urlReg];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        {
            NSError *parseError;
            dicReg=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&parseError];
            NSString *result=[dicReg objectForKey:@"message"];
            
            if([result isEqualToString:@"success"])
            {
                NSLog(@"Register");
                name.text = @"";
                address.text =@"";
                contact.text =@"";
                email.text =@"";
                password.text=@"";
                
            }
            else
            {
                NSLog(@"Error");
            }
            
        }
        
    }];

}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
