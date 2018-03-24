//
//  SettingsViewController.m
//  Day Counter
//
//  Created by Jay Versluis on 24/03/2018.
//  Copyright © 2018 Pinkstone Pictures LLC. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonPressed:(id)sender {
    
    // dismiss the view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveButtonPressed:(id)sender {
    
    // dismiss the view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
