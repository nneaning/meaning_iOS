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
    

    @IBOutlet weak var bottomToCollectionView: NSLayoutConstraint!
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var missonCardCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setList()
    }
    override func viewWillLayoutSubviews() {
        if self.view.safeAreaInsets.bottom > 50 {
            // 홈버튼 없는 폰일때는 카드를 더 띄어주기 위한 조건문
            self.bottomToCollectionView.constant = 74
            missonCardCollectionView.reloadData()
        } else {
//            mentLabelCenter.constant = 10
        }
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
        explainLabel.lineSetting(kernValue: -0.88)
        explainLabel.textAlignment = .left
        
        dateButton.isEnabled = false
        dateButton.makeRounded(cornerRadius: 15)
        dateButton.layer.borderColor = UIColor.meaningNavy.cgColor
        dateButton.layer.borderWidth = 1
        dateButton.setTitle(Date().datePickerToString().recordDate(), for: .normal)
        dateButton.titleLabel?.font = UIFont.spoqaRegular(size: 14)
        dateButton.setTitleColor(.meaningNavy, for: .normal)
        
        missonCardCollectionView.backgroundColor = .none
        missonCardCollectionView.showsHorizontalScrollIndicator = false
        // 스크롤 안보이게 해두기
        missonCardCollectionView.delegate = self
        missonCardCollectionView.dataSource = self
        
        let customLayout = AnimationFlowLayout()
        missonCardCollectionView.collectionViewLayout = customLayout

    }
    
    func setList() {
        // CollectionView에 들어갈 데이터들
        let mission1 = MissionCard(index: 1, ment: "타임카메라로\n미라클 모닝 인증하기", imageName: "homeCard1")
        let mission2 = MissionCard(index: 2, ment: "오늘 하루\n다짐하기", imageName: "homeCard2")
        let mission3 = MissionCard(index: 3, ment: "감사회고\n일기쓰기", imageName: "homeCard3")
        let mission4 = MissionCard(index: 4, ment: "짧은\n독서 하기", imageName: "homeCard4")
        
        cardList = [mission1,mission2,mission3,mission4]
    }
}

extension HomeVC: UICollectionViewDataSource {
    // CollectionView 데이터 넣기
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let missionCardCell = collectionView.dequeueReusableCell(withReuseIdentifier: MissionCardCell.identifier, for: indexPath) as? MissionCardCell else {
            return UICollectionViewCell()
        }
        missionCardCell.setCard(cardList[indexPath.row], safeArea: Int(self.view.safeAreaInsets.bottom))
        // ment 위치 조정을 위해 safeAreaInsets을 보내줌
        return missionCardCell
    }
    
    
}
extension HomeVC: UICollectionViewDelegateFlowLayout {
    // CollectionView 크기 잡기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 250/375*self.view.frame.width, height: missonCardCollectionView.frame.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
}
