//
//  STRFTimeFormatter.m
//  STRFTimeFormatter
//
//  Created by Elliot Neal on 18/02/2014.
//  Copyright (c) 2014 emdentec. All rights reserved.
//

#import "STRFTimeFormatter.h"


@implementation STRFTimeFormatter


#pragma mark - Lazy Properties

- (NSString *)formatString {
    
    if (_formatString != nil) {
        return _formatString;
    }
    
    _formatString = [@"%Y-%m-%dT%H:%M:%S%z" copy];
    
    return _formatString;
}

@end
