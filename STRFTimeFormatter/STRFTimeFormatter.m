//
//  STRFTimeFormatter.m
//
//  Copyright (c) 2014 emdentec (http://emdentec.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
