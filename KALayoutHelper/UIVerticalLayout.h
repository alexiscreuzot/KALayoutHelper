//
//  UIVerticalLayout.h
//  loireavelo
//
//  Created by Alexis Creuzot on 26/09/12.
//  Copyright (c) 2012 Mobizel. All rights reserved.
//

typedef NS_ENUM(NSInteger, KALayoutHorizontalAlignment) {
    KALayoutHorizontalAlignmentLeft,
    KALayoutHorizontalAlignmentCenter,
    KALayoutHorizontalAlignmentRight,
    KALayoutHorizontalAlignmentNone
};

@interface UIVerticalLayout : UIView

@property (nonatomic) int bottom;
@property (nonatomic) int right;

- (void)setContentBlock:(void(^)())contentBlock;
- (void)addSubview:(UIView *)view;
- (void)addSubview:(UIView *)view withPadding:(int)padding;
- (void)addSubview:(UIView *)view withPadding:(int)padding andHorizontalAlignment:(KALayoutHorizontalAlignment) horizontalAlignment;
@end
