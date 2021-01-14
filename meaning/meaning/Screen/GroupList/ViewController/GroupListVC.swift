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
    
    var groupListData: GroupListData?
    var myGroupData: MyGroupData?
    var myGroupName: String?
    var peopleCount: Int?
    var peopleLimit: Int?
    
    lazy var refreshControl: UIRefreshControl = {
        //새로고침
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.meaningNavy
        
        return refreshControl
    }()
    
    // MARK: - IBOutlet
    
    @IBOutlet var logoView: UIView!
    @IBOutlet var groupTableView: UITableView!
    
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
        if let mygroup = myGroupData {
            groupFeedTap.groupNumber = mygroup.groupID // 그룹 아이디 전달
            groupFeedTap.groupPersonCount = mygroup.countMember // 그룹 멤버 수 전달
        }
            
        self.navigationController?.pushViewController(groupFeedTap, animated: true)
    }

    
    @IBAction func goToGroupCreate(_ sender: Any) {
        //groupCreate 로 이동
        guard let groupCreateVC = self.storyboard?.instantiateViewController(identifier: "GroupCreateVC") as? GroupCreateVC else {
            return
        }
        groupCreateVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(groupCreateVC, animated: true)
    }
    
    
    // MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        setHeader()
        
        groupTableView.addSubview(self.refreshControl)
        groupTableView.separatorStyle = .none
        
        groupCollectionView.delegate = self
        groupCollectionView.dataSource = self
        
        groupTableView.dataSource = self
        groupTableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        groupList(token: UserDefaults.standard.string(forKey: "accesstoken")!)
        checkMyGroup(UserDefaults.standard.string(forKey: "accesstoken")!)
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
    
        myGroupNameLabel.font = UIFont.spoqaRegular(size: 16)
        myGroupNameLabel.textColor = UIColor.meaningNavy
        
        myGroupCountView.layer.cornerRadius = 5.0
    
        myGroupCountLabel.text = "3/5"
        myGroupCountLabel.font = UIFont.spoqaMedium(size: 13)
        myGroupCountLabel.textColor = UIColor.meaningNavy
        
        otherGroupLabel.font = UIFont.spoqaMedium(size: 18)
        otherGroupLabel.textColor = UIColor.gray1
        
        // 그룹이 없는게 default
        self.noGroupBoxView.isHidden = false
        self.myGroupBoxView.isHidden = true
    }
    
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        //스크롤 내릴 때 refresh
        groupList(token: UserDefaults.standard.string(forKey: "accesstoken")!)
        checkMyGroup(UserDefaults.standard.string(forKey: "accesstoken")!)
        // 값이 바꼈다면 받아오기 위해 다시 서버 연결
        refreshControl.endRefreshing()
    }
    
    func checkMyGroup(_ token: String) {
        APIService.shared.myGroup(token) { [self] result in
                switch result {
                case .success(let data):
                    // 값이 들어온다는건 그룹이 있다는 뜻!
                    self.myGroupData = data
                    
                    self.myGroupBoxView.isHidden = false
                    self.noGroupBoxView.isHidden = true
                    
                    if let mygroup = self.myGroupData {
                        self.myGroupNameLabel.text = mygroup.groupName
                        self.myGroupCountLabel.text = "\(mygroup.countMember)/\(mygroup.maximumMemberNumber)"
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func groupList(token: String) {
        APIService.shared.groupList(token: token) { result in
            switch result {
            case .success(let data):
                
                self.groupListData = data
                
                self.groupCollectionView.reloadData()
                self.groupTableView.reloadData()
                
            case .failure(_):
                print("FailureError")
            }
        }
    }
    
    
}


extension GroupListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //컬렉션 뷰 Item 개수 지정
        return groupListData?.hasImageGroupList.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //CollectionView의 IndexPath 별 Cell 지정
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupCollectionCell.identifier, for: indexPath) as? GroupCollectionCell else {
            return UICollectionViewCell()
        }
    
        cell.setCell()
        
        cell.groupImg.setImage(from: groupListData?.hasImageGroupList[indexPath.row].imageURL ?? "")
        cell.groupNameLabel.text = groupListData?.hasImageGroupList[indexPath.row].groupName
        cell.peopleCountLabel.text = "\(groupListData?.hasImageGroupList[indexPath.row].countMember ?? 0)명이 함께하고 있어요."
        
        if let text = cell.peopleCountLabel.text {
            // "\(group.peopleCount)명" 부분에만 폰트를 다르게 설정
            let attributedStr = NSMutableAttributedString(string: cell.peopleCountLabel.text ?? "")
            
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String),
                                       value: UIFont.spoqaBold(size: 13), range: (text as NSString).range(of: "\(groupListData?.hasImageGroupList[indexPath.row].countMember ?? 0)명"))
            
            attributedStr.addAttribute(.foregroundColor, value: UIColor.meaningNavy, range: (cell.peopleCountLabel.text! as NSString).range(of: "\(groupListData?.hasImageGroupList[indexPath.row].countMember ?? 0)명"))
            
            cell.peopleCountLabel.attributedText = attributedStr
        }
        
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
        
        groupDetailVC.groupID = groupListData?.hasImageGroupList[indexPath.item].groupID ?? -1
        
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
        return groupListData?.noImageGroupList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //tableView의 IndexPath 별 Cell 지정
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.identifier)
                as? GroupTableViewCell else {
            return UITableViewCell()
        }
        cell.groupName.text = groupListData?.noImageGroupList[indexPath.row].groupName
        cell.peopleCountLabel.text = "\(groupListData?.noImageGroupList[indexPath.row].countMember ?? 0)/\(groupListData?.noImageGroupList[indexPath.row].maximumMemberNumber ?? 0)"
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
}


extension GroupListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //테이블 뷰 셀 클릭 시 GroupDetailVC로 이동
        guard let groupDetailVC = self.storyboard?.instantiateViewController(identifier: "GroupDetailVC")
                as? GroupDetailVC else {
            return
        }
        
        groupDetailVC.groupID = groupListData?.hasImageGroupList[indexPath.item].groupID ?? -1
        
        groupDetailVC.modalPresentationStyle = .overCurrentContext
        groupDetailVC.modalTransitionStyle = .crossDissolve
        self.present(groupDetailVC, animated: true, completion: nil)
    }
}


