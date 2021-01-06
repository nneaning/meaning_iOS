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
        let mission1 = MissionCard(imageName: "")
        let mission2 = MissionCard(imageName: "")
        let mission3 = MissionCard(imageName: "")
        let mission4 = MissionCard(imageName: "")
        
        cardList = [mission1,mission2,mission3,mission4]
    }
}
