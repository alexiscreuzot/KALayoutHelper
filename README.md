#KALAyoutHelper (formerly iOS Layout Helper)

A work in progress aiming to add a layout mecanism (similar to android) to views in iOS. It's handy when you want to display a lot of data inside a scrollview for instance, without having to do all the frames adjustments based on the previous elements positions.
2 layout helpers are available : UIVerticalLayout and UIHorizontalLayout.
In the last version you can put the content of a layout inside a block to have a better view of your layouts from within your code (it has no other purpose).

##Install

Simply copy :
 * KALayoutHelper.h
 * UIVerticalLayout.h
 * UIVerticalLayout.m
 * UIHorizontalLayout.h
 * UIHorizontalLayout.m

into your project folder and import KALayoutHelper.h

or use [cocoapods](http://cocoapods.org) with this line :
    pod 'KALayoutHelper'

##Usage

###Vertical Layout

``` objective-c
__block UIVerticalLayout * blockVertical = verticalLayout;
[verticalLayout setContentBlock:^{

    // Label
    UILabel * labelV = [[UILabel alloc] init];
    labelV.font = [UIFont boldSystemFontOfSize:18];
    labelV.text = @"Verticaly";
    [blockVertical addSubview:labelV withPadding:20];

    // TextViews
    UITextView * textV1 = [[UITextView alloc] init];
    textV1.text = @"Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores?";
    [blockVertical addSubview:textV1 withPadding:10];

    UITextView * textV2 = [[UITextView alloc] init];
    textV2.text = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium !";
    [blockVertical addSubview:textV2 withPadding:10];

    // Images
    UIImageView * imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    [blockVertical addSubview:imageView1 withPadding:10 andHorizontalAlignment:KALayoutHorizontalAlignmentLeft];

    UIImageView * imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    [blockVertical addSubview:imageView2 withPadding:10 andHorizontalAlignment:KALayoutHorizontalAlignmentCenter];

    UIImageView * imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    [blockVertical addSubview:imageView3 withPadding:10 andHorizontalAlignment:KALayoutHorizontalAlignmentRight];

    // Label
    UILabel * labelV2 = [[UILabel alloc] init];
    labelV2.font = [UIFont boldSystemFontOfSize:18];
    labelV2.text = @"Horizontaly";
    [blockVertical addSubview:labelV2 withPadding:10];

    // HORIZONTAL ------------------------------------------------------------------------------
    // Init horizontal layout (frame will be set automatically)
    // You just need to set the correct sizes for subview width
    UIHorizontalLayout * horizontalLayout = [[UIHorizontalLayout alloc] init];
    [horizontalLayout setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
    __block UIHorizontalLayout * blockHorizontal = horizontalLayout;
    [horizontalLayout setContentBlock:^{
        // TextViews
        UITextView * textH1 = [[UITextView alloc] initWithFrame:CGRectMake(0,0,145,0)];
        [textH1 setBackgroundColor:[UIColor clearColor]];
        textH1.text = @"Iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veriticabo.";
        [blockHorizontal addSubview:textH1];

        UITextView * textH2 = [[UITextView alloc] initWithFrame:CGRectMake(0,0,145,0)];
        [textH2 setBackgroundColor:[UIColor clearColor]];
        textH2.text = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium atae vitae dicta sunt explicabo.";
        [blockHorizontal addSubview:textH2 withPadding:10];
    }];

    [blockVertical addSubview:horizontalLayout withPadding:10];
}];
```


###Result

![Result](http://i.imgur.com/7Hnedoa.png)


###Horizontal Layout

``` objective-c
UIHorizontalLayout * horizontalLayout2 = [[UIHorizontalLayout alloc] init];
__block UIHorizontalLayout * blockHorizontal2 = horizontalLayout2;
[horizontalLayout2 setContentBlock:^{
    // TextViews
    UITextView * textH3 = [[UITextView alloc] initWithFrame:CGRectMake(0,0,93,0)];
    textH3.text = @"Iste natus error sit voluptatem , eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.";
    textH3.backgroundColor = [UIColor redColor];
    [blockHorizontal2 addSubview:textH3 withPadding:0 andVerticalAlignment:KALayoutVerticalAlignmentCenter];

    UITextView * textH4 = [[UITextView alloc] initWithFrame:CGRectMake(0,0,93,0)];
    textH4.text = @"Sed ut perspiciatis unde omnis iste accusantium doloremque laudantium, totam rem aperiam natus error sit voluptatem accusantium doloremque o.";
    [blockHorizontal2 addSubview:textH4 withPadding:10];

    UITextView * textH5 = [[UITextView alloc] initWithFrame:CGRectMake(0,0,93,0)];
    textH5.text = @"Sed ut perspiciatis unde omnis iste accusantium doloremque laudantium, totam rem aperiam natus error sit voluptatem accusantium doloremque laudantium, totam.";
    [blockHorizontal2 addSubview:textH5 withPadding:10];
}];
```

###Result

![Result](http://i.imgur.com/miTj3kO.png)



