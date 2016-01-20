//
//  YandexTestExpectedValues.m
//  Yandex
//
//  Created by Паша on 19.01.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EDYandexTestEx.h"


@interface YandexTestExpectedValues : XCTestCase

@property (strong, nonatomic) NSArray *itemsArray;
@property (strong, nonatomic) NSArray *expectedArray;

@end

@implementation YandexTestExpectedValues

- (void)setUp {
    [super setUp];
    
    self.itemsArray = @[[@"a" mutableCopy], [@"a" mutableCopy],[@"a" mutableCopy], [@"a" mutableCopy], [@"a" mutableCopy], [@"a" mutableCopy], [@"a" mutableCopy], [@"a" mutableCopy]];
    
    self.expectedArray = @[[@"a." mutableCopy], [@"a." mutableCopy],[@"a." mutableCopy], [@"a." mutableCopy], [@"a." mutableCopy], [@"a." mutableCopy], [@"a." mutableCopy], [@"a." mutableCopy]];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testForExpectedValues {
    
    [EDYandexTestEx processItems:self.itemsArray revision:0 completion:^(NSInteger newRevision) {
        NSLog(@"items: %@ and expected: %@",self.itemsArray, self.expectedArray);
        XCTAssert([self.itemsArray isEqualToArray:self.expectedArray]);
    }];
    
}


@end
