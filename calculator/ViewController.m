//
//  ViewController.m
//  calculator
//
//  Created by Esther on 2015-11-19.
//  Copyright © 2015 Esther. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"
@interface ViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end
@implementation ViewController
@synthesize  brain = _brain;
@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
- (CalculatorBrain *) brain
{
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    /*self.digitpressed.layer.cornerRadius = 10;
    self.digitpressed.layer.borderWidth = 1;
    self.digitpressed.layer.borderColor = [UIColor lightGrayColor].CGColor;*/}
- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
    if (self.userIsInTheMiddleOfEnteringANumber){
        self.display.text =[self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}
- (IBAction)enterPressed
{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)operationPressed:(UIButton*)sender
{
    double result = [self.brain performOperation: sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g",result ];
    self.display.text = resultString;
    
}


@end
