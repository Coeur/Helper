//
//  NSObject+As.m
//  Cœur
//
//  Created by Antoine Cœur on 24/01/2014.
//
//

#import "NSObject+As.h"

@implementation NSObject (As)

- (instancetype)as:(Class)class
{
    return [self isKindOfClass:class] ? self : nil;
}

- (instancetype)as:(Class)class of:(Class)ofClass
{
    id this = [self as:class];
    if (this)
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self != nil && self isKindOfClass: %@", ofClass];
        if ([class isSubclassOfClass:[NSArray self]])
        {
            this = [this filteredArrayUsingPredicate:predicate];
        }
        else if ([class isSubclassOfClass:[NSSet self]])
        {
            this = [this filteredSetUsingPredicate:predicate];
        }
        else if ([class isSubclassOfClass:[NSOrderedSet self]])
        {
            this = [this filteredOrderedSetUsingPredicate:predicate];
        }
        else
        {
            this = nil;
        }
    }
    return this;
}

@end
