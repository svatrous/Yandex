//
//  YandexTestsObjectTypeTest.m
//  Yandex
//
//  Created by Паша on 19.01.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EDYandexTestEx.h"

@interface YandexTestsExceptionsTest : XCTestCase

@property (strong, nonatomic) NSArray *itemsArray;

@end

@implementation YandexTestsExceptionsTest

- (void)setUp {
    [super setUp];
    
    self.itemsArray = @[[@"a" mutableCopy], @(123),[@"a" mutableCopy], [@"a" mutableCopy], [@"a" mutableCopy], [@"a" mutableCopy], [NSDate date], [@"a" mutableCopy]];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    NSLog(@"%@", self.itemsArray);
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testAsynchronousMehodForExceoptions {
    
    void (^block)() = ^(NSInteger newRevision) {
        NSLog(@"%@", self.itemsArray);
    };
    
    [EDYandexTestEx processItems:self.itemsArray revision:0 completion:block];
    
    XCTAssertNoThrow(block);
    
}

@end
