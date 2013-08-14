//
//  NZSecondViewController.m
//  AutoLayoutShakeDemo
//
//  Created by Nicola Zaghini on 8/14/13.
//  Copyright (c) 2013 NZ. All rights reserved.
//

#import "NZSecondViewController.h"
#import "NZAutoLayoutDance.h"

@interface UIWindow (AutoLayoutDebug)
+ (UIWindow *)keyWindow;
- (NSString *)_autolayoutTrace;
@end

@implementation NZSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
    self.title = @"Bad Layout";
  }
  return self;
}

- (void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:animated];
  NSLog(@"%@",[[[UIApplication sharedApplication] keyWindow] _autolayoutTrace]);
  [self becomeFirstResponder];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  UIView* redBox = [[UIView alloc] init];
  redBox.translatesAutoresizingMaskIntoConstraints = NO;
  redBox.backgroundColor = [UIColor redColor];
  [self.view addSubview:redBox];
  
  UIView* blueBox = [[UIView alloc] init];
  blueBox.translatesAutoresizingMaskIntoConstraints = NO;
  blueBox.backgroundColor = [UIColor blueColor];
  [self.view addSubview:blueBox];
  
  [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[redBox(==blueBox)]-[blueBox]|"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:NSDictionaryOfVariableBindings(redBox,blueBox)]];
  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

#pragma mark AutoLayoutShake trigger

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
  if (motion == UIEventSubtypeMotionShake){
    [[NZAutoLayoutDance sharedInstance] triggerDanceOnAmbiguousLayout];
  }
}


@end
