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
    var groupTable: [GroupTable] = []
    
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
    
    @IBOutlet var otherGroupView: UIView!
    @IBOutlet var otherGroupLabel: UILabel!
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHeader()
        setGroupData()
        setGroupTableData()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        GroupTableView.dataSource = self
        
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
        
        otherGroupLabel.text = "다른 그룹 구경하기"
        otherGroupLabel.font = UIFont.spoqaMedium(size: 18)
        otherGroupLabel.textColor = UIColor.gray1
        
        
    }
    
    func setGroupData() {
        groupInfo.append(contentsOf: [
            Group(imageName: "group_card4_img", groupName: "넹면", peopleCount: 12),
            Group(imageName: "group_card4_img", groupName: "넹면", peopleCount: 12),
            Group(imageName: "group_card4_img", groupName: "넹면", peopleCount: 12),
            Group(imageName: "group_card4_img", groupName: "넹면", peopleCount: 12)
        ])
    }
    
    func setGroupTableData() {
        groupTable.append(contentsOf: [
            GroupTable(groupName: "비빔냉면", peopleCount: 11, peopleLimit: 14),
            GroupTable(groupName: "비빔냉면", peopleCount: 11, peopleLimit: 14),
            GroupTable(groupName: "비빔냉면", peopleCount: 11, peopleLimit: 14),
            GroupTable(groupName: "비빔냉면", peopleCount: 11, peopleLimit: 14),
            GroupTable(groupName: "비빔냉면", peopleCount: 11, peopleLimit: 14),
            GroupTable(groupName: "비빔냉면", peopleCount: 11, peopleLimit: 14),
            GroupTable(groupName: "비빔냉면", peopleCount: 11, peopleLimit: 14)
        ])
    }
}


extension GroupListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return groupInfo.count
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
        return CGSize(width: 217/375 * self.view.frame.width, height: 182)}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 26) }
    
    
}

extension GroupListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.identifier)
                as? GroupTableViewCell else {
            return UITableViewCell()
        }
        cell.setCell(group: groupTable[indexPath.row])
        return cell
        
    }
    
    
}

