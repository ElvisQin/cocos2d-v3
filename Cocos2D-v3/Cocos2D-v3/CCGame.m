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

#import "CCGame.h"
#import "CCMacro.h"

// ---------------------------------------------------------------------

CCGame* game;

// ---------------------------------------------------------------------

@implementation CCGame {
    CCGLViewController*             _viewController;
}

// ---------------------------------------------------------------------

+( id )gameWithFrame:( CGRect )frame {
    return( [ [ self alloc ] initWithFrame:frame ] );
}

// ---------------------------------------------------------------------

+( id )gameWithFullScreen {
    return( [ [ self alloc ] initWithFrame:[ [ UIScreen mainScreen ] bounds ] ] );
}

// ---------------------------------------------------------------------

-( id )initWithFrame:( CGRect )frame {
    self = [ super initWithFrame:frame ];
    CCAssert( self != nil, @"Unable to create class" );
    
    // initialize
    
    // create an openGL view controller
    _viewController = [ CCGLViewController viewController ];
    _viewController.preferredFramesPerSecond = CCGameFPSMax;
    _viewController.delegate = self;
    self.rootViewController = _viewController;
    
    // create scheduler
    _scheduler = [ CCScheduler scheduler ];
    
    // reset internal data
    _runningScene = nil;

    // show and activate
    [ self makeKeyAndVisible ];

    CCLog( @"Viewport size %.0f * %.0f", self.bounds.size.width, self.bounds.size.height );

    // done
    return( self );
}

// ---------------------------------------------------------------------
// this is the main update loop, and from where everything originates
// this is the beating heart of your app
// this is it ...

-( void )glkViewControllerUpdate:( GLKViewController* )controller {
    
    // get time passed since last frame
    NSTimeInterval ellapsed = controller.timeSinceLastUpdate;
    
    // update scheduler
    [ _scheduler update:ellapsed ];
    
    // update timers
    
    // update actions

    // render scene
    
    
}

// ---------------------------------------------------------------------

-( void )runWithScene:( CCScene* )scene {
    _runningScene = scene;
}

// ---------------------------------------------------------------------
#pragma - mark properties
// ---------------------------------------------------------------------

-( int )framesPrSecond {
    return( _viewController.preferredFramesPerSecond );
}

-( void )setFramesPrSecond:( int )framesPrSecond {
    CCAssert( ( framesPrSecond >= CCGameFPSMin ) && ( framesPrSecond <= CCGameFPSMax ), @"Invalid FPS" );
    _viewController.preferredFramesPerSecond = framesPrSecond;
}

// ---------------------------------------------------------------------

-( void )sendEvent:( UIEvent* )event {

    [ super sendEvent:event ];

}

// ---------------------------------------------------------------------

@end



































