//
//  YandexTests.m
//  YandexTests
//
//  Created by Паша on 19.01.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EDYandexTestEx.h"

@interface YandexTestsAsynchronousMethod : XCTestCase

@property (strong, nonatomic) NSArray *itemsArray;

@end

@implementation YandexTestsAsynchronousMethod

- (void)setUp {
    [super setUp];
    
    self.itemsArray = @[[@"a" mutableCopy], [@"a" mutableCopy],[@"a" mutableCopy], [@"a" mutableCopy], [@"a" mutableCopy], [@"a" mutableCopy], [@"a" mutableCopy], [@"a" mutableCopy]];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    
    NSLog(@"%@", self.itemsArray);
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testAsynchronousMehod {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"block not called"];
    
    [EDYandexTestEx processItems:self.itemsArray revision:0 completion:^(NSInteger newRevision) {
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:3
                                 handler:^(NSError *error) {
                                     if (error != nil) {
                                         XCTFail(@"timeout error: %@", error);
                                     }
                                 }];
    
}



@end
