//
//  UIHorizontalLayout.h
//
//  Created by Alexis Creuzot on 26/09/12.
//  Copyright (c) 2012 Alexis Creuzot. All rights reserved.
//

typedef NS_ENUM(NSInteger, KALayoutVerticalAlignment) {
    KALayoutVerticalAlignmentTop,
    KALayoutVerticalAlignmentCenter,
    KALayoutVerticalAlignmentBottom,
    KALayoutVerticalAlignmentNone
};

@interface UIHorizontalLayout : UIView

@property (nonatomic) int bottom;
@property (nonatomic) int right;

- (void)setContentBlock:(void(^)())contentBlock;
- (void)addSubview:(UIView *)view withPadding:(int)padding;
- (void)addSubview:(UIView *)view withPadding:(int)padding andVerticalAlignment:(KALayoutVerticalAlignment) verticalAlignment;

@end
