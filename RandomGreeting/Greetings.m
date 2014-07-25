//
//  Greetings.m
//  RandomGreeting
//
//  Created by Iain Kirkpatrick on 16/07/14.
//  Copyright (c) 2014 Iain Kirkpatrick. All rights reserved.
//

#import "Greetings.h"

@interface Greetings()

@end

@implementation Greetings

//custom getter for greetings to init dict
- (NSMutableDictionary *)greetings {
    if (!_greetings) {
        _greetings = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@0,@"Hello!", @0,@"Salut!", @0,@"YoBo!", @0,@"Ciao!", @0,@"Hallo!", @0,@"Czesc!", @0,@"Hola!", @0,@"Ni hao!", @0,@"Kon'nichiwa!", nil];
    }
    return _greetings;
}

//pick a greeting at a random index from the array
- (NSString *)getRandomGreeting {
    
    //get random greeting from greetings dict
    NSArray *keyArray = [self.greetings allKeys];
    NSString *greeting = [keyArray objectAtIndex:arc4random() % [keyArray count]];
    
    //increment number of selections for selected greeting
    NSNumber *newCount = [NSNumber numberWithInt:[[self.greetings objectForKey:greeting] intValue] + 1];
    [self.greetings setObject:newCount forKey:greeting];
    
    return greeting;
}

@end
