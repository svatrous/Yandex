//
//  EDThreadSafeDictionary.m
//  Yandex
//
//  Created by Паша on 19.01.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import "EDThreadSafeDictionary.h"

@interface EDThreadSafeDictionary () {
    dispatch_queue_t _queue;
}

@property (strong, nonatomic) NSDictionary *dictionary;

@end

@implementation EDThreadSafeDictionary

#pragma mark - Instantiation
- (instancetype) init {
    
    self = [super init];
    
    if (self) {
        
        self.dictionary = @{};
        
        _queue = dispatch_queue_create("threadSafeDictionary", NULL);
        
    }
    return self;
}

#pragma mark - Public Methods
- (NSUInteger)count {

    __block NSUInteger count;
    
    dispatch_sync(_queue, ^{
        
        count = [self.dictionary count];
        
    });
    return count;
}

- (id)objectForKey:(id)aKey {

    __block id object = nil;
    
    dispatch_sync(_queue, ^{
        
        if (aKey) {
            
            object = self.dictionary[aKey];
            
        }
        
    });
    
    return object;
}

- (void) removeAllObjects {

    dispatch_barrier_async(_queue, ^{
        
        self.dictionary = @{};
        
    });
    
}

- (void) setObject:(id)object forKey:(id)aKey {

    dispatch_barrier_async(_queue, ^{
        
        NSMutableDictionary *mutableDictionary = [self.dictionary mutableCopy];
        
        if (!aKey) {
            
            return;
            
        }
        
        if (object == nil) {
            
            [mutableDictionary removeObjectForKey:aKey];
            
        }
        else {
            
            mutableDictionary[aKey] = object;
            
        }
        
        self.dictionary = [mutableDictionary copy];
        
    });
}


@end
