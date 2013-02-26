//
//  UIHorizontalLayout.h
//  loireavelo
//
//  Created by Alexis Creuzot on 26/09/12.
//  Copyright (c) 2012 Mobizel. All rights reserved.
//


@interface UIHorizontalLayout : UIView

@property (nonatomic) int bottom;
@property (nonatomic) int right;

- (void)setContentBlock:(void(^)())contentBlock;
- (void)addSubview:(UIView *)view withPadding:(int)padding;

@end
