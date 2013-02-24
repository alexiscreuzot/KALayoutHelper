//
//  UIHorizontalLayout.h
//  loireavelo
//
//  Created by Alexis Creuzot on 26/09/12.
//  Copyright (c) 2012 Mobizel. All rights reserved.
//


typedef void (^ContentBlock)();

@interface UIHorizontalLayout : UIView

@property (nonatomic) int bottom;
@property (nonatomic) int right;

- (void)setContentBlock:(ContentBlock)contentBlock;
- (void)addSubview:(UIView *)view withPadding:(int)padding;

@end
