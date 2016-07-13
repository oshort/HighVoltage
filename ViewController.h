//
//  ViewController.h
//  HighVoltage
//
//  Created by Oliver Short on 7/13/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    UITextField *inputTextField;
    UISegmentedControl *segmentedControl;
    
}

@property (strong, nonatomic) IBOutlet UITextField *inputTextField;
@property (retain, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property(strong, nonatomic) NSString *theTitle;

@end

