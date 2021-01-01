//
//  Image+Extension.swift
//  meaning
//
//  Created by 김민희 on 2021/01/02.
//

import UIKit

extension UIImage {
    func cropToBounds(width: Double, height: Double) -> UIImage {
        // 이미지를 원하는 크기로 자르기

            let cgimage = self.cgImage!
            let contextImage: UIImage = UIImage(cgImage: cgimage)
            let contextSize: CGSize = contextImage.size
            var posX: CGFloat = 0.0
            var posY: CGFloat = 0.0
            var cgwidth: CGFloat = CGFloat(width)
            var cgheight: CGFloat = CGFloat(height)

            // width와 height 중 더 큰 길이를 중심으로 자른다.
            if contextSize.width > contextSize.height {
                posX = ((contextSize.width - contextSize.height) / 2)
                posY = 0
                cgwidth = contextSize.height
                cgheight = contextSize.height
            } else {
                posX = 0
                posY = ((contextSize.height - contextSize.width) / 2)
                cgwidth = contextSize.width
                cgheight = contextSize.width
            }

            let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)

            // rect를 이용해서 bitmap 이미지를 생성한다.
            let imageRef: CGImage = cgimage.cropping(to: rect)!

            // imageRef 이미지를 기반으로 새 이미지를 만든 후, 원래 방향으로 다시 돌려준다.
            let image: UIImage = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)

            return image
        }
}

