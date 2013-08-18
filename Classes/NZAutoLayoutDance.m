//
//  NZAutoLayoutDance.m
//  AutoLayoutDance
//
//  Created by Nicola Zaghini on 8/12/13.
//  Copyright (c) 2013 NZ. All rights reserved.
//

#import "NZAutoLayoutDance.h"

@implementation NZAutoLayoutDance

#pragma mark - Lifecycle

+ (id)sharedInstance;
{
  static NZAutoLayoutDance *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[NZAutoLayoutDance alloc] init];
  });
  return sharedInstance;
}

- (void)dealloc
{
  self.ambiguousViews = nil;
}

#pragma mark - Public methods

- (void)triggerDanceOnAmbiguousLayout;
{

  BOOL shaking = (_ambiguousViews != nil);
  
  NSMutableArray *tmpViews = [@[] mutableCopy];
  [self findAmbiguousViewStartingFrom:[[UIApplication sharedApplication] keyWindow] foundViews:tmpViews];
  
  if (shaking && [tmpViews isEqualToArray:_ambiguousViews]){
    self.ambiguousViews = nil; // stop dancing!
  }else if(tmpViews.count > 0){
    self.ambiguousViews = tmpViews; // dance!!!
    [self addDanceAction];
  }
}

- (NSString*)description
{
  NSMutableString *description = [NSMutableString stringWithString:@""];
  if (_ambiguousViews){
    [description appendString:@"Ambiguous Views:"];
    [_ambiguousViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      [description appendFormat:@"View: %@", obj];
      [description appendFormat:@"Horizontal: %@",
       [obj constraintsAffectingLayoutForAxis: UILayoutConstraintAxisHorizontal]];
      [description appendFormat:@"Vertical: %@",
       [obj constraintsAffectingLayoutForAxis: UILayoutConstraintAxisVertical]];
    }];
  }
  return description;
}

#pragma mark - Private / Utils methods

- (void)findAmbiguousViewStartingFrom:(UIView*)view foundViews:(NSMutableArray*)ambiguosLayoutViews
{
  if (view.hasAmbiguousLayout){
    [ambiguosLayoutViews addObject:view];
  }

  [view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [self findAmbiguousViewStartingFrom:obj foundViews:ambiguosLayoutViews];
  }];
}

- (void)addDanceAction
{
  if (_ambiguousViews){
    [NSTimer scheduledTimerWithTimeInterval:0.4
                                     target:self
                                   selector:@selector(danceAction)
                                   userInfo:nil
                                    repeats:NO];
  }
}

- (void)danceAction
{
  [_ambiguousViews makeObjectsPerformSelector:@selector(exerciseAmbiguityInLayout)];
  [self addDanceAction];
}

@end
