//
//  AppDelegate.h
//  ColorRush
//
//  Created by Hank Zhu on 8/19/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, strong) UIWindow *window;

@end
