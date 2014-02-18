//
//  STRFTimeFormatter.h
//  STRFTimeFormatter
//
//  Created by Elliot Neal on 18/02/2014.
//  Copyright (c) 2014 emdentec. All rights reserved.
//


@interface STRFTimeFormatter : NSObject


- (NSString *)formatString;
- (void)setFormatString:(NSString *)formatString;

- (NSString *)stringFromDate:(NSDate *)date;
- (NSDate *)dateFromString:(NSString *)string;

@end
