//
//  ForwardSelector.m
//  Helper
//
//  Created by Antoine Cœur on 14/02/2014.
//  Copyright (c) 2014 Antoine Cœur. All rights reserved.
//

#import "ForwardSelector.h"


@implementation NSObject (invokeSelector)

- (void *)invokeSelector:(SEL)selector withArguments:(void *)firstArgument, ...
{
    NSMethodSignature *signature = [self methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:selector];
    
    va_list args;
    va_start(args, firstArgument);
    NSUInteger numberOfArgs = [signature numberOfArguments];
    void *arg = firstArgument;
    for (NSUInteger i = 2; i < numberOfArgs; i++)
    {
        [invocation setArgument:&arg atIndex:i];
        if (i + 1 < numberOfArgs)
            arg = va_arg(args, void *);
    }
    va_end(args);
    
    [invocation invokeWithTarget:self];
    
    switch ([signature methodReturnType][0]) {
        case 'v': // void
        {
            return nil;
        }
        default:
        {
            void *pointer;
            [invocation getReturnValue:&pointer];
            return pointer;
        }
    }
}

- (id)invokeSelector:(SEL)selector withObjects:(id)firstObject, ...
{
    NSMethodSignature *signature = [self methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:selector];
    
    va_list args;
    va_start(args, firstObject);
    NSUInteger numberOfArgs = [signature numberOfArguments];
    id arg = firstObject;
    for (NSUInteger i = 2; i < numberOfArgs; i++)
    {
        switch ([signature getArgumentTypeAtIndex:i][0]) {
            case 'B': // BOOL
            {
                BOOL boolValue = [arg boolValue];
                [invocation setArgument:&boolValue atIndex:i];
            }
                break;
            case 'C': // unsigned char
            {
                unsigned char unsignedCharValue = [arg unsignedCharValue];
                [invocation setArgument:&unsignedCharValue atIndex:i];
            }
                break;
            case 'I': // unsigned int
            {
                unsigned int unsignedIntValue = [arg unsignedIntValue];
                [invocation setArgument:&unsignedIntValue atIndex:i];
            }
                break;
            case 'L': // unsigned long
            {
                unsigned long unsignedLongValue = [arg unsignedLongValue];
                [invocation setArgument:&unsignedLongValue atIndex:i];
            }
                break;
            case 'Q': // unsigned long long
            {
                unsigned long long unsignedLongLongValue = [arg unsignedLongLongValue];
                [invocation setArgument:&unsignedLongLongValue atIndex:i];
            }
                break;
            case 'S': // unsigned short
            {
                unsigned short unsignedShortValue = [arg unsignedShortValue];
                [invocation setArgument:&unsignedShortValue atIndex:i];
            }
                break;
            case 'c': // char
            {
                char charValue = [arg charValue];
                [invocation setArgument:&charValue atIndex:i];
            }
                break;
            case 'd': // double
            {
                double doubleValue = [arg doubleValue];
                [invocation setArgument:&doubleValue atIndex:i];
            }
                break;
            case 'f': // float
            {
                float floatValue = [arg floatValue];
                [invocation setArgument:&floatValue atIndex:i];
            }
                break;
            case 'i': // int
            {
                int intValue = [arg intValue];
                [invocation setArgument:&intValue atIndex:i];
            }
                break;
            case 'l': // long
            {
                long longValue = [arg longValue];
                [invocation setArgument:&longValue atIndex:i];
            }
                break;
            case 'q': // long long
            {
                long long longLongValue = [arg longLongValue];
                [invocation setArgument:&longLongValue atIndex:i];
            }
                break;
            case 's': // short
            {
                short shortValue = [arg shortValue];
                [invocation setArgument:&shortValue atIndex:i];
            }
                break;
            case 'v': // void
                break;
            case '@': // id
            case ':': // SEL
            default:
            {
                [invocation setArgument:&arg atIndex:i];
            }
                break;
        }
        if (i + 1 < numberOfArgs)
            arg = va_arg(args, id);
    }
    va_end(args);
    
    [invocation invokeWithTarget:self];
    
    switch ([signature methodReturnType][0]) {
        case 'B': // BOOL
        {
            BOOL buffer;
            [invocation getReturnValue:&buffer];
            return [NSNumber numberWithBool:buffer];
        }
        case 'C': // unsigned char
        {
            unsigned char buffer;
            [invocation getReturnValue:&buffer];
            return [NSNumber numberWithUnsignedChar:buffer];
        }
        case 'I': // unsigned int
        {
            unsigned int buffer;
            [invocation getReturnValue:&buffer];
            return [NSNumber numberWithUnsignedInt:buffer];
        }
        case 'L': // unsigned long
        {
            unsigned long buffer;
            [invocation getReturnValue:&buffer];
            return [NSNumber numberWithUnsignedLong:buffer];
        }
        case 'Q': // unsigned long long
        {
            unsigned long long buffer;
            [invocation getReturnValue:&buffer];
            return [NSNumber numberWithUnsignedLongLong:buffer];
        }
        case 'S': // unsigned short
        {
            unsigned short buffer;
            [invocation getReturnValue:&buffer];
            return [NSNumber numberWithUnsignedShort:buffer];
        }
        case 'c': // char
        {
            char buffer;
            [invocation getReturnValue:&buffer];
            return [NSNumber numberWithChar:buffer];
        }
        case 'd': // double
        {
            double buffer;
            [invocation getReturnValue:&buffer];
            return [NSNumber numberWithDouble:buffer];
        }
        case 'f': // float
        {
            float buffer;
            [invocation getReturnValue:&buffer];
            return [NSNumber numberWithFloat:buffer];
        }
        case 'i': // int
        {
            int buffer;
            [invocation getReturnValue:&buffer];
            return [NSNumber numberWithInt:buffer];
        }
        case 'l': // long
        {
            long buffer;
            [invocation getReturnValue:&buffer];
            return [NSNumber numberWithLong:buffer];
        }
        case 'q': // long long
        {
            long long buffer;
            [invocation getReturnValue:&buffer];
            return [NSNumber numberWithLongLong:buffer];
        }
        case 's': // short
        {
            short buffer;
            [invocation getReturnValue:&buffer];
            return [NSNumber numberWithShort:buffer];
        }
        case 'v': // void
        {
            return nil;
        }
        case '@': // id
        case ':': // SEL
        default:
        {
            //void *pointer;
            //[invocation getReturnValue:&pointer];
            //return (__bridge id)pointer;
            
            __unsafe_unretained id anObject;
            [invocation getReturnValue:&anObject];
            return anObject;
        }
    }
}

@end
