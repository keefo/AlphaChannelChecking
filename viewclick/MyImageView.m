//
//  MyImageView.m
//  viewclick
//
//  Created by Xu Lian on 2015-05-14.
//  Copyright (c) 2015 beyondcow. All rights reserved.
//

#import "MyImageView.h"

@implementation MyImageView

- (void)updateTrackingAreas
{
    [super updateTrackingAreas];
    if (trackingArea){
        [self removeTrackingArea:trackingArea];
        trackingArea=nil;
    }
    
    NSTrackingAreaOptions options = NSTrackingInVisibleRect | NSTrackingMouseEnteredAndExited | NSTrackingActiveInKeyWindow | NSTrackingMouseMoved;
    trackingArea = [[NSTrackingArea alloc] initWithRect:NSZeroRect options:options owner:self userInfo:nil];
    [self addTrackingArea:trackingArea];
}

- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect
{
    if (self.image) {
        if (self.selected) {
            NSBezierPath *p = [NSBezierPath bezierPathWithRoundedRect:self.bounds xRadius:10 yRadius:10];
            [[NSColor colorWithWhite:0 alpha:0.3] setFill];
            [p fill];
        }
        [self.image drawInRect:self.bounds fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1];
    }
    // Drawing code here.
}

- (void)mouseDown:(NSEvent *)theEvent
{
    if (self.image) {
        NSPoint point = [self convertPoint:[theEvent locationInWindow] fromView:nil];
        [self.image setSize:self.bounds.size];
        [self.image lockFocus];
        NSColor *aColor = NSReadPixel(point);
        [self.image unlockFocus];
        if (aColor.alphaComponent == 0) {
             NSImage *t = [[NSImage alloc] initWithSize:NSMakeSize(20, 20)];
            [t lockFocus];
            [[NSColor whiteColor] setFill];
            NSRectFill(NSMakeRect(0, 0, 20, 20));
            [[NSColor grayColor] setFill];
            NSRectFill(NSMakeRect(0, 0, 10, 10));
            NSRectFill(NSMakeRect(10, 10, 10, 10));
            [t unlockFocus];
            [self.colorView setColor:[NSColor colorWithPatternImage:t]];
        }
        else{
            [self.colorView setColor:aColor];
            [self setSelected:YES];
            return;
        }
    }
    [self setSelected:NO];
    [super mouseDown:theEvent];
}

- (void)mouseMoved:(NSEvent *)theEvent
{
    if (self.image) {
        NSPoint point = [self convertPoint:[theEvent locationInWindow] fromView:nil];
        [self.image setSize:self.bounds.size];
        [self.image lockFocus];
        NSColor *aColor = NSReadPixel(point);
        [self.image unlockFocus];
        [self.colorView setColor:aColor];
        if (aColor.alphaComponent==0) {
            NSImage *t = [[NSImage alloc] initWithSize:NSMakeSize(20, 20)];
            [t lockFocus];
            [[NSColor whiteColor] setFill];
            NSRectFill(NSMakeRect(0, 0, 20, 20));
            [[NSColor grayColor] setFill];
            NSRectFill(NSMakeRect(0, 0, 10, 10));
            NSRectFill(NSMakeRect(10, 10, 10, 10));
            [t unlockFocus];
            [self.colorView setColor:[NSColor colorWithPatternImage:t]];
            return;
        }
    }
}


@end
