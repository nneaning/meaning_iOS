//
//  FeedDetailCell.swift
//  meaning
//
//  Created by 김민희 on 2021/01/08.
//

import UIKit

class FeedDetailCell: UITableViewCell {
    
    // MARK: Variable Part
    
    static let identifier: String = "FeedDetailCell"
    
    // MARK: IBOutlet
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileLabel: UILabel!
    
    @IBOutlet weak var nickLabel: UILabel!
    @IBOutlet weak var writeTimeLabel: UILabel!
    
    @IBOutlet weak var wakeupView: UIView!
    @IBOutlet weak var wakeupLabel: UILabel!
    @IBOutlet weak var wakeupViewWidth: NSLayoutConstraint!
    
    @IBOutlet weak var contextLabel: UILabel!
    
    @IBOutlet weak var uploadImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Function
    
    func setCell() {
        // Cell default Style Setting
        profileView.setRounded(radius: nil)
        
        profileLabel.font = UIFont.spoqaMedium(size: 13)
        profileLabel.text = "이"
        profileLabel.textColor = .gray1
        
        nickLabel.font = UIFont.notoMedium(size: 15)
        nickLabel.text = "이기상"
        
        writeTimeLabel.font = UIFont.notoRegular(size: 13)
        writeTimeLabel.textColor = .gray3
        writeTimeLabel.text = "5분전"
        
        wakeupView.setRounded(radius: 13.5)
        wakeupView.backgroundColor = .none
        wakeupView.setBorder(borderColor: .skyBlue, borderWidth: 1)
        
        wakeupLabel.text = "매일 오전 5시 기상"
        wakeupLabel.font = UIFont.notoMedium(size: 13)
        wakeupLabel.textColor = .skyBlue
        
        contextLabel.font = UIFont.spoqaRegular(size: 14)
        contextLabel.text = "기상인증"
        contextLabel.numberOfLines = 0
    }
    
    func setData(nick: String,writeTime: String, wakeupTime: String, context: String, uploadImageName: String, index: Int) {
        // 서버 데이터 넣기
        self.nickLabel.text = nick
        self.writeTimeLabel.text = writeTime.stringToDate().timeAgoSince()
        self.wakeupLabel.text = wakeupTime
        self.contextLabel.text = context
        self.uploadImage.setImage(from: uploadImageName)
        profileLabel.text = "\(nick[nick.startIndex])"
        if wakeupTime.count == 11 {
            // 정각일때
            wakeupViewWidth.constant = 120
        } else {
            wakeupViewWidth.constant = 150
        }
        if (index%2) == 0 {
            profileView.backgroundColor = .meaningNavy
            profileLabel.textColor = .white
        } else {
            profileView.backgroundColor = .meaningLightblue
            profileLabel.textColor = .gray1
        }
        contextLabel.lineSetting(kernValue: -0.56, lineSpacing: 10)
        contextLabel.textAlignment = .left
        
    }

}
