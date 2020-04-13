#import "FullBinaryTrees.h"
#import "Tree.h"

// solution source https://leetcode.com/articles/all-possible-full-binary-trees/

@implementation FullBinaryTrees
- (NSString *)stringForNodeCount:(NSInteger)count {
    
    if (count % 2 == 0) return @"[]";
    if (count == 1) return @"[[0]]";
    
    NSMutableString *result = [NSMutableString stringWithFormat:@"[]"];

    for (Tree *tree in [self allPossibleFBT: count]) {
        NSString *node = [self makeTree: tree nodes: count];
        [result insertString: node atIndex: result.length - 1];
    }

    return result;
}

- (NSArray *) allPossibleFBT: (NSInteger)count {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    if (count == 1) {
        Tree *node = [[Tree alloc] init];
        [result addObject: node];
        return result;
    } else if (count % 2 == 1) {
        for (int x = 1; x < count; x++) {
            for (Tree *left in [self allPossibleFBT: x]) {
                for (Tree *right in [self allPossibleFBT: count - x - 1]) {
                    Tree *node = [[Tree alloc] init];
                    node.left = left;
                    node.right = right;
                    [result addObject: node];
                }
            }
        }
    }
    
    return result;
}

- (NSString *)makeTree:(Tree *)tree nodes:(NSInteger) count {
    NSMutableString *result = [NSMutableString stringWithString: @"[0,"];
    NSMutableArray *arrayOfNodes = [[NSMutableArray alloc] init];
    [arrayOfNodes addObject: tree];

    int totalNodes = (int)count - 1;

    for (int i = 0; i < count; i++) {
        NSInteger leght = result.length;
        Tree *node = [arrayOfNodes firstObject];
        [arrayOfNodes removeObjectAtIndex: 0];
        if (node.left && node.right) {
            [result insertString: @"0,0," atIndex: leght];
            [arrayOfNodes addObject: node.left];
            [arrayOfNodes addObject: node.right];
            totalNodes = totalNodes - 2;
        } else {
            if (totalNodes) {
                [result insertString: @"null,null," atIndex: leght];
            }
        }
    }

    [result replaceCharactersInRange: NSMakeRange(result.length - 1, 1) withString: @"]"];
    return result;
}

@end
