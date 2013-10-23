//
//  Tweet.h
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : RestObject

@property (nonatomic, strong, readonly) NSString *text;
@property (nonatomic, strong, readonly) NSString *username;
@property (nonatomic, strong, readonly) NSString *twitterhandle;
@property (nonatomic, strong, readonly) NSString *timestamp;
@property (nonatomic, strong, readonly) NSString *profileURL;


+ (NSMutableArray *)tweetsWithArray:(NSArray *)array;

@end
