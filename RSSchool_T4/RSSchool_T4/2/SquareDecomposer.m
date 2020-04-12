#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    NSNumber *longNumber = [NSNumber numberWithLong: [number longValue]];
    NSNumber *remain = [NSNumber numberWithLong: pow([number longLongValue], 2)];

    NSMutableArray *decomposedArray = [self target: longNumber squaredTarget: remain];

    if (decomposedArray == nil) {
        return nil;
    } else {
        [decomposedArray removeLastObject];
        return decomposedArray;
    }
}

- (NSMutableArray *)target:(NSNumber *)prevNumber squaredTarget:(NSNumber *)numberSquared {
    if ([numberSquared longValue] == 0) {
        return [NSMutableArray arrayWithObject: prevNumber];
    }

    for(long i = [prevNumber longValue] - 1; i > 0; i--) {
        long prevSquared = pow(i, 2);

        if(([numberSquared longLongValue] - prevSquared) >= 0){
            NSNumber *nextNumber = [NSNumber numberWithLong: i];
            NSNumber *nextRemain = [NSNumber numberWithLong:([numberSquared longValue] - prevSquared)];
            
            NSMutableArray *result = [self target: nextNumber squaredTarget: nextRemain];
            if (result != nil){
                [result addObject: prevNumber];
                return result;
            }
        }
    }
    
    return nil;
}
@end
