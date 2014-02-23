
***
Discontinued as of 23-02-2014 in favor of [CSLinearLayoutView](https://github.com/scalessec/CSLinearLayoutView)
***

#KALAyoutHelper (formerly iOS Layout Helper)

A work in progress aiming to add a layout mecanism (similar to android) to views in iOS. It's handy when you want to display a lot of data inside a scrollview for instance, without having to do all the frames adjustments based on the previous elements positions.
2 layout helpers are available : UIVerticalLayout and UIHorizontalLayout.
In the last version you can put the content of a layout inside a block to have a better view of your layouts from within your code (it has no other purpose).

##Install

###Normal Install

Simply copy :
 * KALayoutHelper.h
 * UIVerticalLayout.h
 * UIVerticalLayout.m
 * UIHorizontalLayout.h
 * UIHorizontalLayout.m

into your project folder and import KALayoutHelper.h

###Using [cocoapods](http://cocoapods.org)

add this line to your Podfile :
```pod 'KALayoutHelper'```

##Usage


``` objective-c
// VERTICAL 
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

    // HORIZONTAL 
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

##Result

![Result](http://i.imgur.com/7Hnedoa.png)

##Support a fellow developer !
If this code helped you for your project, consider contributing or donating some BTC to `1A37Am7UsJZYdpVGWRiye2v9JBthQrYw9N`
Thanks !
