
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

#import "CCMacro.h"
#import "CCTimer.h"
#import "CCGame.h"

// ---------------------------------------------------------------------

CCScheduler* gTimerScheduler = nil;                                     // global scheduler for timers

// ---------------------------------------------------------------------
#pragma mark - CCTimer
// ---------------------------------------------------------------------

@implementation CCTimer {
    CCSchedulerEntry*   _entry;
    id                  _target;
    SEL                 _selector;
}

// ---------------------------------------------------------------------
#pragma mark - create and destroy
// ---------------------------------------------------------------------

+( id )timerWithSelector:( SEL )selector forTarget:( id )target {
    return( [ [ self alloc ] initWithSelector:selector forTarget:target interval:CCSchedulerEachFrame ] );
}

+( id )timerWithSelector:( SEL )selector forTarget:( id )target interval:( float )interval {
    return( [ [ self alloc ] initWithSelector:selector forTarget:target interval:interval ] );
}

-( id )initWithSelector:( SEL )selector forTarget:( id )target interval:( float )interval {
    self = [ super init ];
    CCAssert( self != nil, @"Unable to create class" );
    
    // initialize
    
    _target = target;
    _selector = selector;
    _isPaused = YES;
    _isExpired = NO;
    
    // if no timer scheduler exists, create one
    if ( gTimerScheduler == nil ) gTimerScheduler = [ CCScheduler scheduler ];
    
    // add to timer control
    _entry = [ gTimerScheduler scheduleSelector:selector forTarget:target interval:interval repeat:self.repeatCount delay:self.startDelay paused:_isPaused ];
    _entry.interval = interval;
    _entry.startDelay = CCZero;
    _entry.repeat = CCSchedulerForever;
    
    _entry.removeAfterCompletion = NO;                                  // timer are never automatically removed
    
    // done
    return( self );
}

// ---------------------------------------------------------------------

-( void )dealloc {
    // clean up
    _entry.removeAfterCompletion = YES;
    [ gTimerScheduler unscheduleSelector:_selector forTarget:_target ];
}

// ---------------------------------------------------------------------
#pragma mark - controlling
// ---------------------------------------------------------------------

-( void )start {
    [ self reset ];
    _entry.isPaused = NO;
}

-( void )stop {
    _entry.isPaused = YES;
}

-( void )resume {
    _entry.isPaused = NO;
}

-( void )reset {
    [ _entry reset ];
    _entry.isExpired = NO;
}

// ---------------------------------------------------------------------
#pragma mark - properties
// ---------------------------------------------------------------------

-( float )interval { return( _entry.interval ); }

-( void )setInterval:( float )interval {
    CCAssert( interval >= 0, @"interval can not be negative" );
    
    // set the interval
    _entry.interval = interval;
}

// ---------------------------------------------------------------------

-( float )startDelay { return( _entry.startDelay ); }

-( void )setStartDelay:( float )startDelay {
    CCAssert( startDelay >= 0, @"startDelay can not be negative" );

    // set the start delay
    _entry.startDelay = startDelay;
}

// ---------------------------------------------------------------------

-( uint )repeatCount { return( _entry.repeat ); }

-( void )setRepeatCount:( uint )repeatCount {
    // set repeat count
    _entry.repeat = repeatCount;
}

// ---------------------------------------------------------------------

@end








































