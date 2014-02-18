//
//  STRFTimeFormatter.m
//  STRFTimeFormatter
//
//  Created by Elliot Neal on 18/02/2014.
//  Copyright (c) 2014 emdentec. All rights reserved.
//

#import "STRFTimeFormatter.h"


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


#pragma mark - Format String

- (NSString *)formatString {
    
    return [NSString stringWithCString:_formatString encoding:NSASCIIStringEncoding];
}

- (void)setFormatString:(NSString *)formatString {
    
    _formatString = [formatString cStringUsingEncoding:NSASCIIStringEncoding];
}

@end
