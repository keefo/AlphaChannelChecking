//
//  MyImageView.h
//  viewclick
//
//  Created by Xu Lian on 2015-05-14.
//  Copyright (c) 2015 beyondcow. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ColorView.h"

@interface MyImageView : NSImageView
{
    NSTrackingArea *trackingArea;
}
@property(assign) IBOutlet ColorView *colorView;
@property(assign, nonatomic) BOOL selected;

@end
