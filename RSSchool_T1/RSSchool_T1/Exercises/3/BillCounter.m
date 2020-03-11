#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    int currentSum = 0;
    
    NSMutableArray* AnnaOrder = [NSMutableArray arrayWithArray:bill];
    [AnnaOrder removeObjectAtIndex:index];
    
    for (NSNumber* price in AnnaOrder) {
        currentSum += [price intValue];
    }
    
    if ([sum isEqualToNumber:@(currentSum / 2)]) {
        return @"Bon Appetit";
    } else {
        return [NSString stringWithFormat: @"%i", ([sum intValue] - currentSum / 2)];
    }
}

@end
