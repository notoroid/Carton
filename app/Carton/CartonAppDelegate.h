//
//  CartonAppDelegate.h
//  Carton
//
//  Created by Kaname Noto on 11/05/23.
//  Copyright 2011 Irimasu Densan Planning. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CartonViewController;

@interface CartonAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CartonViewController *viewController;

@end
