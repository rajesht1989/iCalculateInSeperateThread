//
//  ViewController.m
//  MathProblem
//
//  Created by Rajesh on 7/24/15.
//  Copyright (c) 2015 Org. All rights reserved.
//

#import "ViewController.h"
#import "ResultTableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ResultTableViewController *resultController = segue.destinationViewController;
    [resultController setM:[_textField.text longLongValue]];
}

@end
