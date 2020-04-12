#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    NSMutableArray *result = [NSMutableArray array];
    NSDictionary * neighbors =
    @{
        @"0": @[@"8"],
        @"1": @[@"2", @"4"],
        @"2": @[@"1", @"3", @"5"],
        @"3": @[@"2", @"6"],
        @"4": @[@"1", @"5", @"7"],
        @"5": @[@"2", @"4", @"6", @"8"],
        @"6": @[@"3", @"5", @"9"],
        @"7": @[@"4", @"8"],
        @"8": @[@"0", @"5", @"7", @"9"],
        @"9": @[@"6", @"8"]
    };
    
    if (number.length < 1 || [number intValue] < 0) {
        return nil;
    }
    
    for (int i = 0; i < number.length; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *currentChar = [number substringWithRange: range];
        NSArray *dict = [neighbors objectForKey: currentChar];
        for (NSString *value in dict) {
            NSString *currentNeighbors = [number stringByReplacingCharactersInRange: range withString:value];
            [result addObject: currentNeighbors];
        }
    }
    
    return result;
}
@end
