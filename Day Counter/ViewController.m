//
//  ViewController.m
//  Day Counter
//
//  Created by Jay Versluis on 24/03/2018.
//  Copyright © 2018 Pinkstone Pictures LLC. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *daysLabel;
@property (strong, nonatomic) AppDelegate *myAppDelegate;
@end

@implementation ViewController

- (AppDelegate *)myAppDelegate {
    
    if (!_myAppDelegate) {
        _myAppDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    }
    return _myAppDelegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self populateUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)populateUI {
    
    NSDate *startDate = [self.myAppDelegate loadData];
    self.daysLabel.text = [self calculateDays:startDate];
}

- (NSString *)calculateDays:(NSDate *)startDate {
    
    // define today
    NSDate *today = [NSDate date];
    
    // normalise today
    today = [self normaliseThis:today];
    
    // define calendar and components
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitDay fromDate:startDate toDate:today options:0];
    
    NSUInteger days = [components day];
    
    return [NSString stringWithFormat:@"%lu", (unsigned long)days];
}

- (NSDate *)normaliseThis:(NSDate *)date {
    
    // create a calendar
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    // split into date components
    NSUInteger units = NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitMonth;
    NSDateComponents *components = [calendar components:units fromDate:date];
    
    // recreate date from components
    date = [calendar dateFromComponents:components];
    
    return date;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    [self populateUI];
}

@end
















