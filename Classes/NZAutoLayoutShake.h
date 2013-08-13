//
//  UIView+NZAutoLayoutShake.h
//  AutoLayoutShake
//
//  Created by Nicola Zaghini on 8/12/13.
//  Copyright (c) 2013 NZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NZAutoLayoutShake : NSObject

/*
 * Gets a singleton instance
 */
+ (id)sharedInstance;
/*
 * Starts / Stops the 'exerciseAmbiguityInLayout'
 */
- (void)shakeAbiguosLayout:(BOOL)shake;
/*
 * Triggers the shake functionality (on/off)
 */
- (void)triggerShakeAmbiguousLayout;

/*
 * The list of views where 'hasAmbiguousLayout' is true,
 * Availale only when shaking, nil otherwise
 */
@property (nonatomic, strong) NSArray* ambiguousViews;

@end
