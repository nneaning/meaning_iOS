//
//  DailyMaximVC.swift
//  meaning
//
//  Created by 선민승 on 2021/01/02.
//

import UIKit

class DailyMaximVC: UIViewController {
    
    // Mark: IBOutlet
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var headerLabel: UILabel!
    
    @IBOutlet var bodyUpperLabel: UILabel!
    
    @IBOutlet var bodyView: UIView!
    @IBOutlet var bodyViewLabel: UILabel!
    
    @IBOutlet var bodyBottomLabel: UILabel!
    
    @IBOutlet var ReadComplete: UIButton!
    
    // Mark: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    // MARK: Layout
    
    func setLayout() {
        self.view.backgroundColor = UIColor.meaningLightblue
        self.headerView.backgroundColor = UIColor.meaningLightblue
        self.headerLabel.font = UIFont.notoMedium(size: 17.0)
        self.headerLabel.text = "하루 다짐"
        
        self.bodyUpperLabel.font = UIFont.notoRegular(size: 18.0)
        self.bodyUpperLabel.textColor=UIColor.gray2
        self.bodyUpperLabel.text = "하루의 시작부터 글귀를 읽으며\n성장과 발전의 의지를 다져요"
        
        self.bodyView.setRounded(radius: 8)
        self.bodyViewLabel.text = "평범한 사람들은 가능한 것만 믿는다.\n특별한 사람들은 불가능한 것을 그려본다.\n그리고 그것을 가능한 것으로 보기 시작한다."
        self.bodyViewLabel.font = UIFont.nanumRegular(size: 18)
        self.bodyViewLabel.setLineSpacing(lineSpacing: 10)
        self.bodyViewLabel.textAlignment = NSTextAlignment.center
        self.bodyViewLabel.addCharacterSpacing(kernValue: -0.5)

        self.bodyBottomLabel.font = UIFont.notoRegular(size: 15.0)
        self.bodyBottomLabel.textColor=UIColor.gray3
        self.bodyBottomLabel.text = "3번 반복해서 읽어주세요."

        self.ReadComplete.backgroundColor = UIColor.meaningNavy
        self.ReadComplete.setTitleColor(UIColor.meaningWhite, for: .normal)
        self.ReadComplete.titleLabel?.font=UIFont.spoqaMedium(size: 16)
        self.ReadComplete.setTitle("다 읽었어요", for: .normal)
        self.ReadComplete.setRounded(radius: 6)
    }
    
    
}

// Mark: Extension


extension UILabel {
    func addCharacterSpacing(kernValue: Double = 1.15) {
        if let labelText = text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
    
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {
        
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // (Swift 4.2 and above) Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
}
