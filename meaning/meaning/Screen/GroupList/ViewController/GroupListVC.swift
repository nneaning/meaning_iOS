//
//  GroupListVC.swift
//  meaning
//
//  Created by Seri Park on 2021/01/03.
//

import UIKit

class GroupListVC: UIViewController {
    static let identifier = "GroupListVC"
    
    // MARK: - Variable Part
    var groupInfo: [Group] = []
    var groupTable: [GroupTable] = []
    
    var groupExist: Bool = true
    
    lazy var refreshControl: UIRefreshControl = {
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.meaningNavy
        
        return refreshControl
    }()
    
    // MARK: - IBOutlet
    
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
    
    @IBOutlet var myGroupBoxView: UIView!
    @IBOutlet var myGroupBoxBtn: UIButton!
    @IBOutlet var myGroupNameLabel: UILabel!
    @IBOutlet var myGroupCountView: UIView!
    @IBOutlet var myGroupCountLabel: UILabel!
    @IBOutlet var myGroupArrowImg: UIImage!
    
    @IBOutlet var otherGroupView: UIView!
    @IBOutlet var otherGroupLabel: UILabel!
    
    @IBOutlet var groupCollectionView: UICollectionView!
    
    //MARK: - IBACtion
    

    @IBAction func goToMyGroupFeed(_ sender: Any) {
        // 내 그룹 피드로 이동
        let feedStoryboard = UIStoryboard.init(name: "GroupFeed", bundle: nil)
        guard let groupFeedTap = feedStoryboard.instantiateViewController(identifier: "GroupFeedVC") as? GroupFeedVC else {
            return
        }
        groupFeedTap.hidesBottomBarWhenPushed = true
        groupFeedTap.groupName = myGroupNameLabel.text
        self.navigationController?.pushViewController(groupFeedTap, animated: true)
        
    }
    @IBAction func goToGroupDetail(_ sender: Any) {
        //detailView 로 이동
        guard let groupDetailVC = self.storyboard?.instantiateViewController(identifier: "GroupDetailVC")
                as? GroupDetailVC else {
            return
        }
        groupDetailVC.modalPresentationStyle = .overCurrentContext
        groupDetailVC.modalTransitionStyle = .crossDissolve
        self.present(groupDetailVC, animated: true, completion: nil)
    }
    
    @IBAction func goToGroupCreate(_ sender: Any) {
        // 다음 뷰로 연결
        guard let groupCreateVC = self.storyboard?.instantiateViewController(identifier: "GroupCreateVC") as? GroupCreateVC else {
            return
        }
        groupCreateVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(groupCreateVC, animated: true)
    }
    
    
    // MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHeader()
        setGroupData()
        setGroupTableData()
        
        GroupTableView.addSubview(self.refreshControl)
        
        groupCollectionView.delegate = self
        groupCollectionView.dataSource = self
        
        GroupTableView.dataSource = self
        GroupTableView.delegate = self
        
        //my group 유무에 따른 분기 처리
        if groupExist == false {
            noGroupBoxView.isHidden = false
            myGroupBoxView.isHidden = true
            
        } else {
            myGroupBoxView.isHidden = false
            noGroupBoxView.isHidden = true
        }
        
    }
}

// MARK: - Extension

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
        noGroupLabel.lineSetting(kernValue: -0.6)
        
        welcomeLabel.text = "그룹에 가입하고 그룹원들과 함께 미라클 모닝을 맞이해봐요!"
        welcomeLabel.font = UIFont.spoqaRegular(size: 14)
        welcomeLabel.textColor = UIColor.gray3
        welcomeLabel.lineSetting(kernValue: -0.56)
        
        myGroupBoxView.backgroundColor = UIColor.meaningLightblue
        
        myGroupNameLabel.text = "아침마다 불넹면"
        myGroupNameLabel.font = UIFont.spoqaRegular(size: 16)
        myGroupNameLabel.textColor = UIColor.meaningNavy
        
        myGroupCountView.layer.cornerRadius = 5.0
        
        myGroupCountLabel.text = "8/8"
        myGroupCountLabel.font = UIFont.spoqaMedium(size: 13)
        myGroupCountLabel.textColor = UIColor.meaningNavy
        
        otherGroupLabel.text = "다른 그룹 구경하기"
        otherGroupLabel.font = UIFont.spoqaMedium(size: 18)
        otherGroupLabel.textColor = UIColor.gray1
    }
    
    func setGroupData() {
        //컬렉션 뷰에 들어가는 임시 데이터
        groupInfo.append(contentsOf: [
            Group(headerImage: "group_card4_img", groupName: "넹면", peopleCount: 12),
            Group(headerImage: "group_card4_img", groupName: "넹면", peopleCount: 12),
            Group(headerImage: "group_card4_img", groupName: "넹면", peopleCount: 12),
            Group(headerImage: "group_card4_img", groupName: "넹면", peopleCount: 12)
        ])
    }
    
    func setGroupTableData() {
        //그룹 리스트에 들어가는 임시 데이터
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
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        //스크롤 내릴 때 refresh
        refreshControl.endRefreshing()
    }
}


extension GroupListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //컬렉션 뷰 Item 개수 지정
        return groupInfo.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //CollectionView의 IndexPath 별 Cell 지정
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupCell.identifier, for: indexPath) as? GroupCell else {
            return UICollectionViewCell()
        }
        cell.setCell(group: groupInfo[indexPath.row])
        
        //cell 테두리 설정
        cell.layer.borderColor = UIColor.gray5.cgColor
        cell.layer.borderWidth = 1.0
        cell.layer.cornerRadius = 8.0
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //collection view 셀 클릭 시 groupDetail로 이동
        guard let groupDetailVC = self.storyboard?.instantiateViewController(identifier: "GroupDetailVC")
                as? GroupDetailVC else {
            return
        }
        groupDetailVC.modalPresentationStyle = .overCurrentContext
        groupDetailVC.modalTransitionStyle = .crossDissolve
        self.present(groupDetailVC, animated: true, completion: nil)
        
    }
    
    
}

extension GroupListVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //cell의 width, height 지정
        return CGSize(width: 217/375 * self.view.frame.width, height: 182)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //cell 위아래 간격 지정
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        //cell 좌우 간격 지정
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        //content 인셋 지정
        return UIEdgeInsets(top: 8, left: 17, bottom: 0, right: 0)
    }
    
}

extension GroupListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //테이블 뷰 Item 개수 지정
        return groupTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //tableView의 IndexPath 별 Cell 지정
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.identifier)
                as? GroupTableViewCell else {
            return UITableViewCell()
        }
        cell.setCell(group: groupTable[indexPath.row])
        return cell
        
    }
}


extension GroupListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let groupDetailVC = self.storyboard?.instantiateViewController(identifier: "GroupDetailVC")
                as? GroupDetailVC else {
            return
        }
        groupDetailVC.modalPresentationStyle = .overCurrentContext
        groupDetailVC.modalTransitionStyle = .crossDissolve
        self.present(groupDetailVC, animated: true, completion: nil)
    }
}
