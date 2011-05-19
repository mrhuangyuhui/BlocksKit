//
//  NSDictionary+BlocksKit.m
//  BlocksKit
//

#import "NSDictionary+BlocksKit.h"

@implementation NSDictionary (BlocksKit)

- (void)each:(BKKeyValueBlock)block {
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        block(key, obj);
    }];
}

- (NSDictionary *)map:(BKKeyValueTransformBlock)block {
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] initWithCapacity:self.count];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [dictionary setObject:block(key, obj) forKey:key];
    }];
    
    NSDictionary *result = [dictionary copy];
    [dictionary release];
    return [result autorelease];
}

@end
