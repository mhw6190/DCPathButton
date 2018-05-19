//
//  DCPathItemButton.m
//  DCPathButton
//
//  Created by tang dixi on 31/7/14.
//  Copyright (c) 2014 Tangdxi. All rights reserved.
//

#import "DCPathItemButton.h"

@interface DCPathItemButton ()

@property (strong, nonatomic) UIImageView *backgroundImageView;

@end

@implementation DCPathItemButton

- (instancetype)initWithImage:(UIImage *)image
             highlightedImage:(UIImage *)highlightedImage
             backgroundImage:(UIImage *)backgroundImage
             backgroundHighlightedImage:(UIImage *)backgroundHighlightedImage
             buttonTitle:(NSString *)buttonTitle
{
    if (self = [super init]) {
        
        // Make sure the iteam has a certain frame
        //
        CGRect itemFrame = CGRectMake(0, 0, backgroundImage.size.width, backgroundImage.size.height);
        
        if (!backgroundImage || !backgroundHighlightedImage) {
            itemFrame = CGRectMake(0, 0, image.size.width, image.size.height);
        }
        self.frame = itemFrame;
        
        // Configure the item's image
        //
        [self setImage:backgroundImage forState:UIControlStateNormal];
        [self setImage:backgroundHighlightedImage forState:UIControlStateHighlighted];
        
        // Configure background
        //
        _backgroundImageView = [[UIImageView alloc]initWithImage:image
                                                highlightedImage:highlightedImage];
        _backgroundImageView.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        
        UILabel *buttonLbl = [[UILabel alloc] initWithFrame:CGRectMake(-10, 0, itemFrame.size.width+22, backgroundImage.size.height+60)];
        buttonLbl.textAlignment = NSTextAlignmentCenter;
        [buttonLbl setTextColor:[UIColor whiteColor]];
        [buttonLbl setBackgroundColor:[UIColor clearColor]];
        [buttonLbl setFont:[UIFont fontWithName: @"Arial-BoldMT" size: 9.0f]];
        buttonLbl.text = buttonTitle;
        
        [self addSubview:_backgroundImageView];
        [self addSubview:buttonLbl];

        
        // Add an action for the item button
        //
        [self addTarget:_delegate action:@selector(itemButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

@end
