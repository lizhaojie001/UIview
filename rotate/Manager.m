//
//  Manager.m
//  ceshi
//
//  Created by tareba on 16/1/11.
//  Copyright © 2016年 tanada. All rights reserved.
//

#import "Manager.h"

@implementation Manager
+ (void)AnimationBle:(UIView *)view {
    [UIView beginAnimations:nil context:NULL];
    
    view.layer.affineTransform = CGAffineTransformMakeTranslation(0,100);
    
    view.layer.affineTransform = CGAffineTransformScale( view.layer.affineTransform, 0.8,0.8);
    
  view.layer.opacity = 0.5 ;
    
    //[self.view setNeedsDisplay];
    view.layer.affineTransform = CGAffineTransformRotate( view.layer.affineTransform, M_PI);
     view.layer.affineTransform = CGAffineTransformRotate( view.layer.affineTransform, M_PI);
    
     view.layer.opacity = 1 ;
    [UIView commitAnimations];
}
@end
