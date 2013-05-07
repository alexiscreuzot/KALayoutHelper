//
//  UIHorizontalLayout.m
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

#import "UIHorizontalLayout.h"

@interface UIHorizontalLayout(){
    int curY;
    int curX;
    NSMutableArray * viewsToAdapt;
    NSMutableArray * viewsToAdaptAlignment;
}
@end

@implementation UIHorizontalLayout

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        curX = 0;
        viewsToAdapt = [NSMutableArray array];
        viewsToAdaptAlignment = [NSMutableArray array];
    }
    return self;
}

- (void) setContentBlock:(void(^)())contentBlock
{
    contentBlock();
    
    for(int i=0; i<viewsToAdapt.count;i++){
        
        UIView * view = viewsToAdapt[i];
        KALayoutVerticalAlignment verticalAlignment = [viewsToAdaptAlignment[i] integerValue];
        
        CGRect frame = view.frame;
        
        // Manage view verticalAlignement
        float spaceLeft = self.frame.size.height - frame.size.height;
        switch (verticalAlignment) {
            case KALayoutVerticalAlignmentTop:
                frame.origin.y = 0;
                break;
            case KALayoutVerticalAlignmentCenter:
                frame.origin.y = spaceLeft/2;
                break;
            case KALayoutVerticalAlignmentBottom:
                frame.origin.y = spaceLeft;
                break;
                
            default:
                break;
        }
        
        view.frame = frame;
    }
    
}
- (void)addSubview:(UIView *)view
{
    [self addSubview:view withPadding:0 andVerticalAlignment:KALayoutVerticalAlignmentNone];
}

- (void)addSubview:(UIView *)view withPadding:(int)padding
{
    [self addSubview:view withPadding:padding andVerticalAlignment:KALayoutVerticalAlignmentNone];
}

- (void)addSubview:(UIView *)view withPadding:(int)padding andVerticalAlignment:(KALayoutVerticalAlignment)verticalAlignment
{    
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
    
    [viewsToAdapt addObject:view];
    [viewsToAdaptAlignment addObject:@(verticalAlignment)];
    
    // Size to fit on labels and textviews
    if([view isKindOfClass:[UILabel class]] ||
       [view isKindOfClass:[UITextView class]]){
        [view sizeToFit];
    }

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
