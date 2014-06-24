//
//  UIView+HCViewEasyMake.m
//  CouponUp
//
//  Created by Ryu Heechul on 2014. 6. 24..
//  Copyright (c) 2014년 heechul. All rights reserved.
//

#import "UIView+HCViewEasyMake.h"

@implementation UIView (HCViewEasyMake)

- (void)addSubviews:(NSArray *)subviews
{
    for (UIView *subV in subviews) {
        [self addSubview:subV];
    }
}

- (CGFloat)xPlusWidh
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)yPlusHeight
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

@end
