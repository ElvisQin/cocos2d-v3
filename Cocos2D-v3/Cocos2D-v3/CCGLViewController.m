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

#import "Cocos2D-v3.h"

// ---------------------------------------------------------------------

@implementation CCGLViewController

+( id )viewController {
    return( [ [ self alloc ] init ] );
}

// ---------------------------------------------------------------------

-( id )init {
    self = [ super init ];
    CCAssert( self != nil, @"Unable to create class" );
    
    CCLog( @"Cocos2D v.%d.%d.%d-%@", COCOS2D_VERSION / 0x10000 & 0xFF, COCOS2D_VERSION / 0x100 & 0xFF, COCOS2D_VERSION & 0xFF, COCOS2D_BUILD );
    
    // initialize
    
    // get an ES2 openGL context
    _context = [ [ EAGLContext alloc ] initWithAPI:kEAGLRenderingAPIOpenGLES2 ];
    CCAssert( _context != nil, @"Unable to create openGL context" );
    
    // set view properties
    GLKView* view = ( GLKView* )self.view;
    view.context = _context;
    
    // set up defaults
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
        
    // done
    return( self );
}

// ---------------------------------------------------------------------

@end








































