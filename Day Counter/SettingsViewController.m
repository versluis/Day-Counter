//
//  SettingsViewController.m
//  Day Counter
//
//  Created by Jay Versluis on 24/03/2018.
//  Copyright © 2018 Pinkstone Pictures LLC. All rights reserved.
//

#import "SettingsViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"

@interface SettingsViewController ()
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) AppDelegate *myAppDelegate;
@property (strong, nonatomic) NSString *dummyProperty;
@end

@implementation SettingsViewController

- (AppDelegate *)myAppDelegate {
    
    if (!_myAppDelegate) {
        _myAppDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    }
    return _myAppDelegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self populateUI];
    [self setupObserver];
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
    
    // save data
    NSDate *startDate = self.datePicker.date;
    [self.myAppDelegate saveData:startDate];
    
    // update dummy property
    self.dummyProperty = [self.datePicker.date description];
    
    // dismiss the view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)populateUI {
    
    self.datePicker.date = [self.myAppDelegate loadData];
}

- (void)setupObserver {
    
    // grab a reference to Navigation Controller
    UINavigationController *nav = (UINavigationController *)self.myAppDelegate.window.rootViewController;
    
    // grab refernece to View Controller
    ViewController *controller = (ViewController *)nav.viewControllers.lastObject;
    
    // add observer
    [self addObserver:controller forKeyPath:@"dummyProperty" options:NSKeyValueObservingOptionNew context:nil];
    
}


@end











