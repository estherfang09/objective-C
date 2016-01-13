//
//  CalculatorBrain.h
//  calculator
//
//  Created by Esther on 2015-11-28.
//  Copyright © 2015 Esther. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
- (void) pushOperand:(double) operand;
- (double)performOperation:(NSString *)operation;
@end
