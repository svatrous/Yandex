//
//  EDThreadSafeDictionary.h
//  Yandex
//
//  Created by Паша on 19.01.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDThreadSafeDictionary : NSObject

- (NSUInteger)count;
- (id)objectForKey:(id)aKey;
- (void)removeAllObjects;
- (void)setObject:(id)object forKey:(id<NSCopying>)aKey;

@end
