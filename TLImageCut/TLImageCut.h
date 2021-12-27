//
//  TLImageCut.h
//  OCDemo20211227001-master
//
//  Created by MBP on 2021/12/27.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TLImageCut : NSObject


/// 图像裁剪
/// @param image 原图
/// @param newSize 要裁剪的最大尺寸         eg：1080*1920
+ (UIImage *)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

@end

NS_ASSUME_NONNULL_END
