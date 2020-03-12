#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSArray *result = @[];
    
    NSMutableArray *openBracketsObjStack = [[NSMutableArray alloc] init];
    NSMutableArray *closeBracketsObjQueue = [[NSMutableArray alloc] init];
    
    NSDictionary *openBracketsPairs = @{
        @"(": @")",
        @"[": @"]",
        @"<": @">",
    };
    
    NSMutableDictionary *openBracketsCount = [@{
        @"(": @(0),
        @"[": @(0),
        @"<": @(0),
    } mutableCopy];
    
    NSDictionary *closeBracketsPairs = @{
        @")": @"(",
        @"]": @"[",
        @">": @"<",
    };

    
    for (int i = 0; i < [string length]; i++) {
        NSString *ch = [string substringWithRange:NSMakeRange(i, 1)];
        
        if ([openBracketsPairs objectForKey:ch]) {
            [openBracketsObjStack addObject:@{
                @"bracket": ch,
                @"position": @(i),
            }];
            
            int bracketCount = [[openBracketsCount objectForKey:ch] intValue];
            [openBracketsCount setObject:@(bracketCount + 1) forKey:ch];
        } else if ([closeBracketsPairs objectForKey:ch]) {
            [closeBracketsObjQueue addObject:@{
                @"bracket": ch,
                @"position": @(i),
            }];
        }
    }
    
    for (NSDictionary *openBracketObj in openBracketsObjStack) {
        NSString *openBracket = [openBracketObj objectForKey:@"bracket"];
        int openBracketPosition = [[openBracketObj objectForKey:@"position"] intValue] + 1;
        int bracketCount = [[openBracketsCount objectForKey:openBracket] intValue];
        
        int currentBracketCount = bracketCount;

        for (NSDictionary *closeBracketObj in closeBracketsObjQueue) {
            if ([[closeBracketObj objectForKey:@"bracket"] isEqualToString: [openBracketsPairs objectForKey: openBracket]]) {
                if (currentBracketCount <= 2) {
                    int closeBracketPosition = [[closeBracketObj objectForKey:@"position"] intValue];

                    result = [result arrayByAddingObject: [string substringWithRange:NSMakeRange(openBracketPosition, closeBracketPosition - openBracketPosition)]];

                    [closeBracketsObjQueue removeObject:closeBracketObj];
                    
                    [openBracketsCount setObject:@(bracketCount - 1) forKey:openBracket];
                    break;
                } else {
                    currentBracketCount--;
                }
            }
        }
    }
    
    return result;
}

@end
