//
//  NZFirstViewController.m
//  AutoLayoutShakeDemo
//
//  Created by Nicola Zaghini on 8/14/13.
//  Copyright (c) 2013 NZ. All rights reserved.
//

#import "NZFirstViewController.h"
#import "NZAutoLayoutDance.h"

@interface UIWindow (AutoLayoutDebug)
+ (UIWindow *)keyWindow;
- (NSString *)_autolayoutTrace;
@end

@implementation NZFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
    self.title = @"Good Layout";
  }
  return self;
}

- (void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:animated];
  NSLog(@"%@",[[[UIApplication sharedApplication] keyWindow] _autolayoutTrace]);
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
  
  NSDictionary* variableBindings = NSDictionaryOfVariableBindings(redBox,blueBox);
  
  [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[redBox(==blueBox)]-[blueBox]|"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:variableBindings]];
  
  [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[redBox(==blueBox)]|"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:variableBindings]];
  [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[blueBox]|"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:variableBindings]];
  
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
