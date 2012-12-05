# KALAyoutHelper (formerly iOS Layout Helper)

A work in progress aiming to add a layout mecanism (similar to android) to views in iOS.
2 layouts helper are offered : UIVerticalLayout and UIHorizontalLayout.

## How to install

Simply copy : 
 * KALayoutHelper.h
 * UIVerticalLayout.h
 * UIVerticalLayout.m
 * UIHorizontalLayout.h
 * UIHorizontalLayout.m

into your project folder and import KALayoutHelper.h

## How to use

In order to display data vertically, simply use a UIVerticalLayout this way :

    // Init vertical layout (height at 0 will be updated automatically)
    UIVerticalLayout * verticalLayout = [[UIVerticalLayout alloc] initWithFrame:CGRectMake(10, 0, 300, 0)];

    [verticalLayout addSubview:view1 withPadding:20]; // 20px padding top
    [verticalLayout addSubview:view2 withPadding:20]; // 20px padding top

    [view addSubview:verticalLayout];


In order to display data Horizontally, simply use a UIHorizontalLayout this way :

    // Init vertical layout (height at 0 will be updated automatically)
    UIHorizontalLayout * verticalLayout = [[UIHorizontalLayout alloc] initWithFrame:CGRectMake(10, 0, 300, 0)];

    [horizontalLayout addSubview:view1 withPadding:0]; // 0px padding left
    [horizontalLayout addSubview:view2 withPadding:10]; // 10px padding left

    [view addSubview:horizontalLayout];


## Examples
### Vertical display
     
		// VERTICAL LAYOUT ------------------------------------------------------------------------------
    // Init vertical layout (height at 0 will be updated automatically)
    UIVerticalLayout * verticalLayout = [[UIVerticalLayout alloc] initWithFrame:CGRectMake(10, 0, 300, 0)];
    
    // Label
    UILabel * labelV = [[UILabel alloc] init];
    labelV.font = [UIFont boldSystemFontOfSize:18];
    labelV.text = @"Verticaly";
    [verticalLayout addSubview:labelV withPadding:20];
    
    // TextViews
    UITextView * textV1 = [[UITextView alloc] init];
    textV1.text = @"Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velir?";
    [verticalLayout addSubview:textV1 withPadding:10];
    
    UITextView * textV2 = [[UITextView alloc] init];
    textV2.text = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. ?";
    [verticalLayout addSubview:textV2 withPadding:10];
    
    // Image
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"star"];
    int centerX = (verticalLayout.frame.size.width - imageView.image.size.width)/2;
    imageView.center = CGPointMake(centerX, 0);
    [verticalLayout addSubview:imageView withPadding:10];

    [view addSubview:verticalLayout];

### Result

![Vertical](http://i.imgur.com/fU8SO.png)

### Horizontal display

		// Label
    UILabel * label = [[UILabel alloc] init];
    label.font = [UIFont boldSystemFontOfSize:18];
    label.text = @"Horizontaly";
    [view addSubview:label];
    
    // HORIZONTAL ------------------------------------------------------------------------------
    // Init horizontal layout (frame will be set automatically)
    // You will need to set the correct sizes for subview width though
    UIHorizontalLayout * horizontalLayout = [[UIHorizontalLayout alloc] init];
    
    // TextViews
    UITextView * textH1 = [[UITextView alloc] initWithFrame:CGRectMake(0,0,140,0)];
    textH1.text = @"Iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.";
    [horizontalLayout addSubview:textH1 withPadding:0];
    
    UITextView * textH2 = [[UITextView alloc] initWithFrame:CGRectMake(0,0,140,0)];
    textH2.text = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.";
    [horizontalLayout addSubview:textH2 withPadding:10];
    
    [view addSubview:horizontalLayout];

### Result

![Horizontal](http://i.imgur.com/Vp2i9.png)



