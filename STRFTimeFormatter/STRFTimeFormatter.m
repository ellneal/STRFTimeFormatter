//
//  STRFTimeFormatter.m
//  STRFTimeFormatter
//
//  Created by Elliot Neal on 18/02/2014.
//  Copyright (c) 2014 emdentec. All rights reserved.
//

#import "STRFTimeFormatter.h"
#import <xlocale.h>


@interface STRFTimeFormatter () {
    const char *_formatString;
}

@end


@implementation STRFTimeFormatter


#pragma mark - Initialization

- (id)init {
    
    self = [super init];
    
    if (self) {
        _formatString = "%Y-%m-%dT%H:%M:%S%z";
    }
    
    return self;
}


#pragma mark - Conversion

- (NSDate *)dateFromString:(NSString *)string {
    
    time_t timeInterval;
    struct tm time;
    
    strptime_l([string cStringUsingEncoding:NSASCIIStringEncoding], _formatString, &time, NULL);
    
    timeInterval = mktime(&time);
    
    return [NSDate dateWithTimeIntervalSince1970:timeInterval];
}

- (NSString *)stringFromDate:(NSDate *)date {
    
    time_t timeInterval;
    struct tm time;
    char buffer[80];
    
    timeInterval = [date timeIntervalSince1970];
    time = *localtime(&timeInterval);
    
    strftime_l(buffer, sizeof(buffer), _formatString, &time, NULL);
    
    return [NSString stringWithCString:buffer encoding:NSASCIIStringEncoding];
}


#pragma mark - Format String

- (NSString *)formatString {
    
    return [NSString stringWithCString:_formatString encoding:NSASCIIStringEncoding];
}

- (void)setFormatString:(NSString *)formatString {
    
    _formatString = [formatString cStringUsingEncoding:NSASCIIStringEncoding];
}

@end
