//
//  HJViewFactory.h
//  HJVideoPlayer
//
//  Created by WHJ on 16/10/18.
//  Copyright © 2016年 WHJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImage+getImage.h"
#import "LeavesVideo-Swift.h"
@interface HJViewFactory : NSObject


+ (ExtendButton *)buttonWithNormalImage:(UIImage *)normalImage
                      selectedImage:(UIImage *)selectedImage;

@end
