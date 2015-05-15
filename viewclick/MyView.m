//
//  MyView.m
//  viewclick
//
//  Created by Xu Lian on 2015-05-14.
//  Copyright (c) 2015 beyondcow. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    // Drawing code here.
}

- (void)mouseDown:(NSEvent *)theEvent
{
    [super mouseDown:theEvent];
    [self.imageView setSelected:NO];
}

@end
