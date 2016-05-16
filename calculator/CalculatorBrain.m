//
//  CalculatorBrain.m
//  calculator
//
//  Created by Esther on 2015-11-28.
//  Copyright © 2015 Esther. All rights reserved.
//

#import "CalculatorBrain.h"
@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *programStack;

@end


@implementation CalculatorBrain

@synthesize programStack = _programStack;


- (NSMutableArray *)programStack{
    if (_programStack == nil) _programStack = [[NSMutableArray alloc] init];
    return _programStack;
}

-(double) popOperand
{
    NSNumber *operandObject = [self.programStack lastObject];
    if (operandObject) [self.programStack removeLastObject];
    return [operandObject doubleValue];
}

-(void) pushOperand:(double) operand
{
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
    
}

- (id)program
{
    return [self.programStack copy];
}

+ (NSString *)descriptionOfProgram:(id)program
{
    return @"Implement it later";
}
+ (double) popOperandOffStack:(NSMutableArray *)stack {
    double result = 0;
    id topOfStack = [stack lastObject];
    if (topOfStack) [stack removeLastObject];
    if ([topOfStack isKindOfClass:[NSNumber class]]){
        result = [topOfStack doubleValue];
    }
    else if ([topOfStack isKindOfClass:[NSString class]]){
        NSString *operation = topOfStack;
        if ([@"+" isEqualToString:operation]){
            result = [self popOperandOffStack:stack] + [self popOperandOffStack:stack];
        } else if ([@"*" isEqualToString: operation]){
            result = [self popOperandOffStack:stack] * [self popOperandOffStack:stack];
        } else if ([@"-" isEqualToString: operation]){
            result = - [self popOperandOffStack:stack] + [self popOperandOffStack:stack];
        }
        else if ([@"/" isEqualToString:operation]){
            double divisor = [self popOperandOffStack:stack];
            if (!divisor){
                result = 0;
            } else {
                result = [self popOperandOffStack:stack] / divisor;
            }
        }
    }
    return result;
}

+ (double) runProgram:(id)program
{
    NSMutableArray *stack;
    if ([program isKindOfClass:[NSArray class]]){
        stack = [program mutableCopy];
    }
    return  [self popOperandOffStack:stack];
}

- (double) performOperation:(NSString *)operation
{
    [self.programStack addObject:operation];
    return [CalculatorBrain runProgram:self.program];
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

