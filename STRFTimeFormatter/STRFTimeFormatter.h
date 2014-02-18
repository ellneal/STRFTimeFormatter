//
//  STRFTimeFormatter.h
//  STRFTimeFormatter
//
//  Created by Elliot Neal on 18/02/2014.
//  Copyright (c) 2014 emdentec. All rights reserved.
//


@interface STRFTimeFormatter : NSObject


///  ------------------------
///  @name Converting Objects
///  ------------------------

/**
 *  @abstract Returns a date representation of a given string interpreted via `strptime_l(3)` using the receiver’s current settings.
 *
 *  @param string The string to parse.
 *
 *  @return A date representation of *string* interpreted via `strptime_l(3)` using the receiver’s current settings. If `dateFromString:` can not parse the string, returns `nil`.
 */
- (NSDate *)dateFromString:(NSString *)string;

/**
 *  @abstract Returns a string representation of a given date formatted via `strftime_l(3)` using the receiver’s current settings.
 *
 *  @param date The date to format.
 *
 *  @return A string representation of *date* formatted via `strftime_l(3)` using the receiver’s current settings.
 */
- (NSString *)stringFromDate:(NSDate *)date;


///  ----------------------
///  @name Managing Formats
///  ----------------------

/**
 *  @abstract Returns the format string that will be used by `strftime_l(3)` and `strptime_l(3)`.
 *
 *  @return The format string that will be used by `strftime_l(3)` and `strptime_l(3)`.
 *
 *  @see -setFormatString:
 */
- (NSString *)formatString;

/**
 *  @abstract Sets the format string that will be used by `strftime_l(3)` and `strptime_l(3)`.
 *
 *  @param formatString The format string that will be used by `strftime_l(3)` and `strptime_l(3)`.
 *
 *  @discussion See the [`strftime` man page](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man3/strftime.3.html) for a list of available conversion specifiers. The default value is `%Y-%m-%dT%H:%M:%S%z`.
 *  
 *  Internally this value is stored as a `const char *`.
 *
 *  @see -formatString
 */
- (void)setFormatString:(NSString *)formatString;

@end
