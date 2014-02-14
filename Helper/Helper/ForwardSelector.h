//
//  ForwardSelector.h
//  Helper
//
//  Created by Antoine Cœur on 14/02/2014.
//  Copyright (c) 2014 Antoine Cœur. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ForwardSelector : NSObject

- (void)invokeSelector:(SEL)selector withTarget:(id<NSObject>)target number:(NSNumber*)number type:(char)type;

@end
