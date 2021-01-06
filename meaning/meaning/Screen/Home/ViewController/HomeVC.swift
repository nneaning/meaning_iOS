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
        setList()
    }

}

// MARK: Extension

extension HomeVC {
    
    // MARK: Function
    
    func setList() {
        let mission1 = MissionCard(index: 1, ment: "타임카메라로\n미라클 모닝 인증하기", imageName: "homeCard1")
        let mission2 = MissionCard(index: 2, ment: "타임카메라로\n미라클 모닝 인증하기", imageName: "homeCard2")
        let mission3 = MissionCard(index: 3, ment: "타임카메라로\n미라클 모닝 인증하기", imageName: "homeCard3")
        let mission4 = MissionCard(index: 4, ment: "타임카메라로\n미라클 모닝 인증하기", imageName: "homeCard4")
        
        cardList = [mission1,mission2,mission3,mission4]
    }
}
