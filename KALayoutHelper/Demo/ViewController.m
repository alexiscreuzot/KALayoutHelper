//
//  ViewController.m
//  ioslayout
//
//  Created by Alexis Creuzot on 26/09/12.
//  Copyright (c) 2012 Alexis Creuzot. All rights reserved.
//

#import "ViewController.h"
#import "KALayoutHelper.h"

@interface ViewController ()
@property (strong,nonatomic)IBOutlet UIScrollView * scrollView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // VERTICAL ------------------------------------------------------------------------------
    // Init vertical layout (height at 0 will be updated automatically)
    UIVerticalLayout * verticalLayout = [[UIVerticalLayout alloc] initWithFrame:CGRectMake(10, 0, 300, 0)];
    
    __block UIVerticalLayout * blockVertical = verticalLayout;
    [verticalLayout setContentBlock:^{
        
        // Label
        UILabel * labelV = [[UILabel alloc] init];
        labelV.font = [UIFont boldSystemFontOfSize:18];
        labelV.text = @"Verticaly";
        [blockVertical addSubview:labelV withPadding:20];
        
        // TextViews
        UITextView * textV1 = [[UITextView alloc] init];
        textV1.text = @"Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velir?";
        [blockVertical addSubview:textV1 withPadding:10];
        
        UITextView * textV2 = [[UITextView alloc] init];
        textV2.text = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. ?";
        [blockVertical addSubview:textV2 withPadding:10];
        
        // Image
        UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
        [blockVertical addSubview:imageView withPadding:10 andHorizontalAlignment:KALayoutHorizontalAlignmentCenter];
        
        // Label
        UILabel * labelV2 = [[UILabel alloc] init];
        labelV2.font = [UIFont boldSystemFontOfSize:18];
        labelV2.text = @"Horizontaly";
        [blockVertical addSubview:labelV2 withPadding:10];
        
        // HORIZONTAL ------------------------------------------------------------------------------
        // Init horizontal layout (frame will be set automatically)
        // You will need to set the correct sizes for subview width though
        UIHorizontalLayout * horizontalLayout = [[UIHorizontalLayout alloc] init];
        [horizontalLayout setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
        __block UIHorizontalLayout * blockHorizontal = horizontalLayout;
        [horizontalLayout setContentBlock:^{
            // TextViews
            UITextView * textH1 = [[UITextView alloc] initWithFrame:CGRectMake(0,0,145,0)];
            [textH1 setBackgroundColor:[UIColor clearColor]];
            textH1.text = @"Iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.";
            [blockHorizontal addSubview:textH1];
            
            UITextView * textH2 = [[UITextView alloc] initWithFrame:CGRectMake(0,0,145,0)];
            [textH2 setBackgroundColor:[UIColor clearColor]];
            textH2.text = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.";
            [blockHorizontal addSubview:textH2 withPadding:10];
        }];
        
        
        UIHorizontalLayout * horizontalLayout2 = [[UIHorizontalLayout alloc] init];
        blockHorizontal = horizontalLayout2;
        [horizontalLayout2 setContentBlock:^{
            // TextViews
            UITextView * textH3 = [[UITextView alloc] initWithFrame:CGRectMake(0,0,93,0)];
            textH3.text = @"Iste natus error sit voluptatem , eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.";
            textH3.backgroundColor = [UIColor redColor];
            [blockHorizontal addSubview:textH3 withPadding:0 andVerticalAlignment:KALayoutVerticalAlignmentCenter];
            
            UITextView * textH4 = [[UITextView alloc] initWithFrame:CGRectMake(0,0,93,0)];
            textH4.text = @"Sed ut perspiciatis unde omnis iste accusantium doloremque laudantium, totam rem aperiam natus error sit voluptatem accusantium doloremque laudantium, totam inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.";
            [blockHorizontal addSubview:textH4 withPadding:10];
            
            UITextView * textH5 = [[UITextView alloc] initWithFrame:CGRectMake(0,0,93,0)];
            textH5.text = @"Sed ut perspiciatis unde omnis iste accusantium doloremque laudantium, totam rem aperiam natus error sit voluptatem accusantium doloremque laudantium, totam inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.";
            [blockHorizontal addSubview:textH5 withPadding:10];
        }];
        
        // Add Vertical layout to Horizontal one
        [blockVertical addSubview:horizontalLayout withPadding:10];
        [blockVertical addSubview:horizontalLayout2 withPadding:10];
    }];
    
    // Add the main layout to the scrollView
    [_scrollView addSubview:verticalLayout];
    
    // Ask vertical layout for its bottom Y for the scrollview
    _scrollView.contentSize = CGSizeMake(320,verticalLayout.bottom);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
