//
//  CCAppDelegate.h
//  Cocos2D-v3
//
//  Created by Lars Birkemose on 7/23/13.
//  Copyright (c) 2013 Lars Birkemose. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CCViewController;

@interface CCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CCViewController *viewController;

@end
