#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    int min;
    int max = 0;
    int sum = 0;
    
    for (NSNumber* num in array) {
        sum += [num intValue];
    }
    
    min = sum;
    
    for (NSNumber* num in array) {
        int sumWithoutNum = sum - [num intValue];
        
        if (sumWithoutNum > max) {
            max = sumWithoutNum;
        }
        
        if (sumWithoutNum < min) {
            min = sumWithoutNum;
        }
    }
    
    return @[@(min), @(max)];
}

@end
