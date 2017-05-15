//
//  UILabel+dynamicSizeMe.h
//  RecipesDemo
//
//  Created by MASUD RANA on 3/11/16.
//  Copyright © 2016 MASUD RANA. All rights reserved.
//


#import "UILabel+dynamicSizeMe.h"

@implementation UILabel (dynamicSizeMe)

-(float)resizeToFit{
    float height = [self expectedHeight];
    CGRect newFrame = [self frame];
    newFrame.size.height = height;
    [self setFrame:newFrame];
    return newFrame.origin.y + newFrame.size.height;
}

-(float)expectedHeight{
    [self setNumberOfLines:0];
    [self setLineBreakMode:NSLineBreakByWordWrapping];
    
    //UIFont *font = [UIFont fontWithName:@"SolaimanLipiNormal" size:14]; //Warning! It's an example, set the font, you need
    
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          self.font, NSFontAttributeName,
                                          nil];
    
    CGSize maximumLabelSize = CGSizeMake(self.frame.size.width, 9999); //FLT_MAX or 9999
    
    CGRect expectedLabelRect = [[self text] boundingRectWithSize:maximumLabelSize
                                                         options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                                      attributes:attributesDictionary
                                                         context:nil];
    CGSize *expectedLabelSize = &expectedLabelRect.size;
    
//    return expectedLabelSize->height;
    return expectedLabelSize->height + 30;
}

@end
