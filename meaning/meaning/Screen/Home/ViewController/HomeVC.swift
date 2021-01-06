//
//  HomeVC.swift
//  meaning
//
//  Created by 김민희 on 2021/01/06.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: Variable Part
    
    var cardList: [MissionCard] = []
    
    // MARK: IBOutlet
    
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var missonCardCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setList()
    }

}

// MARK: Extension

extension HomeVC {
    
    // MARK: Function
    
    func setView() {
        
        self.view.backgroundColor = .meaningIvory
        
        explainLabel.text = "좋은 아침입니다!\n순서대로 기상미션을\n수행해볼까요?"
        explainLabel.textColor = .meaningNavy
        explainLabel.font = UIFont.spoqaLight(size: 22)
        explainLabel.numberOfLines = 0
        
        if let text = explainLabel.text {
            // "좋은 아침입니다!" 부분에만 폰트를 다르게 설정
            let attributedStr = NSMutableAttributedString(string: explainLabel.text ?? "")
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: UIFont.spoqaMedium(size: 22), range: (text as NSString).range(of: "좋은 아침입니다!"))

            explainLabel.attributedText = attributedStr
        }
        
        dateButton.isEnabled = false
        dateButton.makeRounded(cornerRadius: 15)
        dateButton.layer.borderColor = UIColor.meaningNavy.cgColor
        dateButton.layer.borderWidth = 1
        dateButton.setTitle(Date().datePickerToString().recordDate(), for: .normal)
        dateButton.titleLabel?.font = UIFont.spoqaRegular(size: 14)
        dateButton.titleLabel?.lineSetting(kernValue: -0.88, lineSpacing: 20)
        dateButton.setTitleColor(.meaningNavy, for: .normal)
        
    }
    
    func setList() {
        let mission1 = MissionCard(index: 1, ment: "타임카메라로\n미라클 모닝 인증하기", imageName: "homeCard1")
        let mission2 = MissionCard(index: 2, ment: "타임카메라로\n미라클 모닝 인증하기", imageName: "homeCard2")
        let mission3 = MissionCard(index: 3, ment: "타임카메라로\n미라클 모닝 인증하기", imageName: "homeCard3")
        let mission4 = MissionCard(index: 4, ment: "타임카메라로\n미라클 모닝 인증하기", imageName: "homeCard4")
        
        cardList = [mission1,mission2,mission3,mission4]
    }
}

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let missionCardCell = collectionView.dequeueReusableCell(withReuseIdentifier: MissionCardCell.identifier, for: indexPath) as? MissionCardCell else {
            return UICollectionViewCell()
        }
        missionCardCell.setCard(cardList[indexPath.row])
        return missionCardCell
    }
    
    
}
