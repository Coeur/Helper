//
//  NSObject+As.h
//  Cœur
//
//  Created by Antoine Cœur on 24/01/2014.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (As)

// warning: even if class is mutable, return value might be immutable
// so you should -mutableCopy the result if needed

- (instancetype)as:(Class)class;

// NSArray, NSSet, NSOrderedSet
- (instancetype)as:(Class)class of:(Class)ofClass;

@end
