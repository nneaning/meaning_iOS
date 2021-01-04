//
//  GroupListVC.swift
//  meaning
//
//  Created by Seri Park on 2021/01/03.
//

import UIKit

class GroupListVC: UIViewController {
    
    static let identifier = "GroupListVC"
    
    var groupInfo: [Group] = []
    
    @IBOutlet var logoView: UIView!
    @IBOutlet var GroupTableView: UITableView!
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var myGroupView: UIView!
    @IBOutlet var myGroupLabel: UILabel!
    @IBOutlet var groupAddLabel: UILabel!
    @IBOutlet var groupAddBtn: UIButton!
    
    @IBOutlet var noGroupBoxView: UIView!
    @IBOutlet var noGroupLabel: UILabel!
    @IBOutlet var welcomeLabel: UILabel!
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHeader()
        setGroupData()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
}

extension GroupListVC {
    func setHeader() {
        //테이블뷰 헤더에 들어가는 라벨들 설정
        myGroupLabel.text = "내그룹"
        myGroupLabel.font = UIFont.spoqaMedium(size: 18)
        myGroupLabel.textColor = UIColor.gray1
        
        groupAddLabel.text = "그룹 생성"
        groupAddLabel.font = UIFont.spoqaMedium(size: 14)
        groupAddLabel.textColor = UIColor.meaningNavy
        
        noGroupBoxView.backgroundColor = UIColor.meaningLightblue
        
        noGroupLabel.text = "가입하신 그룹이 없네요!"
        noGroupLabel.font = UIFont.spoqaMedium(size: 15)
        noGroupLabel.textColor = UIColor.meaningNavy
        
        welcomeLabel.text = "그룹에 가입하고 그룹원들과 함께 미라클 모닝을 맞이해봐요!"
        welcomeLabel.font = UIFont.spoqaRegular(size: 14)
        welcomeLabel.textColor = UIColor.gray3
    }
    
    func setGroupData() {
            groupInfo.append(contentsOf: [
                Group(groupName: "넹면", peopleCount: 12, imageName: "group_card4_img"),
                Group(groupName: "넹면", peopleCount: 12, imageName: "group_card4_img"),
                Group(groupName: "넹면", peopleCount: 12, imageName: "group_card4_img"),
                Group(groupName: "넹면", peopleCount: 12, imageName: "group_card4_img")
            ])
        }
    }
    

extension GroupListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: GroupHeaderCell.identifier, for: indexPath) as! GroupHeaderCell
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupCell.identifier, for: indexPath) as? GroupCell else {
            return UICollectionViewCell()
        }
        cell.setCell(group: groupInfo[indexPath.row])
        cell.layer.borderColor = UIColor.gray5.cgColor
        cell.layer.borderWidth = 1.0
        cell.layer.cornerRadius = 8.0
        
        return cell
    }
    
    
}

extension GroupListVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 217/375 * self.view.frame.width, height: 182)
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) }
    
}

//    if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//        layout.scrollDirection = .horizontal
//    }


}
