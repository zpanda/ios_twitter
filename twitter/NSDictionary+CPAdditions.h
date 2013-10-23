//
//  NSDictionary+CPAdditions.h
//  KeepTruckin
//
//  Created by Timothy Lee on 2/12/13.
//  Copyright (c) 2013 K2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CPAdditions)

- (id)objectOrNilForKey:(id)key;
- (id)valueOrNilForKeyPath:(id)keyPath;

@end
