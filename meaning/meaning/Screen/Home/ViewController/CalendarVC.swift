//
//  CalendarVC.swift
//  meaning
//
//  Created by 김민희 on 2021/01/11.
//

import UIKit

class CalendarVC: UIViewController {

    // MARK: Variable Part
    
    var calendarDate: CalendarData?
    var nick: String = UserDefaults.standard.string(forKey: "userNick")!
    var countTime: Int = 0
    var month: Int = 1
    
    // MARK: IBOutlet
    
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var calendarBackView: UIView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var calendarCollectionView: UICollectionView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    
    // MARK: IBAction
    
    @IBAction func dateButtonDidTap(_ sender: Any) {
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.popViewController(animated: false)
    }
    
    
    @IBAction func mypageButtonDidTap(_ sender: Any) {
        let mypageStoryboard = UIStoryboard.init(name: "MyPage", bundle: nil)
        guard let mypageVC = mypageStoryboard.instantiateViewController(identifier: "MyPageFeedVC") as? MyPageFeedVC else {
            return
        }
        mypageVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(mypageVC, animated: true)
    }
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setCalendar()
        updateCalendar(token: UserDefaults.standard.string(forKey: "accesstoken")!)
        // 토큰 넣기(88)
    }
    
    override func viewWillLayoutSubviews() {
        // 홈버튼이 있는 phone은 더 붙게 수정해줌
        if self.view.safeAreaInsets.bottom == 49 {
            bottomConstraint.constant = 25
        }
    }
    
}

// MARK: Extension

extension CalendarVC {
    
    // MARK: Function
    
    func setView() {
        
        self.view.backgroundColor = .meaningIvory
        
        setMent()
        
        dateButton.makeRounded(cornerRadius: 15)
        dateButton.setTitle("\(Date().datePickerToString().recordDate()) >", for: .normal)
        dateButton.titleLabel?.font = UIFont.spoqaRegular(size: 14)
        dateButton.backgroundColor = .meaningNavy
        dateButton.setTitleColor(.white, for: .normal)
    }
    
    func setCalendar() {
        calendarBackView.setRounded(radius: 6)
        circleView.setRounded(radius: nil)
        monthLabel.text = "\(month)월"
        monthLabel.font = UIFont.spoqaRegular(size: 14)
        monthLabel.textColor = .white
        calendarCollectionView.dataSource = self
        calendarCollectionView.delegate = self
        calendarCollectionView.backgroundColor = .none
    }
    
    func setMent() {
        // 멘트 설정
        explainLabel.text = "오늘은\n\(nick)님의 \(countTime)번째\n의미있는 아침입니다."
        explainLabel.textColor = .meaningNavy
        explainLabel.font = UIFont.spoqaLight(size: 22)
        explainLabel.numberOfLines = 0
        
        if let text = explainLabel.text {
            
            let attributedStr = NSMutableAttributedString(string: explainLabel.text ?? "")
            // 닉네임 부분에 폰트를 다르게 설정
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: UIFont.spoqaMedium(size: 22), range: (text as NSString).range(of: nick))
            // ~번째 부분에 폰트를 다르게 설정
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: UIFont.spoqaMedium(size: 22), range: (text as NSString).range(of: "\(countTime)번째"))

            explainLabel.attributedText = attributedStr
        }
        explainLabel.lineSetting(kernValue: -0.88, lineSpacing: 10)
        explainLabel.textAlignment = .left
    }
    
    func updateCalendar(token: String) {
        // 캘린더 데이터 서버에서 연동
        APIService.shared.calendarDay(token: token) { [self] result in
                switch result {
                case .success(let data):
                    self.calendarDate = data
                    if let calendarDate = calendarDate {
                        countTime = calendarDate.successDays
                        setMent()
                    }
                    calendarCollectionView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
    }

}

extension CalendarVC: UICollectionViewDataSource {
    // CollectionView 데이터 넣기
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 31
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let calendarCell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCell.identifier, for: indexPath) as? CalendarCell else {
            return UICollectionViewCell()
        }
        if let calendarDate = calendarDate {
            calendarCell.setCell(calendarDate.calendar[indexPath.row], indexs: indexPath.row)
        }
        return calendarCell
    }
}

extension CalendarVC: UICollectionViewDelegateFlowLayout {
    // CollectionView 크기 잡기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 한 줄에 7개씩 나열
        return CGSize(width: self.calendarCollectionView.frame.width/7, height:self.calendarCollectionView.frame.height/5)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
}

extension APIService {
    
    func calendarDay(token: String, completion: @escaping (NetworkResult<CalendarData>)->(Void)) {
        let target: APITarget = .calendarDay(token: token)
        judgeObject(target, completion: completion)
    }
    
}
