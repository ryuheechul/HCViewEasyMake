//
//  UIView+HCViewEasyMake.h
//  CouponUp
//
//  Created by Ryu Heechul on 2014. 6. 24..
//  Copyright (c) 2014년 heechul. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HCViewOnceGetter(class, property, ivar, internalVar, block) \
- (class *)property \
{ \
if (!ivar) { \
ivar = ({ \
class *internalVar = [[class alloc] init]; \
block(); \
internalVar; \
}); \
} \
return ivar; \
}

#define HCViewRelease(VIEW) \
[VIEW removeFromSuperview]; \
VIEW = nil;

@interface UIView (HCViewEasyMake)
- (void)addSubviews:(NSArray *)subviews;
- (void)setSize:(CGSize)size;
- (void)setOrigin:(CGPoint)origin;
- (CGFloat)xPlusWidh;
- (CGFloat)yPlusHeight;
@end
