//
//  ViewController.h
//  AssignmentExpenses
//
//  Created by Rajesh on 18/12/15.
//  Copyright © 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *email;

@property (strong, nonatomic) IBOutlet UITextField *password;
- (IBAction)login:(id)sender;
- (IBAction)signUp:(id)sender;
@property NSMutableDictionary *rootDictionary;
@end

