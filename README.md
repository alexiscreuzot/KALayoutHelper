# KALAyoutHelper (formerly iOS Layout Helper)

A work in progress aiming to add a layout mecanism (similar to android) to views in iOS. It's handy when you want to display a lot of data inside a scrollview for instance, without having to do all the frames adjustments based on the previous elements positions.
2 layout helpers are available : UIVerticalLayout and UIHorizontalLayout.
In the last version you can put the content of a layout inside a block to have a better view of your layouts from within your code (it has no other purpose).

## How to install

Simply copy :
 * KALayoutHelper.h
 * UIVerticalLayout.h
 * UIVerticalLayout.m
 * UIHorizontalLayout.h
 * UIHorizontalLayout.m

into your project folder and import KALayoutHelper.h

## How to use a vertical layout

### Old way

    // Init vertical layout (height at 0 will be updated automatically)
    UIVerticalLayout * verticalLayout = [[UIVerticalLayout alloc] initWithFrame:CGRectMake(10, 0, 300, 0)];

    [verticalLayout addSubview:view1 withPadding:20]; // 20px padding top
    [verticalLayout addSubview:view2 withPadding:20]; // 20px padding top

    [view addSubview:verticalLayout];

### New way

    // Init vertical layout (height at 0 will be updated automatically)
    UIVerticalLayout * verticalLayout = [[UIVerticalLayout alloc] initWithFrame:CGRectMake(10, 0, 300, 0)];
    __block verticalBlock = verticalLayout;

    [verticalLayout setContentBlock:^{
        [verticalBlock addSubview:view1 withPadding:20]; // 20px padding top
        [verticalBlock addSubview:view2 withPadding:20]; // 20px padding top
    ];

    [view addSubview:verticalLayout];

## How to use an horizontal layout

In order to display data Horizontally, simply use a UIHorizontalLayout this way :

    // Init vertical layout (height at 0 will be updated automatically)
    UIHorizontalLayout * horizontalLayout = [[UIHorizontalLayout alloc] initWithFrame:CGRectMake(10, 0, 300, 0)];

    [horizontalLayout addSubview:view1 withPadding:0]; // 0px padding left
    [horizontalLayout addSubview:view2 withPadding:10]; // 10px padding left

    [view addSubview:horizontalLayout];

### New way

    // Init vertical layout (height at 0 will be updated automatically)
    UIHorizontalLayout * horizontalLayout = [[UIHorizontalLayout alloc] initWithFrame:CGRectMake(10, 0, 300, 0)];
    __block horizontalBlock = horizontalLayout;

    [horizontalLayout setContentBlock:^{
        [horizontalBlock addSubview:view1 withPadding:20]; // 20px padding top
        [horizontalBlock addSubview:view2 withPadding:20]; // 20px padding top
    ];

    [view addSubview:horizontalLayout];


## Result

![Result](http://i.imgur.com/lUoPK.png)



