
//
//  TabBarVC.swift
//  meaning
//
//  Created by Seri Park on 2021/01/03.
//

import UIKit

class TabBarVC: UITabBarController {
    
// MARK: - Variable Part
    
    var cameraButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named:"navItemCamera"), for: .normal)
        button.addTarget(self, action: #selector(TabBarVC.buttonClicked(sender:)), for: .touchUpInside)
        return button
    }()
    
// MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonClicked(sender: cameraButton)
        setTabBar()
    }
    
}

// MARK: - Extension

extension TabBarVC {
    
    @objc func buttonClicked(sender : UIButton) {
        //버튼 클릭 시 CameraVC 이동
        let homeStoryboard = UIStoryboard.init(name: "Camera", bundle: nil)
        guard let cameraNaviVC = homeStoryboard.instantiateViewController(identifier: "CameraNavigationController") as? CameraNavigationController
        else {
            return
        }
        cameraNaviVC.modalPresentationStyle = .fullScreen
        present(cameraNaviVC, animated: true, completion: nil)
    }
    
    
    func setTabBar() {
        //탭바 설정
        let homeStoryboard = UIStoryboard.init(name: "Home", bundle: nil)
        
        guard let homeVC = homeStoryboard.instantiateViewController(identifier: "HomeNavigationController") as? HomeNavigationController else {
            return
        }
        
        let groupStoryboard = UIStoryboard.init(name: "GroupList", bundle: nil)
        guard let groupVC = groupStoryboard.instantiateViewController(identifier: "GroupListNavigationController") as? GroupListNavigationController else {
            return
        }
        
        homeVC.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: -20, bottom: -5, right: 0)
        homeVC.tabBarItem.image = UIImage(named: "tabBarHomeIcInactive")
        homeVC.tabBarItem.selectedImage = UIImage(named: "tabBarHomeIcActive")
        homeVC.title = ""
        
        groupVC.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -5, right: -20)
        groupVC.tabBarItem.image = UIImage(named: "tabBarGroupIcInactive")
        groupVC.tabBarItem.selectedImage = UIImage(named: "tabBarGroupIcActive")
        groupVC.title = ""
        
        setViewControllers([homeVC, groupVC], animated: true)
        
        let width: CGFloat = 70/375 * self.view.frame.width
        let height: CGFloat = 70/375 * self.view.frame.width
        
        let posX: CGFloat = self.view.frame.width/2 - width/2
        let posY: CGFloat = -32
        
        cameraButton.frame = CGRect(x: posX, y: posY, width: width, height: height)
        
        tabBar.addSubview(self.cameraButton)
    }
    
}
