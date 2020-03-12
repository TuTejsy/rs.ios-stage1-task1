#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    NSMutableString *resultString = [s mutableCopy];
    int intK = [k intValue];
    
    for (int i = 0; i < [n intValue] / 2; i++) {
        int rightPos = [n intValue] - i - 1;
        
        NSString *leftNum = [s substringWithRange:NSMakeRange(i, 1)];
        NSString *rightNum = [s substringWithRange:NSMakeRange(rightPos, 1)];
        
        if (![leftNum isEqualToString:rightNum]) {
            if (intK == 0) {
                return @"-1";
            }
            
            if ([leftNum compare:rightNum] == 1) {
                [resultString replaceCharactersInRange:NSMakeRange(rightPos, 1) withString:leftNum];
                intK--;
            } else {
                [resultString replaceCharactersInRange:NSMakeRange(i, 1) withString:rightNum];
                intK--;
            }
        }
    }
    
    for (int i = 0; i < [n intValue] / 2 && intK > 0; i++) {
        int rightPos = [n intValue] - i - 1;
        
        [resultString replaceCharactersInRange:NSMakeRange(0, 1) withString:@"9"];
        [resultString replaceCharactersInRange:NSMakeRange(rightPos, 1) withString:@"9"];
        
        
        intK--;
    }
    
    return [resultString copy];
}

@end
