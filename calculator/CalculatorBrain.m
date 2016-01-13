//
//  CalculatorBrain.m
//  calculator
//
//  Created by Esther on 2015-11-28.
//  Copyright © 2015 Esther. All rights reserved.
//

#import "CalculatorBrain.h"
@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;

@end


@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

- (NSMutableArray *)operandStack{
    if (_operandStack == nil) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

-(double) popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

-(void) pushOperand:(double) operand
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
    
}
- (double) performOperation:(NSString *)operation
{
    double result = 0;
    if ([@"+" isEqualToString:operation]){
        result = [self popOperand] + [self popOperand];
    } else if ([@"*" isEqualToString: operation]){
        result = [self popOperand] * [self popOperand];
    } else if ([@"-" isEqualToString: operation]){
        result = - [self popOperand] + [self popOperand];
    }
    else if ([@"/" isEqualToString:operation]){
        double divisor = [self popOperand];
        if (!divisor){
        result = 0;
        } else {
            result = [self popOperand] / divisor;
        }
    }
    // calculate result
    return result;
}
   
@end

