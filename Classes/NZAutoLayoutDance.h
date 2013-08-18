//
//  NZAutoLayoutDance.h
//  AutoLayoutShake
//
//  Created by Nicola Zaghini on 8/12/13.
//  Copyright (c) 2013 NZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NZAutoLayoutDance : NSObject // dance

/*
 * Gets a singleton instance
 */
+ (id)sharedInstance;
/*
 * Triggers the dance functionality (on/off)
 */
- (void)triggerDanceOnAmbiguousLayout;

/*
 * The list of views with ambiguous layout,
 * Availale only when shaking, nil otherwise
 */
@property (nonatomic, strong) NSArray* ambiguousViews;

@end
