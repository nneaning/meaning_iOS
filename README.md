<br>

 <h1 align="center"> 미라클 모닝으로 시작하는 당신의 의미있는 아침, meaning☀️ </h1>
<p align="center"><img src="https://user-images.githubusercontent.com/51286963/103658121-25157880-4fae-11eb-9670-929c12159bde.png" > </p>


</br>
 <h2 align="center"> :point_right: All About Meaning_iOS :point_left: </h2>
<p align="center"><img src="https://user-images.githubusercontent.com/37579661/103620579-1b245300-4f77-11eb-9bd5-5c4262e3638a.png"></p>

 <h1 align="center"> List </h1> 

 **Setting** |  | **Rules**| |**Tools**| |**Service**| |
 :---: | :---: | :---: | :---: |:---:|:---:|:---:|:---:
 0 | [개발 환경](#개발-환경)| 1 | [Coding Convention](#Coding-Convention) |4 | [사용 라이브러리](#사용-라이브러리) |5 | [서비스 workflow](#서비스-workflow)
 |||||2 | [폴더링 방식 ](#폴더링-방식) |6 | [기능별 개발여부](#기능별-개발여부) 
 |||||3 | [How We Use Git](#How-We-Use-Git)|7 | [핵심 기능 설명](#핵심-기능-설명)
|||||||8 | [extension method 설명](#extension-method-설명)

<br>
<br>
<br>

# 개발 환경  
[![Swift 4](https://img.shields.io/badge/Meaning-iOS-blue.svg?style=flat)](https://swift.org)
![Xcode](https://img.shields.io/badge/Xcode-12.0.1-blue)
![swift](https://img.shields.io/badge/swift-5.0-green)
![iOS](https://img.shields.io/badge/iOS-13.0-yellow)



<br>
<br>

# 사용 라이브러리  
![Moya](https://img.shields.io/badge/Moya-14.0-orange)
![Alamofire](https://img.shields.io/badge/Alamofire-5.4.1-orange)
![Kingfisher](https://img.shields.io/badge/Kingfisher-5.15.8-yellow)

<br>
<br>

# Coding Convention  
> Coding Convention Ver.meaning 입니다! 저희 meaning_iOS 는 swift lint 는 따로 적용하지 않고 저희끼리의 rule 을 정해서 적용하며 코딩을 진행하고 있습니다. Coding Convention의 상세 내용은 **[여기](./README/CodingConvention.md)** 를 클릭해서 확인해보세요.

<br>
<br>

# Foldering 
```swift
💻 meaning
 ┣ 🗂 Global
 ┃ ┣ 🗂 Extension
 ┃ ┃ ┗ 📑 Fonts+Extension.swift
 ┃ ┣ 🗂 Model
 ┃ ┃ ┗ 📑 GenericResponse.swift
 ┃ ┗ 🗂 Service
 ┃ ┃ ┗ 📑NetworkResult.swift
 ┣ 🗂 Screen
 ┃ ┣ 🗂 Home
 ┃ ┃ ┣ 🗂 Cell
 ┃ ┃ ┃ ┗ 📑 CardListCell.swift
 ┃ ┃ ┣ 🗂 Storyboard
 ┃ ┃ ┃ ┗ 📑 Home.storyboard
 ┃ ┃ ┗ 🗂 ViewController
 ┃ ┃ ┃ ┗ 📑 HomeVC.swift
 ┃ ┗ 🗂 Login
 ┃ ┃ ┣ 🗂 Storyboard
 ┃ ┃ ┃ ┗ 📑 Login.storyboard
 ┃ ┃ ┗ 🗂 ViewController
 ┃ ┃ ┃ ┗ 📑 LoginVC.swift
 ┗ 🗂 Support
 ┃ ┣ 🗂 Font
 ┃ ┣ 🗂 Assets.xcassets
 ┃ ┣ 📑 LaunchScreen.storyboard
 ┃ ┣ 📑 AppDelegate.swift
 ┃ ┣ 📑 SceneDelegate.swift
 ┃ ┗ 📑 Info.plist
 ┗ 🗂 meaning.xcodeproj

```

### 📱 Screen 단위

- TapBar  : 커스텀탭바
- Login : 스플래쉬 + 로그인뷰
- Onboarding : 닉네임 입력 뷰 + 기상시간 입력 뷰
- Home : 홈화면(홈탭)
- Camera : 타임스탬프
- Mission : 미션카드
- MyPage : 마이페이지
- GroupList : 그룹탭(그룹 목록 + 그룹 생성)
- GroupFeed : 그룹SNS(그룹 글 목록 + 글 자세히보기 + 그룹 설정)

 
<br><br>

# How We Use Git 
> meaning iOS 팀이 git 을 이용할 때 쓰는 git message 규칙, PR 과 ISSUE 폼, 그리고 사용하고 있는 git tool 을 명세합니다.
> 아래의 항목들은 모두 **[How We Use Git.md](./README/how-we-use-git.md)** 을 클릭하시면 확인 할 수 있습니다.



<br><br>

 <h1 align="center"> Service </h1>
 
 ### 개발중입니다, 조금만 기다려주세요!
 
 <br>
 <br>

 
