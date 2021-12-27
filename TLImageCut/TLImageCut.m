//
//  TLImageCut.m
//  OCDemo20211227001-master
//
//  Created by MBP on 2021/12/27.
//

#import "TLImageCut.h"

@implementation TLImageCut

+ (UIImage *)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize {
    CGFloat needW = newSize.width;
    CGFloat needH = newSize.height;
    
    CGFloat imageW = image.size.width;
    CGFloat imageH = image.size.height;
    // W和H都小
    if (imageW <= needW && imageH <= needH) {
        NSLog(@"---最终宽度：%.0f，最终高度：%.0f",imageW,imageH);
        return image;
    }
    // W和H都大、W大H不大、H大W不大
    BOOL isWidthBig = imageW >= imageH ? YES : NO;
    // 需要等比例缩小的倍数
    CGFloat imageB = 1.0;
    if (isWidthBig) {// eg:6140*3924
        // imageW >= imageH
        imageB = imageW/needW;// 5.685
        imageW = imageW/imageB;// 1080
        imageH = imageH/imageB;// 690
        // 裁完一遍后宽度合适,如果高度还大于需要的最大高度就继续裁
        if (imageH > needH) {
            imageB = imageH/needH;
            imageW = imageW/imageB;
            imageH = imageH/imageB;
        }
    }else {// eg:3700*12138
        // imageH > imageW
        imageB = imageH/needH;// 6.322
        imageW = imageW/imageB;// 585
        imageH = imageH/imageB;// 1920
        // 裁完一遍后高度合适,如果宽度还大于需要的最大宽度就继续裁
        if (imageW > needW) {
            imageB = imageW/needW;
            imageW = imageW/imageB;
            imageH = imageH/imageB;
        }
    }
    // 走完上面的判断语句后，此时的高度宽度均合适
     NSLog(@"---最终宽度：%.0f，最终高度：%.0f",imageW,imageH);
    
    // Create a graphics image context
    UIGraphicsBeginImageContext(CGSizeMake(imageW, imageH));
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,imageW,imageH)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

@end
