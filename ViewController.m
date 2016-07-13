//
//  ViewController.m
//  HighVoltage
//
//  Created by Oliver Short on 7/13/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize inputTextField;
@synthesize segmentedControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.theTitle = @"Watts";
    [segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
}

- (IBAction)segmentAction:(UISegmentedControl *)sender {
    
    self.theTitle = [sender titleForSegmentAtIndex:sender.selectedSegmentIndex];
}

-(void) viewDidAppear:(BOOL)animated {
    
    [inputTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
