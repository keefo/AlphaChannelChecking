//
//  ColorView.m
//  viewclick
//
//  Created by Xu Lian on 2015-05-14.
//  Copyright (c) 2015 beyondcow. All rights reserved.
//

#import "ColorView.h"

@implementation ColorView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    if(self.color){
        [self.color setFill];
        NSRectFill(dirtyRect);
        // Drawing code here.
    }
}

- (void)setColor:(NSColor *)color
{
    _color = color;
    [self setNeedsDisplay:YES];
}

@end
