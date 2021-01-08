//
//  FeedCollectionViewCell.swift
//  meaning
//
//  Created by 선민승 on 2021/01/07.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    // MARK: Variable Part

    static let identifier = "FeedCollectionViewCell"

    // MARK: IBOutlet

    @IBOutlet var feedImage: UIImageView!
    
    // MARK: Life Cycle Part
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    // MARK: function

    public func configure(with image:FeedImage) {
        feedImage.image = image.makeFeedImage()
    }
    
    //cell register 해주는 function
    
    static func nib() -> UINib {
        return UINib(nibName: "FeedCollectionViewCell", bundle: nil)
    }
}
