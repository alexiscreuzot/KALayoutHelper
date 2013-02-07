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

or use cocoapod with this line :
    pod 'KALayoutHelper', :git => 'https://github.com/kirualex/KALayoutHelper.git'

## How to use

In order to display data vertically, simply use a UIVerticalLayout this way :

    // Init vertical layout (height at 0 will be updated automatically)
    UIVerticalLayout * verticalLayout = [[UIVerticalLayout alloc] initWithFrame:CGRectMake(10, 0, 300, 0)];

    [verticalLayout addSubview:view1 withPadding:20]; // 20px padding top
    [verticalLayout addSubview:view2 withPadding:20]; // 20px padding top

    [view addSubview:verticalLayout];


In order to display data Horizontally, simply use a UIHorizontalLayout this way :

    // Init vertical layout (height at 0 will be updated automatically)
    UIHorizontalLayout * horizontalLayout = [[UIHorizontalLayout alloc] initWithFrame:CGRectMake(10, 0, 300, 0)];

    [horizontalLayout addSubview:view1 withPadding:0]; // 0px padding left
    [horizontalLayout addSubview:view2 withPadding:10]; // 10px padding left

    [view addSubview:horizontalLayout];


## Result

![Result](http://i.imgur.com/lUoPK.png)



