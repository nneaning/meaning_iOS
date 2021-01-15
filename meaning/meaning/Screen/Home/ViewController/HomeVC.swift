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
    
    // MARK: IBAction
    
    @IBAction func mypageButtonDidTap(_ sender: Any) {
        // 마이페이지 버튼 클릭 시 Action
        
        let mypageStoryboard = UIStoryboard.init(name: "MyPage", bundle: nil)
        guard let mypageVC = mypageStoryboard.instantiateViewController(identifier: "MyPageFeedVC") as? MyPageFeedVC else {
            return
        }
        mypageVC.hidesBottomBarWhenPushed = true
        // 탭바 숨기기
        self.navigationController?.pushViewController(mypageVC, animated: true)
        // navigation을 통해 마이페이지로 이동
    }
    
    
    @IBAction func dateButtonDidTap(_ sender: Any) {
        // 날짜 버튼 클릭 시 Action
        
        guard let calendarVC = self.storyboard?.instantiateViewController(identifier: "CalendarVC") as? CalendarVC else {
            return
        }
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(calendarVC, animated: false)
        // Fade 애니메이션을 통해 Calendar가 보여지는 화면으로 이동
    }
    
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
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true

        let today: String = Date().datePickerToString().recordDate()
        if UserDefaults.standard.string(forKey: "lastEnterHome") != today {
            // 오늘 처음 들어온것이라면?
            UserDefaults.standard.setValue(today, forKey: "lastEnterHome")
            // 오늘 날짜를 저장해준다. 이 날짜는 미션을 재로드 하는데 사용된다.
            for i in 0...3 {
                NotificationCenter.default.addObserver(self, selector: #selector(missionClear(_:)), name: .clearMissionOne, object: nil)
                // 미션1이 초기화 됐을 때 Observer를 살림
                UserDefaults.standard.setValue(false, forKey: "card\(i)")
                // 새로운 날이 시작됐다면 미션 카드를 초기화 시켜준다.
            }
        }
        missonCardCollectionView.reloadData()

    }

}

// MARK: Extension

extension HomeVC {
    
    // MARK: Function
    
    func setView() {
        // View Style Function
        
        self.view.backgroundColor = .meaningIvory
        
        explainLabel.text = "좋은 아침입니다!\n순서대로 기상미션을\n수행해볼까요?"
        explainLabel.textColor = .meaningNavy
        explainLabel.font = UIFont.spoqaLight(size: 22)
        explainLabel.numberOfLines = 0
        
        if let text = explainLabel.text {
            // "좋은 아침입니다!" 부분에만 폰트를 다르게 설정
            
            let attributedStr = NSMutableAttributedString(string: text)
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: UIFont.spoqaMedium(size: 22), range: (text as NSString).range(of: "좋은 아침입니다!"))

            explainLabel.attributedText = attributedStr
        }
        
        explainLabel.lineSetting(kernValue: -0.88, lineSpacing: 10)
        explainLabel.textAlignment = .left
        
        dateButton.makeRounded(cornerRadius: 15)
        dateButton.layer.borderColor = UIColor.meaningNavy.cgColor
        dateButton.layer.borderWidth = 1
        dateButton.setTitle("\(Date().datePickerToString().recordDate()) >", for: .normal)
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
        // mission card setting function
        
        let mission1 = MissionCard(index: 1, ment: "타임카메라로\n미라클 모닝 인증하기", imageName: "homeCard1")
        let mission2 = MissionCard(index: 2, ment: "오늘 하루\n다짐하기", imageName: "homeCard2")
        let mission3 = MissionCard(index: 3, ment: "감사회고\n일기쓰기", imageName: "homeCard3")
        let mission4 = MissionCard(index: 4, ment: "짧은\n독서 하기", imageName: "homeCard4")
        
