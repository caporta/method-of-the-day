//
//  method_of_the_dayView.m
//  method-of-the-day
//
//  Created by Christopher Aporta on 4/19/16.
//  Copyright © 2016 Prestige Worldwide. All rights reserved.
//

#import "method_of_the_dayView.h"

@interface method_of_the_dayView ()
@property (nonatomic) BOOL mDrawBackground;
@end

@implementation method_of_the_dayView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        _mDrawBackground = YES;
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

- (void)viewDidMoveToWindow {
    // this NSView method is called when our screen saver view is added to its window
    // we'll use this signal to tell drawRect: to erase the background
    self.mDrawBackground = YES;
}

- (void)drawText:(CGFloat)xPosition yPosition:(CGFloat)yPosition canvasWidth:(CGFloat)canvasWidth canvasHeight:(CGFloat)canvasHeight
{
    //Draw Text
    CGRect textRect = CGRectMake(xPosition, yPosition, canvasWidth, canvasHeight);
    NSMutableParagraphStyle *textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
    textStyle.alignment = NSTextAlignmentLeft;
    
    NSDictionary* textFontAttributes = @{NSFontAttributeName: [NSFont fontWithName: @"Helvetica" size: 50], NSForegroundColorAttributeName: NSColor.blueColor, NSParagraphStyleAttributeName: textStyle};
    
    [@"Hello, World!" drawInRect: textRect withAttributes: textFontAttributes];
}


- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    
    if (self.mDrawBackground ) {
        //   draw background after view is installed in a window for the first time
        [[NSColor colorWithDeviceRed: 0.0 green: 0.0
                                blue: 0.0 alpha: 1.0] set];
        [NSBezierPath fillRect: [self bounds]];
        self.mDrawBackground = NO;
    }
    
    [self drawText:self.bounds.origin.x yPosition:self.bounds.origin.y canvasWidth:self.bounds.size.width canvasHeight:self.bounds.size.height];
}

- (BOOL)isOpaque {
    // this keeps Cocoa from unneccessarily redrawing our superview
    return YES;
}

- (void)animateOneFrame
{
    [self setNeedsDisplay: YES];
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
