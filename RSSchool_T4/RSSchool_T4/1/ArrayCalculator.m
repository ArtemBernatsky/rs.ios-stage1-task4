#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    NSMutableArray *numbersArray = [[NSMutableArray alloc] init];
    NSRange range = NSMakeRange(0, numberOfItems);
    
    for (id item in array) {
        if ([item isKindOfClass:[NSNumber class]]) {
            [numbersArray addObject: item];
        }
    }

    if ([numbersArray count] == 0) {
        return 0;
    }

    if (numberOfItems >= [numbersArray count]) {
        return [self calcResult: numbersArray];
    }

    [numbersArray sortUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        if (labs([obj2 integerValue]) > labs([obj1 integerValue])) {
           return (NSComparisonResult)NSOrderedDescending;
       }
        if (labs([obj2 integerValue]) < labs([obj1 integerValue])) {
           return (NSComparisonResult)NSOrderedAscending;
       }
       return (NSComparisonResult)NSOrderedSame;
    }];

    NSArray *calcArray = [numbersArray subarrayWithRange: range];
    NSInteger result = [self calcResult: calcArray];

    if (result > 0) {
        return result;
    }

    NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: NO];
    NSArray *sortedArray = [numbersArray sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortOrder]];

    calcArray = [sortedArray subarrayWithRange: range];
    return [self calcResult: calcArray];
}

+ (NSInteger)calcResult: (NSArray*)array {
    NSInteger result = 1;
    for (id number in array) {
        result *= [number intValue];
    }
    return result;
}


@end
