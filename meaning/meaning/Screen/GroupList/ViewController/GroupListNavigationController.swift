//
//  GroupListNavigationController.swift
//  meaning
//
//  Created by 김민희 on 2021/01/09.
//

import UIKit

class GroupListNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupFullWidthBackGesture()

        // Do any additional setup after loading the view.
    }
    private lazy var fullWidthBackGestureRecognizer = UIPanGestureRecognizer()

        private func setupFullWidthBackGesture() {
            guard
                let interactivePopGestureRecognizer = interactivePopGestureRecognizer,
                let targets = interactivePopGestureRecognizer.value(forKey: "targets")
            else {
                return
            }
            fullWidthBackGestureRecognizer.setValue(targets, forKey: "targets")
            fullWidthBackGestureRecognizer.delegate = self
            view.addGestureRecognizer(fullWidthBackGestureRecognizer)
        }
    
}

extension GroupListNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let isSystemSwipeToBackEnabled = interactivePopGestureRecognizer?.isEnabled == true
        let isThereStackedViewControllers = viewControllers.count > 1
        return isSystemSwipeToBackEnabled && isThereStackedViewControllers
    }
}
