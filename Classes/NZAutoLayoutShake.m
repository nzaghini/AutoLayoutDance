//
//  UIView+NZAutoLayoutShake.m
//  AutoLayoutShake
//
//  Created by Nicola Zaghini on 8/12/13.
//  Copyright (c) 2013 NZ. All rights reserved.
//

#import "NZAutoLayoutShake.h"

@implementation NZAutoLayoutShake

+ (id)sharedInstance;
{
  static NZAutoLayoutShake *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[NZAutoLayoutShake alloc] init];
  });
  return sharedInstance;
}

- (void)triggerShakeForAmbiguousLayout;
{
  BOOL shaking = _ambiguousViews != nil;
  [self shakeForAbiguosLayout:!shaking];
}

- (void)shakeForAbiguosLayout:(BOOL)shake;
{
  self.ambiguousViews = nil;
  
  if (shake) {
    NSMutableArray *tmpViews = [@[] mutableCopy];
    [self findAmbiguousViewStartingFrom:[[UIApplication sharedApplication] keyWindow] foundViews:tmpViews];
    self.ambiguousViews = tmpViews;
    
    [self printDetailsOnAmbiguity];
    [self addShakeAction];
  }
}

- (void)findAmbiguousViewStartingFrom:(UIView*)view foundViews:(NSMutableArray*)ambiguosLayoutViews
{
  if (view.hasAmbiguousLayout){
    [ambiguosLayoutViews addObject:view];
  }

  [view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [self findAmbiguousViewStartingFrom:obj foundViews:ambiguosLayoutViews];
  }];
}

- (void)printDetailsOnAmbiguity
{
  [_ambiguousViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    NSLog(@"View: %@ \nHorizontal: %@ \nVertical: %@",
          obj,
          [obj constraintsAffectingLayoutForAxis:UILayoutConstraintAxisHorizontal],
          [obj constraintsAffectingLayoutForAxis:UILayoutConstraintAxisVertical]);
  }];
}

- (void)addShakeAction
{
  if (_ambiguousViews){
    [NSTimer scheduledTimerWithTimeInterval:0.4
                                     target:self
                                   selector:@selector(shakeAction)
                                   userInfo:nil
                                    repeats:NO];
  }
}

- (void)shakeAction
{
  [_ambiguousViews makeObjectsPerformSelector:@selector(exerciseAmbiguityInLayout)];
  [self addShakeAction];
}


@end
