//
//  TimeStampVC.swift
//  meaning
//
//  Created by 김민희 on 2021/01/02.
//

import UIKit

class TimeStampVC: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var stampBorderView: UIView!
    @IBOutlet weak var stampTimeLabel: UILabel!
    @IBOutlet weak var stampDateLabel: UILabel!
    @IBOutlet weak var stampLogoImage: UIImageView!
    
    @IBOutlet weak var cancleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
