//
//  FeedCollectionViewCell.swift
//  meaning
//
//  Created by 선민승 on 2021/01/07.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {

    @IBOutlet var feedImage: UIImageView!
    
    static let identifier = "FeedCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    public func configure(with image:UIImage) {
        feedImage.image = image
    }
    
    //cell register 해줌 
    static func nib() -> UINib {
        return UINib(nibName: "FeedCollectionViewCell", bundle: nil)
    }
}
