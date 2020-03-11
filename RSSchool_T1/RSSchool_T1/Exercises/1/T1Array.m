#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    if (sadArray.count == 0) {
        return sadArray;
    }
    
    NSMutableArray* resultArray = [[NSMutableArray alloc] initWithArray:sadArray];
    
    for (int i = 1; i < resultArray.count - 1 ; i++) {
        int value = [resultArray[i] intValue];
        int sum = [resultArray[i-1] intValue] + [resultArray[i+1] intValue];
        
        if (value > sum) {
            [resultArray removeObjectAtIndex: i];
            i--;
            
            if (i > 1) {
                i--;
            }
        }
    }
    
    return (NSArray*)resultArray;
}

@end
