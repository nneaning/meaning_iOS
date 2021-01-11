//
//  GroupFeedCell.swift
//  meaning
//
//  Created by 김민희 on 2021/01/09.
//

import UIKit

class GroupFeedCell: UICollectionViewCell {
    
    // MARK: Variable Part
    
    static let identifier: String = "GroupFeedCell"

    // MARK: IBOutlet
    
    @IBOutlet weak var feedImageView: UIImageView!
    
    func setCell(_ feedImage: FeedImage) {
        feedImageView.image = feedImage.makeFeedImage()
    }

}
