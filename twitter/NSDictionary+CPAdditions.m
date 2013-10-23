//
//  NSDictionary+CPAdditions.m
//  KeepTruckin
//
//  Created by Timothy Lee on 2/12/13.
//  Copyright (c) 2013 K2. All rights reserved.
//

#import "NSDictionary+CPAdditions.h"

@implementation NSDictionary (CPAdditions)

- (id)objectOrNilForKey:(id)key {
    id object = [self objectForKey:key];
    
    if ((NSNull *) object == [NSNull null] || [object isEqual:@"<null>"]) {
        return nil;
    }
    
    return object;
}

- (id)valueOrNilForKeyPath:(id)keyPath {
    id object = [self valueForKeyPath:keyPath];
    if ((NSNull *)object == [NSNull null] || [object isEqual:@"<null>"]) {
        return nil;
    }
    return object;
}

@end
