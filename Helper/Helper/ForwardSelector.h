//
//  ForwardSelector.h
//  Helper
//
//  Created by Antoine Cœur on 14/02/2014.
//  Copyright (c) 2014 Antoine Cœur. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (invokeSelector)

- (void *)invokeSelector:(SEL)selector withArguments:(void *)firstArgument, ...;

- (id)invokeSelector:(SEL)selector withObjects:(id)object1, ...;

@end
