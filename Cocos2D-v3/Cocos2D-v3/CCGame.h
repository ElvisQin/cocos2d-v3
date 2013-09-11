/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2008-2010 Ricardo Quesada
 * Copyright (c) 2011 Zynga Inc.
 * Copyright (c) 2013 Lars Birkemose
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "CCGLViewController.h"
#import "CCScene.h"
#import "CCScheduler.h"

// ---------------------------------------------------------------------
// all kinds of hardcoded shit
// do NOT touch!

typedef enum {
    CCGameFPSMin                            = 1,
    CCGameFPSMax                            = 60,
} tCCGame;

// ---------------------------------------------------------------------

@interface CCGame : UIWindow < GLKViewControllerDelegate >

// ---------------------------------------------------------------------
// This is the main entry point into the entire game application
// The most common properties are
//
// game.touch
// game.scheduler
// game.actions
// game.message          

extern CCGame* game;

// ---------------------------------------------------------------------

@property ( weak, nonatomic, readonly ) CCScene* runningScene;
@property ( nonatomic ) int framesPrSecond;
@property ( nonatomic, readonly ) CCScheduler* scheduler;

// ---------------------------------------------------------------------

+( id )gameWithFrame:( CGRect )frame;
+( id )gameWithFullScreen;
-( id )initWithFrame:( CGRect )frame;

-( void )runWithScene:( CCScene* )scene;

// ---------------------------------------------------------------------

@end












































