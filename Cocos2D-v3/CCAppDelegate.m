//
//  CCAppDelegate.m
//  Cocos2D-v3
//
//  Created by Lars Birkemose on 7/23/13.
//  Copyright (c) 2013 Lars Birkemose. All rights reserved.
//
// ---------------------------------------------------------------------

#import "CCAppDelegate.h"
#import "CCViewController.h"
#import "Cocos2D-v3.h"

// ---------------------------------------------------------------------

@implementation CCAppDelegate

// ---------------------------------------------------------------------
// application entry point

-( BOOL )application:( UIApplication* )application didFinishLaunchingWithOptions:( NSDictionary* )launchOptions {
    
    // The framework declares one global variable, called "game"
    
    // create the game to occupy entire screen
    game = [ CCGame gameWithFullScreen ];
    self.window = game;
    

    
    
    
    CCLog( @"Setup complete" );
    CCLog( @"-------------------------------------" );

    [ game.scheduler scheduleSelector:@selector( stopUpdate: ) forTarget:self interval:0 repeat:22 delay:2 paused:NO ];
    
    [ game.scheduler scheduleSelector:@selector( startUpdate: ) forTarget:self interval:0 repeat:1 delay:1 paused:NO ];
    
    
    /*
    
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        //self.viewController = [[CCViewController alloc] initWithNibName:@"CCViewController_iPhone" bundle:nil];
    } else {
        //self.viewController = [[CCViewController alloc] initWithNibName:@"CCViewController_iPad" bundle:nil];
    }
    self.viewController = [ [ CCViewController alloc] init ];
     self.window.rootViewController = self.viewController;
    
    
    [self.window makeKeyAndVisible];
    
    */
     
    
    return YES;
}

// ---------------------------------------------------------------------

-( void )startUpdate:( NSTimeInterval )ellapsed {
    
    NSLog( @"start" );
    [ game.scheduler scheduleUpdateForTarget:self ];
        
}

-( void )update:( NSTimeInterval )ellapsed {

    NSLog( @"update %.6f", ellapsed );

}

-( void )stopUpdate:( NSTimeInterval )ellapsed {
    
    NSLog( @"stop" );

    [ game.scheduler unscheduleAllSelectorsForTarget:self ];

}

// ---------------------------------------------------------------------

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

// ---------------------------------------------------------------------

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

// ---------------------------------------------------------------------

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

// ---------------------------------------------------------------------

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

// ---------------------------------------------------------------------

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

// ---------------------------------------------------------------------

-( void )touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog( @"touched" );

}

-( void )touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog( @"moved" );
}

-( void )touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog( @"ended" );
}

-( void )touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog( @"cancelled" );
}

@end


















































