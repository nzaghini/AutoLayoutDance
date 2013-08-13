//
//  UIView+NZAutoLayoutShake.h
//  AutoLayoutShake
//
//  Created by Nicola Zaghini on 8/12/13.
//  Copyright (c) 2013 NZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NZAutoLayoutShake : NSObject

+ (id)sharedInstance;
- (void)shakeForAbiguosLayout:(BOOL)shake;
- (void)triggerShakeForAmbiguousLayout;

@property (nonatomic, strong) NSArray* ambiguousViews;

@end
