//
//  Greetings.m
//  RandomGreeting
//
//  Created by Iain Kirkpatrick on 16/07/14.
//  Copyright (c) 2014 Iain Kirkpatrick. All rights reserved.
//

#import "Greetings.h"

@interface Greetings()

@property (strong, nonatomic) NSArray *greetingArray;
@property (strong, nonatomic) NSMutableDictionary *greetingCount;

@end

@implementation Greetings

//custom getter for greetingArray to init array
- (NSArray *)greetingArray {
    if (!_greetingArray) {
        _greetingArray = [[NSArray alloc] initWithObjects:@"Hello!",@"Salut!",@"YoBo!",@"Ciao!",@"Hallo!",@"Czesc!",@"Hola!",@"Ni hao!",@"Kon'nichiwa!",nil];
        
    }
    return _greetingArray;
}

//custom getter for greetingCount to init dict
- (NSMutableDictionary *)greetingCount {
    if (!_greetingCount) {
        _greetingCount = [[NSMutableDictionary alloc] init];
    }
    return _greetingCount;
}


- (void)addToGreetingCount:(NSString *)greeting {
    //check if greeting is in the dict
    //if so, increase count by 1
    //if not, add greeting key to the dict
    if ([self.greetingCount objectForKey:greeting] != nil) {
        //can't increment NSNumber, so must get as int, increment, then back to NSNumber
        NSNumber *newCount = [NSNumber numberWithInt:[[self.greetingCount objectForKey:greeting] intValue] + 1];
                              
        [self.greetingCount setObject:newCount forKey:greeting];
        
        NSLog(@"Key did exist, count now %@", newCount);
    } else {
        [self.greetingCount setObject:@1 forKey:greeting];
        NSLog(@"Key did not exist, now added");
    };
}

//pick a greeting at a random index from the array
- (NSString *)getRandomGreeting {
    NSString *greeting = [self.greetingArray objectAtIndex:arc4random() % [self.greetingArray count]];
    
    //add to greetingCount
    [self addToGreetingCount:greeting];
    
    return greeting;
}

@end
