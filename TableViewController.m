//
//  TableViewController.m
//  HighVoltage
//
//  Created by Oliver Short on 7/13/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"

@interface TableViewController ()

@property(strong,nonatomic) IBOutlet UILabel *wattsLabel;
@property(strong,nonatomic) IBOutlet UILabel *voltsLabel;
@property(strong,nonatomic) IBOutlet UILabel *ampsLabel;
@property(strong,nonatomic) IBOutlet UILabel *ohmsLabel;


- (IBAction)clearAllLabels:(id)sender;

@end

@implementation TableViewController

double *watts = 0;
double *volts = 0;
double *amps = 0;
double *ohms = 0;
int numbersSelected = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(IBAction)saveValues:(UIStoryboardSegue *)segue{
    
    ViewController *calculateViewController = (ViewController*)segue.sourceViewController;
    NSString *valuePicked = calculateViewController.theTitle;
    NSString *numberSent = calculateViewController.inputTextField.text;
    
    
    if ([numberSent isEqualToString:@""]) {
        numberSent = @"0";
    }
    
    else if ([valuePicked isEqualToString:@"Watts"]) {
        self.wattsLabel.text = numberSent;
        numbersSelected++;
    }
    
    else if ([valuePicked isEqualToString:@"Volts"]) {
        self.voltsLabel.text = numberSent;
        numbersSelected++;
    }
    
    else if ([valuePicked isEqualToString:@"Amps"]) {
        self.ampsLabel.text = numberSent;
        numbersSelected++;
    }
    
    else if ([valuePicked isEqualToString:@"Ohms"]) {
        self.ohmsLabel.text = numberSent;
        numbersSelected++;
    }
    
    double watts = [self.wattsLabel.text doubleValue];
    double volts = [self.voltsLabel.text doubleValue];
    double amps = [self.ampsLabel.text doubleValue];
    double ohms = [self.ohmsLabel.text doubleValue];
    
    
    if (numbersSelected == 2) {
        numbersSelected = 0;
        
        
        if (watts != 0 && volts != 0) {
            amps = watts / volts;
            ohms = (volts * volts) / watts;
        }
        
        if (watts != 0 && amps != 0) {
            volts = watts / amps;
            ohms = watts/ (amps * amps);
        }
        
        if (watts != 0 && ohms != 0) {
            volts = sqrt(watts * ohms);
            amps = sqrt(watts / ohms);
        }
        
        if (volts != 0 && amps != 0) {
            watts = volts * amps;
            ohms = volts / amps;
            
        }
        
        if (volts != 0 && ohms != 0) {
            watts = (volts * volts) / ohms;
            amps = volts / ohms;
        }
        
        if (amps != 0 && ohms != 0) {
            watts = (amps * amps) * ohms;
            volts = amps * ohms;
        }
        
        if (watts != 0) {
            NSNumber *numWatts = [NSNumber numberWithDouble:watts];
            self.wattsLabel.text = [numWatts stringValue];
        }
        
        if (volts != 0) {
            NSNumber *numVolts = [NSNumber numberWithDouble:volts];
            self.voltsLabel.text = [numVolts stringValue];
        }
        
        if (amps != 0) {
            NSNumber *numAmps = [NSNumber numberWithDouble:amps];
            self.ampsLabel.text = [numAmps stringValue];
        }
        
        if (ohms != 0) {
            NSNumber *numOhms = [NSNumber numberWithDouble:ohms];
            self.ohmsLabel.text = [numOhms stringValue];
        }
    }
}

- (IBAction)clearAllLabels:(id)sender{
        
    self.wattsLabel.text = @"0";
        
        self.voltsLabel.text = @"0";
        
        self.ampsLabel.text = @"0";
        
        self.ohmsLabel.text = @"0";
}

@end
