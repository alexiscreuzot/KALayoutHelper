//
//  UIVerticalLayout.m
//
// Copyright 2013 Alexis Creuzot
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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

- (void) setContentBlock:(void(^)())contentBlock
{
    contentBlock();
}

- (void)addSubview:(UIView *)view{
    [self addSubview:view withPadding:0 andHorizontalAlignment:KALayoutHorizontalAlignmentNone];
}

- (void)addSubview:(UIView *)view withPadding:(int)padding
{    
    [self addSubview:view withPadding:padding andHorizontalAlignment:KALayoutHorizontalAlignmentNone];
}

- (void)addSubview:(UIView *)view withPadding:(int)padding andHorizontalAlignment:(KALayoutHorizontalAlignment)horizontalAlignement
{
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
    
    // Manage view horizontalAlignement
    float spaceLeft = self.frame.size.width - view.frame.size.width;
    switch (horizontalAlignement) {
        case KALayoutHorizontalAlignmentLeft:
            frame.origin.x = 0;
            break;
        case KALayoutHorizontalAlignmentCenter:
            frame.origin.x = spaceLeft/2;
            break;
        case KALayoutHorizontalAlignmentRight:
            frame.origin.x = spaceLeft;
            break;
            
        default:
            break;
    }
    
    view.frame = frame;
    
    // Size to fit on labels and textviews
    if([view isKindOfClass:[UILabel class]] ||
       [view isKindOfClass:[UITextView class]]){
        [view sizeToFit];
    }
    
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
