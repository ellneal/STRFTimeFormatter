//
//  STRFTimeFormatterTests.m
//  STRFTimeFormatterTests
//
//  Created by Elliot Neal on 17/10/2016.
//  Copyright © 2016 emdentec. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <STRFTimeFormatter/STRFTimeFormatter.h>

@interface STRFTimeFormatterTests : XCTestCase


@property (strong, nonatomic) STRFTimeFormatter *formatter;

@end

@implementation STRFTimeFormatterTests

- (void)setUp {
    [super setUp];
    
    self.formatter = [[STRFTimeFormatter alloc] init];
}

- (void)tearDown {
    
    self.formatter = nil;
    
    [super tearDown];
}

- (void)testDefaults {
    
    XCTAssertEqualObjects(@"%Y-%m-%dT%H:%M:%S%z", self.formatter.formatString);
    XCTAssertFalse([self.formatter useUniversalTimeLocale]);
}

- (void)testParsingLocalDate {
    
    STRFTimeFormatter *encoder = [[STRFTimeFormatter alloc] init];
    [encoder setUseUniversalTimeLocale:YES];
    [encoder setFormatString:@"%Y%m%d%H%M%SZ"];
    
    [self.formatter setFormatString:@"%Y%m%d%H%M%S"];
    [self.formatter setUseUniversalTimeLocale:YES];
    
    // run multiple tests here to test a few random dates
    for (int i = 0; i < 1000; i++) {
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:arc4random_uniform(UINT32_MAX)];
        XCTAssertEqualObjects([self.formatter dateFromString:[encoder stringFromDate:date]], date);
    }
}

@end
