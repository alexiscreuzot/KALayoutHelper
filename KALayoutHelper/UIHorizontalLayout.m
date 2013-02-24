//
//  UIHorizontalLayout.m
//  loireavelo
//
//  Created by Alexis Creuzot on 26/09/12.
//  Copyright (c) 2012 Mobizel. All rights reserved.
//

#import "UIHorizontalLayout.h"

@interface UIHorizontalLayout(){
    int curY;
    int curX;
}
@end

@implementation UIHorizontalLayout

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        curX = 0;
    }
    return self;
}

- (void) setContentBlock:(ContentBlock)contentBlock
{
    contentBlock();
}

- (void)addSubview:(UIView *)view withPadding:(int)padding
{
    view.backgroundColor = [UIColor clearColor];
    
    // Let labels take as much line as they need
    if ([view isKindOfClass:[UILabel class]]){
        UILabel * label = (UILabel *) view;
        label.numberOfLines = 0;
    }
    
    // Textview
    if ([view isKindOfClass:[UITextView class]]){
        [super addSubview:view];
        UITextView * textView = (UITextView *) view;
        CGRect tframe = textView.frame;
        tframe.size.height = textView.contentSize.height;
        textView.frame = tframe;
        textView.editable= NO;
        [textView removeFromSuperview];
    }
    
    // Add view to layout with given padding
    CGRect frame = view.frame;
    frame.origin.x = curX + padding;
    view.frame = frame;
    [view sizeToFit];
    [super addSubview:view];
    curX += (view.frame.size.width + padding);
    if(view.frame.size.height > curY){
        curY = view.frame.size.height;
    }
    
    // Adapt layout frame to fit its elements
    frame = self.frame;
    frame.size.width = curX;
    frame.size.height = curY;
    self.frame = frame;
}

-(int) bottom
{
    return (self.frame.origin.y + self.frame.size.height);
}

-(int) right
{
    return (self.frame.origin.x + self.frame.size.width);
}
@end
