//
//  MyPageFeedVC.swift
//  meaning
//
//  Created by 선민승 on 2021/01/07.
//

import UIKit

class MyPageFeedVC: UIViewController {
    
    // MARK: Variable Part
    
    var userNick: String = "이기상"

    
    // MARK: IBOutlet
    
    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var headerView: UIView!
    
    @IBOutlet var myProfileView: UIView!
    @IBOutlet var userNameInitial: UILabel!
    
    @IBOutlet var userNameLabel: UILabel!
    
    @IBOutlet var userWakeTimeView: UIView!
    @IBOutlet var userWakeTimeLabel: UILabel!
    
    @IBOutlet var feedHeaderView: UIView!
    @IBOutlet var feedHeaderLabel: UILabel!
    
    @IBOutlet var feedCollectionView: UICollectionView!
    
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        
        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 120, height: 120)
        feedCollectionView.collectionViewLayout = layout
        feedCollectionView.register(FeedCollectionViewCell.nib(), forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
        feedCollectionView.delegate = self
        feedCollectionView.dataSource = self
    }
    
    override func viewWillLayoutSubviews() {
        self.myProfileView.setRounded(radius: nil)
        self.myProfileView.backgroundColor = .meaningLightblue
    }
    
    // MARK: Layout
    
    func setLayout() {
        
        let initial: String = String(self.userNick.prefix(1))
        
        self.view.backgroundColor = UIColor.meaningWhite
        self.headerView.backgroundColor = UIColor.meaningWhite
        
        self.headerLabel.font = UIFont.notoMedium(size: 17.0)
        self.headerLabel.text = "마이 피드"
        self.headerLabel.textColor = UIColor.gray1
 
        
        self.userNameInitial.text = initial
        self.userNameInitial.font = .spoqaMedium(size: 30)
        self.userNameInitial.textColor = .meaningNavy
        self.userNameInitial.textAlignment = .center
        self.userNameInitial.adjustsFontSizeToFitWidth = true
        
        //랜덤하게
        // self.myProfileView.backgroundColor = .meaningNavy
        // self.userNameInitial.textColor = .meaningIvory
        
        self.userNameLabel.text = userNick
        self.userNameInitial.font = .spoqaMedium(size: 16)
        self.userNameInitial.textColor = .gray1
        self.userNameLabel.lineSetting(kernValue: -0.64)
        
        self.userWakeTimeView.setBorder(borderColor: .skyBlue, borderWidth: 1)
        self.userWakeTimeView.setRounded(radius: 13.5)
        self.userWakeTimeView.backgroundColor = .meaningWhite
        
        self.userWakeTimeLabel.text = "매일 오전 5시 기상"
        self.userWakeTimeLabel.textColor = .skyBlue
        self.userWakeTimeLabel.font = .spoqaMedium(size: 13)
        self.userWakeTimeLabel.lineSetting(kernValue: -0.52)
        self.userWakeTimeLabel.textAlignment = .center
        
        self.feedHeaderView.backgroundColor = .meaningLightblue
        self.feedHeaderLabel.text = "오늘은 365일 중에 30번째 의미있는 아침입니다."
        self.feedHeaderLabel.font = .spoqaMedium(size: 14)
        self.feedHeaderLabel.lineSetting(kernValue: -0.56)
        self.feedHeaderLabel.textAlignment = .center
        
        
    }
    
}

extension MyPageFeedVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("tapped")
    }
}

extension MyPageFeedVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 36
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as! FeedCollectionViewCell
        
        cell.configure(with: UIImage(named: "test_img")!)
        
        return cell
    }
    
    
}


extension MyPageFeedVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width/3
        return CGSize(width: width-0.5, height: width-0.5)
    }
    
    //전체 적으로 좌우상하 inset
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 0, bottom: 0, right: 0)
    }

    //한 줄에서 아이템 좌우 사이 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }

    // 한 줄씩 사이의 거리
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    
    
}

