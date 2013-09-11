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

#import <Foundation/Foundation.h>

//

#define CCZero          0
#define CCOne           1

//------------------------------------------------------------------------------
// CCAssert macros
//------------------------------------------------------------------------------

// TODO: Look into checking if debugger is present, rather than checking a preprocessor flag
// See these links for more info on how to do that.
//      https://github.com/domesticcatsoftware/DCIntrospect/blob/master/DCIntrospect/DCIntrospect.m
//      http://developer.apple.com/library/mac/#qa/qa1361/_index.html
//      http://stackoverflow.com/questions/11837608/objective-c-how-to-programmatically-stop-execution-for-debugging-while-allowi

#ifdef DEBUG

//------------------------------------------------------------------------------

// logs a message to the console ... Cocos2D style
#define CCLog( format, ... )                                                                    \
    do {                                                                                        \
        NSLog( ( @"%s [Line %d] " format ), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__ );     \
    } while (0)

//------------------------------------------------------------------------------

// breaks program execution if condition is false
// it is strongly adviced to use this function over NSAssert
#define CCAssert( condition, desc, ... )                                        \
    do {                                                                        \
        if ( ( condition ) == NO ) {                                            \
            CCLog( #desc, ##__VA_ARGS__ );                                       \
            kill( getpid( ), SIGABRT );                                         \
            [ NSException raise:@"CCAssertException" format:@"CCAssert" ];      \
        }                                                                       \
    } while (0)

//------------------------------------------------------------------------------

// breaks program execution if condition is false, with the option to continue 
// it is strongly adviced to use this function over NSAssert
#define CCAssertWithContinue( condition, desc, ... )                            \
    do {                                                                        \
        if ( ( condition ) == NO ) {                                            \
            CCLog( #desc, ##__VA_ARGS__ );                                       \
            ASSEMBLY_BREAK;                                                     \
        }                                                                       \
    } while (0)

//------------------------------------------------------------------------------
// CCAssert Helper Code
// (dependent on device architecture)
//------------------------------------------------------------------------------
#if TARGET_CPU_ARM                          
// Assembly code for iDevices
//------------------------------------------------------------------------------
#define ASSEMBLY_BREAK __asm__ __volatile__ (                                                                                   \
                                                                            /* instructions                     */              \
                                            "mov r0, %0     \n\t"           /*                                  */              \
                                            "mov r1, %1     \n\t"           /*                                  */              \
                                            "mov r12, %2    \n\t"           /*                                  */              \
                                            "swi 128        \n  "           /*                                  */              \
                                            "swi 128        \n  "           /*                                  */              \
                                                                                                                                \
                                            :                               /* output operands                  */              \
                                                                            /* (nothing)                        */              \
                                            :                                                                                   \
                                                                            /* input operands                   */              \
                                            "r" (getpid ()),                /* - process id                     */              \
                                            "r" (SIGSTOP),                  /* - SIGSTOP signal                 */              \
                                            "r" (37)                        /* - syscalling kill(2)             */              \
                                                                                                                                \
                                            :                                                                                   \
                                                                            /* list of cloberred registers      */              \
                                            "r12",                          /*                                  */              \
                                            "r0",                           /*                                  */              \
                                            "r1",                           /*                                  */              \
                                            "cc"                            /*                                  */              \
                                            )

//------------------------------------------------------------------------------
#else                                       
// Assembly code for Mac
//------------------------------------------------------------------------------

#define ASSEMBLY_BREAK __asm__ __volatile__ (                                                                                   \
                                                                            /* instructions                     */              \
                                            "pushl %0       \n\t"           /*                                  */              \
                                            "pushl %1       \n\t"           /*                                  */              \
                                            "push $0        \n\t"           /*                                  */              \
                                            "movl %2, %%eax \n\t"           /*                                  */              \
                                            "int $0x80      \n\t"           /*                                  */              \
                                            "add $12, %%esp"                /*                                  */              \
                                                                                                                                \
                                            :                               /* output operands                  */              \
                                                                            /* (nothing)                        */              \
                                                                                                                                \
                                            :                               /* input operands                   */              \
                                            "g" (getpid ()),                /* - process id                     */              \
                                            "g" (SIGSTOP),                  /* - SIGSTOP signal                 */              \
                                            "n" (37)                        /* - some number                    */              \
                                                                                                                                \
                                            :                                                                                   \
                                                                            /* list of cloberred registers      */              \
                                            "eax",                          /*                                  */              \
                                            "cc"                            /*                                  */              \
                                            )

#endif

//------------------------------------------------------------------------------
#else 
/* If this is not a debug build (== it is a release build). */
//------------------------------------------------------------------------------

#define CCAssertWithContinue( condition, desc, ... )
#define CCAssert( condition, desc, ... )
#define CCLog( format, ... )

//------------------------------------------------------------------------------
#endif
//------------------------------------------------------------------------------