        cardList = [mission1,mission2,mission3,mission4]
    }
    
    @objc func missionClear(_ notification: Notification) {
        // 미션 1번(타임스탬프)이 완료되었을 때 notification이 실행할 함수
        
        showToast(message : "사진 등록이 완료되었어요", font: UIFont.spoqaRegular(size: 14), width: 180, bottomY: 80)
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
        if UserDefaults.standard.bool(forKey: "card\(indexPath.row)") == true {
            // 미션 완료
            missionCardCell.setEndCard(cardList[indexPath.row], safeArea: Int(self.view.safeAreaInsets.bottom))
        } else {
            // 미션 미완료
            missionCardCell.setCard(cardList[indexPath.row], safeArea: Int(self.view.safeAreaInsets.bottom))
        }
        // ment 위치 조정을 위해 safeAreaInsets을 보내줌
        return missionCardCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cameraStoryboard = UIStoryboard.init(name: "Camera", bundle: nil)
        let missionStoryboard = UIStoryboard.init(name: "Mission", bundle: nil)
        
        if indexPath.row == 0 { // 타임카메라
            
            if UserDefaults.standard.bool(forKey: "card0") == false {
                // 이미 했던 카드가 아니여야지 다음 뷰로 이동
                guard let cameraTap = cameraStoryboard.instantiateViewController(identifier: "TimeStampVC") as? TimeStampVC else {
                    return
                }
                cameraTap.hidesBottomBarWhenPushed = true
                cameraTap.rootView = "mission"
                self.navigationController?.pushViewController(cameraTap, animated: true)
            }
            
        } else if indexPath.row == 1 { // 하루다짐
            
            if UserDefaults.standard.bool(forKey: "card1") == false {
                if UserDefaults.standard.bool(forKey: "card0") == false {
                    showToast(message : "순서대로 미션을 완료해주세요", font: UIFont.spoqaRegular(size: 14), width: 200, bottomY: 80)
                } else {
                    NotificationCenter.default.removeObserver(self, name: .clearMissionOne, object: nil)
                    // 미션1번의 Observer를 제거해줌
                    
                    guard let dailyMaxTap = missionStoryboard.instantiateViewController(identifier: "DailyMaximVC") as? DailyMaximVC else {
                        return
                    }
                    dailyMaxTap.missionDelegate = self
                    // missionDelegate을 채택해줌
                    dailyMaxTap.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(dailyMaxTap, animated: true)
                }
            }
            
        } else if indexPath.row == 2 { // 감사회고
            
            if UserDefaults.standard.bool(forKey: "card2") == false {
                if UserDefaults.standard.bool(forKey: "card0") == false || UserDefaults.standard.bool(forKey: "card1") == false {
                    showToast(message : "순서대로 미션을 완료해주세요", font: UIFont.spoqaRegular(size: 14), width: 200, bottomY: 80)
                } else {
                    guard let dailyDiaryTap = missionStoryboard.instantiateViewController(identifier: "DailyDiaryVC") as? DailyDiaryVC else {
                        return
                    }
                    dailyDiaryTap.missionDelegate = self
                    dailyDiaryTap.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(dailyDiaryTap, animated: true)
                }
            }
            
        } else if indexPath.row == 3 { // 짧은 독서
            
            if UserDefaults.standard.bool(forKey: "card3") == false {
                if UserDefaults.standard.bool(forKey: "card0") == false || UserDefaults.standard.bool(forKey: "card1") == false || UserDefaults.standard.bool(forKey: "card2") == false {
                    showToast(message : "순서대로 미션을 완료해주세요", font: UIFont.spoqaRegular(size: 14), width: 200, bottomY: 80)
                } else {
                    guard let shortReadingTap = missionStoryboard.instantiateViewController(identifier: "ShortReadingVC") as? ShortReadingVC else {
                        return
                    }
                    shortReadingTap.missionDelegate = self
                    shortReadingTap.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(shortReadingTap, animated: true)
                }
            }
            
        }
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

extension HomeVC: MissionEndDelegate {
    // MissionEndDelegate 메소드 구현
    func MissionMent(didEndMission ment: String) {
        showToast(message : ment, font: UIFont.spoqaRegular(size: 14), width: 141, bottomY: 80)
    }
        
}

extension Notification.Name {
    // Observer 이름 등록
    static let clearMissionOne = Notification.Name("clearMissionOne")
}
