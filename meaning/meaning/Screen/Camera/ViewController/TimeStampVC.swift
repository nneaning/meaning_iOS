//
//  TimeStampVC.swift
//  meaning
//
//  Created by 김민희 on 2021/01/02.
//

import UIKit

import AVFoundation

class TimeStampVC: UIViewController {

    // MARK: Variable Part
    
    var captureSession: AVCaptureSession!
    // 실시간 캡쳐를 위한 세션
    var stillImageOutput: AVCapturePhotoOutput!
    // 캡쳐한 이미지를 출력
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    // 캡쳐된 비디오를 표시해주는 Layer
    var timeStampImage: UIImage?
    
    // MARK: IBOutlet
    
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var stampBorderView: UIView!
    @IBOutlet weak var stampTimeLabel: UILabel!
    @IBOutlet weak var stampDateLabel: UILabel!
    @IBOutlet weak var stampLogoImage: UIImageView!
    
    @IBOutlet weak var cancleButton: UIButton!
    
    // MARK: IBAction
    
    @IBAction func shootingButtonDidTap(_ sender: Any) {
        // 카메라 촬영 버튼 클릭 시 Action
        
        let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        // jpeg 파일 형식으로 format
        stillImageOutput.capturePhoto(with: settings, delegate: self)
        // AVCapturePhotoCaptureDelegate 위임
        
        // 다음 뷰로 연결하는 코드 추가 예정
    }
    
    @IBAction func cancleButtonDidTap(_ sender: Any) {
        // 취소 버튼 클릭 시 Action
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCameraView()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.captureSession.stopRunning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .high
        // 캡쳐 화질 high로 설정
        
        // default video 장치를 찾는다
        guard let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
            else {
                print("Unable to access back camera!")
                return
        }
        do {
            // 찾은 video 장치를 캡쳐 장치에 넣음
            let input = try AVCaptureDeviceInput(device: backCamera)
            stillImageOutput = AVCapturePhotoOutput()

            // 주어진 세션을 캡쳐에 사용할 수 있는지 + 세션에 추가할 수 있는지 먼저 파악한다
            if captureSession.canAddInput(input) && captureSession.canAddOutput(stillImageOutput) {
                // 주어진 입력을 추가한다
                captureSession.addInput(input)
                // 주어진 출력 추가
                captureSession.addOutput(stillImageOutput)
                setupLivePreview()
            }
        }
        catch let error  {
            print(error.localizedDescription)
        }
        
        // startRunning는 시간이 걸릴 수 있는 호출이므로 main queue가 방해되지 않게 serial queue에서 실행함
        DispatchQueue.global(qos: .userInitiated).async {
            // 세션 실행 시작
            self.captureSession.startRunning()
            // 콜백 클로저를 통해 세션실행이 시작하는 작업이 끝난다면
            // cameraView에 AVCaptureVideoPreviewLayer를 띄우게 만듦
            DispatchQueue.main.async {
                self.videoPreviewLayer.frame = self.cameraView.bounds
            }
        }
    }

}

// MARK: Extension

extension TimeStampVC {
    
    // MARK: Function
    
    func setCameraView() {
        // 카메라 뷰 Style Setting
        stampBorderView.setBorder(borderColor: .white, borderWidth: 1)
        stampBorderView.backgroundColor = .none
        
        stampTimeLabel.font = UIFont.nsLight(size: 70)
        stampTimeLabel.textColor = .white
        stampDateLabel.font = UIFont.spoqaRegular(size: 16)
        stampDateLabel.textColor = .white
        nowTimeLabel()
        
        // 뷰 안에 들어와있을 때도 시간이 가면 label을 바뀌게 해주기위해 Timer 사용
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(nowTimeLabel), userInfo: nil, repeats: true)
        
        stampLogoImage.image = UIImage(named: "cameraTimestampLogo")
        
        cancleButton.setTitle("취소", for: .normal)
        cancleButton.titleLabel?.font = UIFont.spoqaRegular(size: 17)
        cancleButton.tintColor = .white
    }
    
    @objc func nowTimeLabel() {
        // 현재 시간을 기반으로 time과 날짜를 label에 넣어줌
        stampTimeLabel.text = Date().datePickerToString().recordTime()
        stampDateLabel.text = Date().datePickerToString().recordDate() + " (\(Date().weekDay()))"
    }
    
    func setupLivePreview() {
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        // captureSession를 사용해 캡쳐한 비디오를 표시해줌
        
        videoPreviewLayer.videoGravity = .resizeAspectFill
        // videoGravity: 콘텐츠를 표시하는 방법 -> resizeAspectFill: 비율을 유지하면서 채우기
        videoPreviewLayer.connection?.videoOrientation = .portrait
        // portrait - 세로, landscape - 가로모드
        cameraView.layer.addSublayer(videoPreviewLayer)
        // cameraView의 위치에 videoPreviewLayer를 띄움
    }
}

extension TimeStampVC: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        guard let imageData = photo.fileDataRepresentation()
            else { return }
        
        let image = UIImage(data: imageData)
        timeStampImage = image?.cropToBounds(width: Double(cameraView.layer.frame.width), height: Double(cameraView.layer.frame.width))
        // 현재 카메라 화면의 넓이를 기준으로 1:1 비율로 사진을 잘라줌
    }
}
