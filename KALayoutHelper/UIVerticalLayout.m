//
//  UIVerticalLayout.m
//  loireavelo
//
//  Created by Alexis Creuzot on 26/09/12.
//  Copyright (c) 2012 Mobizel. All rights reserved.
//

#import "UIVerticalLayout.h"

@interface UIVerticalLayout(){
    int curY;
}
@end

@implementation UIVerticalLayout


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        curY = 0;
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
        // We need to add it to the superview in order to know its content size
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
    frame.origin.y = curY + padding;
    if(view.frame.size.width == 0){
        frame.size.width = self.frame.size.width;
    }
    view.frame = frame;
    [view sizeToFit];
    [super addSubview:view];
    curY += (view.frame.size.height + padding);
    
    // Adapt layout frame to fit its elements
    frame = self.frame;
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
