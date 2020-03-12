#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSArray *result = @[];
    
    NSMutableArray *openBracketsStack = [[NSMutableArray alloc] init];
    NSMutableArray *openBracketsObjStack = [[NSMutableArray alloc] init];
    NSMutableArray *openBracketsPositionsStack = [[NSMutableArray alloc] init];
    
    NSMutableArray *closeBracketsQueue = [[NSMutableArray alloc] init];
    NSMutableArray *closeBracketsObjQueue = [[NSMutableArray alloc] init];
    NSMutableArray *closeBracketsPositionsQueue = [[NSMutableArray alloc] init];
    
    NSDictionary *openBracketsPairs = @{
        @"(": @")",
        @"[": @"]",
        @"<": @">",
    };
    
    NSDictionary *closeBracketsPairs = @{
        @")": @"(",
        @"]": @"[",
        @">": @"<",
    };

    
    for (int i = 0; i < [string length]; i++) {
        NSString *ch = [string substringWithRange:NSMakeRange(i, 1)];
        
        if ([openBracketsPairs objectForKey:ch]) {
            [openBracketsStack addObject:ch];
            [openBracketsPositionsStack addObject:@(i)];
            [openBracketsObjStack addObject:@{
                @"bracket": ch,
                @"position": @(i),
            }];
        } else if ([closeBracketsPairs objectForKey:ch]) {
            [closeBracketsQueue addObject:ch];
            [closeBracketsPositionsQueue addObject:@(i)];
            [closeBracketsObjQueue addObject:@{
                @"bracket": ch,
                @"position": @(i),
            }];
        }
    }
    
    for (NSDictionary *openBracketObj in openBracketsObjStack) {
        NSString *openBracket = [openBracketObj objectForKey:@"bracket"];
        int openBracketPosition = [[openBracketObj objectForKey:@"position"] intValue] + 1;

        for (NSDictionary *closeBracketObj in closeBracketsObjQueue) {
            if ([[closeBracketObj objectForKey:@"bracket"] isEqualToString: [openBracketsPairs objectForKey: openBracket]]) {
                int closeBracketPosition = [[closeBracketObj objectForKey:@"position"] intValue];

                result = [result arrayByAddingObject: [string substringWithRange:NSMakeRange(openBracketPosition, closeBracketPosition - openBracketPosition)]];

                [closeBracketsObjQueue removeObject:closeBracketObj];
                break;
            }
        }
    }
    
    closeBracketsQueue = [[[closeBracketsQueue reverseObjectEnumerator] allObjects] mutableCopy];
    closeBracketsPositionsQueue = [[[closeBracketsPositionsQueue reverseObjectEnumerator] allObjects] mutableCopy];
    
//    while(openBracketsStack.count != 0) {
//        NSString *openBracket = openBracketsStack.lastObject;
//        int openBracketPosition = [openBracketsPositionsStack.lastObject intValue] + 1;
//        
//        int closeBracketIndex = [closeBracketsQueue indexOfObject:[openBracketsPairs objectForKey:openBracket]];
//        int closeBracketPosition = [closeBracketsPositionsQueue[closeBracketIndex] intValue];
//        
//        
//        if (closeBracketPosition > openBracketPosition) {
//            result = [result arrayByAddingObject: [string substringWithRange:NSMakeRange(openBracketPosition, closeBracketPosition - openBracketPosition)]];
//            
//            [closeBracketsQueue removeObjectAtIndex:closeBracketIndex];
//            [closeBracketsPositionsQueue removeObjectAtIndex:closeBracketIndex];
//        }
//        
//        [openBracketsStack removeLastObject];
//        [openBracketsPositionsStack removeLastObject];
//    }
//    
//    result = [[result reverseObjectEnumerator] allObjects];
    
    return result;
}

@end
