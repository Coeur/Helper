//
//  CoeurMacros.h
//  Cœur
//
//  Created by Antoine Cœur on 13/08/13.
//  Copyright (c) 2013 Cœur. All rights reserved.
//

#ifndef Coeur_Macros_h
#define Coeur_Macros_h


#define UI_USER_INTERFACE_IDIOM_PHONE()   ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
#define UI_USER_INTERFACE_IDIOM_PAD()     ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
#define UI_USER_INTERFACE_IDIOM_PHONE_3_5_INCH() (UI_USER_INTERFACE_IDIOM_PHONE() && [UIScreen mainScreen].bounds.size.height < 568.f)
#define UI_USER_INTERFACE_IDIOM_PHONE_4_INCH() (UI_USER_INTERFACE_IDIOM_PHONE() && [UIScreen mainScreen].bounds.size.height == 568.f)
#define UI_USER_INTERFACE_NON_RETINA()    ([UIScreen mainScreen].scale < 2.f)
#define UI_USER_INTERFACE_RETINA()        ([UIScreen mainScreen].scale == 2.f)


#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[UIDevice currentDevice].systemVersion compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[UIDevice currentDevice].systemVersion compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[UIDevice currentDevice].systemVersion compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[UIDevice currentDevice].systemVersion compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[UIDevice currentDevice].systemVersion compare:v options:NSNumericSearch] != NSOrderedDescending)


#if DEBUG
    #define NSLog(...) NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])
#else
    #define NSLog(...)
#endif


#endif

