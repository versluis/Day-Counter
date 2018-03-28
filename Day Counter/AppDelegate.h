//
//  AppDelegate.h
//  Day Counter
//
//  Created by Jay Versluis on 24/03/2018.
//  Copyright © 2018 Pinkstone Pictures LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

- (NSDate *)loadData;
- (void)saveData:(NSDate *)date;

@property (strong, nonatomic) UIWindow *window;

@end

