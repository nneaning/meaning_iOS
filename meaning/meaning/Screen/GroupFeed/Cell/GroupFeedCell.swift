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
    
    func setCell(_ groupFeedData: [GroupFeedData], index: Int) {
        // kingfisher 이용해서 캐싱
        feedImageView.setImage(from: groupFeedData[index].timeStampImageURL)
    }

}
