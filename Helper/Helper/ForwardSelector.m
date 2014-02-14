//
//  ForwardSelector.m
//  Helper
//
//  Created by Antoine Cœur on 14/02/2014.
//  Copyright (c) 2014 Antoine Cœur. All rights reserved.
//

#import "ForwardSelector.h"


@implementation ForwardSelector

- (void)invokeSelector:(SEL)selector withTarget:(id<NSObject>)target number:(NSNumber*)number type:(char)type
{
    NSMethodSignature *signature = [[target class] instanceMethodSignatureForSelector:selector];
    //NSMethodSignature *signature = [target methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature: signature];
    [invocation setTarget: target];
    [invocation setSelector: selector];
    
    switch (type) {
            
        case 'i': // int
        {
            int intValue = [number intValue];
            [invocation setArgument: &intValue atIndex: 2];
        }
        case 's': // short
        {
            short shortValue = [number shortValue];
            [invocation setArgument: &shortValue atIndex: 2];
        }
        case 'l': // long
        {
            long longValue = [number longValue];
            [invocation setArgument: &longValue atIndex: 2];
        }
        case 'q': // long long
        {
            long long longLongValue = [number longLongValue];
            [invocation setArgument: &longLongValue atIndex: 2];
        }
        case 'I': // unsigned int
        {
            unsigned int unsignedIntValue = [number unsignedIntValue];
            [invocation setArgument: &unsignedIntValue atIndex: 2];
        }
        case 'S': // unsigned short
        {
            unsigned short unsignedShortValue = [number unsignedShortValue];
            [invocation setArgument: &unsignedShortValue atIndex: 2];
        }
        case 'L': // unsigned long
        {
            unsigned long unsignedLongValue = [number unsignedLongValue];
            [invocation setArgument: &unsignedLongValue atIndex: 2];
        }
        case 'Q': // unsigned long long
        {
            unsigned long long unsignedLongLongValue = [number unsignedLongLongValue];
            [invocation setArgument: &unsignedLongLongValue atIndex: 2];
        }
        case 'f': // float
        {
            float floatValue = [number floatValue];
            [invocation setArgument: &floatValue atIndex: 2];
        }
        case 'd': // double
        {
            double doubleValue = [number doubleValue];
            [invocation setArgument: &doubleValue atIndex: 2];
        }
        case 'B': // BOOL
        {
            BOOL boolValue = [number boolValue];
            [invocation setArgument: &boolValue atIndex: 2];
        }
        case 'c': // char
        {
            char charValue = [number charValue];
            [invocation setArgument: &charValue atIndex: 2];
        }
        case 'C': // unsigned char
        {
            unsigned char unsignedCharValue = [number unsignedCharValue];
            [invocation setArgument: &unsignedCharValue atIndex: 2];
        }
        /*
        case '': // NSInteger
        {
            NSInteger integerValue = [number integerValue];
            [invocation setArgument: &integerValue atIndex: 2];
        }
        case '': // NSUInteger
        {
            NSUInteger unsignedIntegerValue = [number unsignedIntegerValue];
            [invocation setArgument: &unsignedIntegerValue atIndex: 2];
        }
        */
        case '@': // Object
        default:
            break;
    }
    
    [invocation invoke];
}

@end
