//
//  YandexTestsSixthExTest.m
//  Yandex
//
//  Created by Паша on 19.01.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface YandexTestsSixthExTest : XCTestCase {
    char array[256];
}

@end

@implementation YandexTestsSixthExTest

- (void)setUp {
    [super setUp];
    
    for (int i=0;i<400;i++) {
        array[i] = 's';
    }
    
    gen_random(array, 1000);
    
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

char mostFrequentCharacter(char* str, int size) {
    
    if (size < 0) {
        return '\0';
    }
    
    if (size < 3) {
        if (size == 0) {
            return '\0';
        }
        else
            if (size == 1||size == 2) {
                return str[0];
            }

    }
    
    int halfSize = size/2;
    int *firstLetters = calloc(256, sizeof(int));
    int *secondLetters = calloc(256, sizeof(int));
    
    dispatch_queue_t firstQueue = dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t secondQueue = dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, firstQueue, ^{
        
        for (int i = 0; i < halfSize; ++i) {
            firstLetters[ str[i] ]++;
        }
        
    });
    
    dispatch_group_async(group, secondQueue, ^{
        
        for (int i = halfSize; i < size; ++i) {
            secondLetters[ str[i] ]++;
        }
        
    });
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    int count = 0;
    
    char character = '\0';
    
    for (int i = 0; i < 256; ++i) {
        
        int characterCount = (firstLetters[i] + secondLetters[i]);
        
        if (count < characterCount) {
            count = characterCount;
            character = i;
        }
        
    }
    
    return character;
    
}

void gen_random(char *s, const int len) {
    static const char alphanum[] = "abcdefghijklmnopqrstuvwxyz";
    
    for (int i = len/2; i < len; ++i) {
        s[i] = alphanum[rand() % (sizeof(alphanum) - 1)];
    }
    
    s[len] = 0;
}

- (void) testSixthEx {

        NSLog(@"Char is: %c", mostFrequentCharacter(array, 1000));

}

@end
