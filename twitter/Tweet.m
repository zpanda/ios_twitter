//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (NSString *)text
{
    return [self.data valueOrNilForKeyPath:@"text"];
}

- (NSString *)username
{
    return [self.data valueOrNilForKeyPath:@"user.name"];
}

- (NSString *)twitterhandle
{
    NSString *screenName = [self.data valueOrNilForKeyPath:@"user.screen_name"];
    return [NSString stringWithFormat:@"@%s", screenName.UTF8String];
}

- (NSString *)timestamp
{
    NSString *createdAt = [self.data valueOrNilForKeyPath:@"created_at"];
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    
    [dateFormater setDateFormat:@"EEE MMM d HH:mm:ss +0000 yyyy"];
    NSDate *currentDate = [dateFormater dateFromString:createdAt];

    [dateFormater setDateFormat:@"MMM d  HH:mm:ss"];
    NSString *convertedDateString = [dateFormater stringFromDate:currentDate];
    return convertedDateString;
}

- (NSString *)profileURL
{
    return [self.data valueOrNilForKeyPath:@"user.profile_image_url"];
}



+ (NSMutableArray *)tweetsWithArray:(NSArray *)array
{
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
