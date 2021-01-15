<br>

 <h2 align="center"> 미라클 모닝으로 시작하는 당신의 의미있는 아침, meaning iOS </h2>
<p align="center"><img src="https://user-images.githubusercontent.com/51286963/103658121-25157880-4fae-11eb-9670-929c12159bde.png" >
<img src="https://user-images.githubusercontent.com/37579661/103620579-1b245300-4f77-11eb-9bd5-5c4262e3638a.png"></p>
<br>

## 🌱 서비스 소개 

<div align="center">


<img src="https://user-images.githubusercontent.com/59385491/104572713-5cafaf00-5697-11eb-8192-84ac6f57678e.png" height=200>
<p>
<img src="https://user-images.githubusercontent.com/59385491/104572745-66d1ad80-5697-11eb-9a09-12d1e9318e52.png" height=50>


프로젝트 진행기간 : 2020년 12월 26일 ~ 2021년 01월 15일



**<h3>모든 것은 바뀔 수 있고 나 역시 무언가를 바꿀 수 있습니다.</h3>**

기상 시간이 달라진다면, 당신도 변할 수 있습니다. 

<br>

'내'가 눈 뜨는 시간이 아닌, '해'가 뜨는 시간부터 하루를 시작하는 미라클 모닝.

미닝을 통해 미라클 모닝에 도전하며 당신만의 의미있는 아침을 만들어 나가보세요.

**일찍 일어나는 습관**으로 하루를 길게 보내면, **성장의 발판**을 마련할 수 있습니다.

미닝과 함께 체계적인 계획을 세우고 이를 규칙적으로 실천하면서 성취감을 얻어보세요.

성장지향적인 그룹원들과 목표를 공유한다면 우리는 함께, 더 멀리 갈 수 있습니다. 


</div>

</br>

</br>


 <h1 align="center"> SETTING </h1>
<br>

### 🐕 개발 환경  

[![Swift 4](https://img.shields.io/badge/Meaning-iOS-blue.svg?style=flat)](https://swift.org)
![Xcode](https://img.shields.io/badge/Xcode-12.0.1-blue)
![swift](https://img.shields.io/badge/swift-5.0-green)
![iOS](https://img.shields.io/badge/iOS-13.0-yellow)
![COCOAPODS](https://img.shields.io/badge/COCOAPODS-1.10.0-blue)

<br>

### ➕ 사용 라이브러리  
![Moya](https://img.shields.io/badge/Moya-14.0-orange)
![Alamofire](https://img.shields.io/badge/Alamofire-5.4.1-orange)
![Kingfisher](https://img.shields.io/badge/Kingfisher-6.0.1-yellow)
![lottie-ios](https://img.shields.io/badge/lottieios-3.1.9-green)


<br>

### 📏 Coding Convention  
> **[meaning Coding Convention](./README/CodingConvention.md)**

<br>

### :cat: How We Use Git
> **[How We Use Git](./README/how-we-use-git.md)**


<br>

### 🗂 Foldering 
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
- Login : 스플래쉬
- Login : 로그인
- Onboarding : 닉네임 및 기상시간 입력
- Home : 홈, 캘린더 화면
- Camera : 타임스탬프
- Mission : 미션카드
- MyPage : 마이페이지
- GroupList : 그룹탭(그룹 목록 + 그룹 생성)
- GroupFeed : 그룹SNS(그룹 글 목록 + 글 자세히보기 + 그룹 설정)

<br>
<br>

 <h1 align="center"> Service </h1>
 
 ## 🗓 WORKFLOW
 <div align="center">
<img src="./workflow.png" width = 800>
	</div>
	
 <br>
 
 ## 👷 실행화면
 **- 기준 iPhone : 아이폰se2, 아이폰12mini, 아이폰12Pro**  
 **- 테스트 계정 : 아이디 - iOS@meaning.com / 비밀번호 - iosmeaning**
 
 <br>
 
 
## 📱 Splash, Login 화면 

<br>

| 화면 | |
|:-----:|:----|
| <img src="https://media.giphy.com/media/5faqNWwEWRL0zxHoct/giphy.gif" width= 300> | <h2>Splash </h2> <br> 스플래시 화면을 `lottie-ios` 를 통해 적용하였습니다. <br>한 Loop 가 재생되고 로그인 화면으로 넘어갑니다. <br> splash 에서는 토큰의 세션이 만료되었는지에 대해 서버통신을 통해 확인합니다. <br> 만료가 되었거나 토큰이 없다면 로그인 화면으로, 유효한 토큰을 소유한 유저라면 바로 홈화면으로 넘어갑니다.  |
|<img src="https://media.giphy.com/media/QHi2ABdgVFYzxLLmjZ/giphy.gif" width= 300> | <h2>Login </h2> <br> 더 나은 레이아웃을 위해 로그인 버튼을 누르면 애니메이션과 함께 아이디, 비밀번호 란이 보여집니다. <br> 아이디 혹은 비밀번호를 적지 않았거나 옳지 않은 값이 들어간다면 빨간 경고 글씨가 띄워집니다. |

<div align="center">

<br>

### 상세 화면
| 로그인 진입 화면 | 로그인 화면 | 값 오류 화면 |
|:-----:|:----:|:-----:|
| <img src= "https://user-images.githubusercontent.com/37579661/104591758-7c9f9c80-56b0-11eb-8d6e-e3df4472f1f6.png" width=300>| <img src= "https://user-images.githubusercontent.com/37579661/104591980-dacc7f80-56b0-11eb-9146-e9eae41300a3.png" width=300> |<img src= "https://user-images.githubusercontent.com/37579661/104592112-0cdde180-56b1-11eb-9463-1b12542f5acf.png" width=300> |

<br>
<br>

 </div>

## 📱 온보딩 화면 

<br>

| 화면 | |
|:-----:|:----|
| <img src="https://media.giphy.com/media/Vo9wxz0yHKJJGqcfdv/giphy.gif" width= 300> | <h2>OnBoarding </h2> <br> 로그인 화면 이후, 닉네임과 기상시간을 입력하지 않았던 유저에게 온보딩 화면이 나타납니다.<br> 목표 기상 시간의 경우에는 pickerview 를 통해 구현하였습니다. |


 <div align="center">

<br>

### 상세 화면

| 진입 화면 | 닉네임 입력 화면 |
|:-----:|:----:|
| <img src= "https://user-images.githubusercontent.com/37579661/104593889-b58d4080-56b3-11eb-95aa-5d51340170b0.png" width=300>| <img src= "https://user-images.githubusercontent.com/37579661/104593922-c2119900-56b3-11eb-9fde-1026db2f841f.png" width=300> |

| 기상시간 화면 | 기상시간 입력 후 화면 |
| :-----:|:---:|
| <img src= "https://user-images.githubusercontent.com/37579661/104593944-c9d13d80-56b3-11eb-9db6-a4e80617a5f7.png" width=300> | <img src= "https://user-images.githubusercontent.com/37579661/104593969-d35aa580-56b3-11eb-9212-13e2488b8d45.png" width=300> |

</div>

<br>

## 📱 홈 - 캘린더 - 미션 화면 
<br>

| 화면 | |
|:-----:|:----|
| <img src="https://media.giphy.com/media/gQwePkXVzK3OHIDb5m/giphy.gif" width= 300> | <h2>Home - Calendar - Mission</h2> <br> 로그인이 완료되면 홈화면으로 이어집니다. <br> 홈화면은 캘린더와 미션으로 이어지는 구간입니다. <br> 미션은 좌우 슬라이드가 되도록 구현하였으며, 캘린더는 상단 날짜 버튼을 누르면 넘어가도록 되어있습니다.<br> 캘린더는 해당 달에 유저가 미라클 모닝을 성공한 날들을 별로 표시합니다. <br> 아래 커스텀 탭바의 카메라 버튼은 기상미션 수행 외에 인증 카메라를 사용할 수 있게 해줍니다. |

<br>

 <div align="center">

<br>

### 상세 화면

| 홈 화면 | 캘린더 화면 |
|:-----:|:----:|
| <img src= "https://user-images.githubusercontent.com/37579661/104603993-508c1780-56c0-11eb-9627-4a7c653d2eff.png" width=300>| <img src= "https://user-images.githubusercontent.com/37579661/104604042-5d107000-56c0-11eb-9328-d5ab98c1ff21.png" width=300> |

</div>


 <br>

## 📱 홈-캘린더-미션완료 후 화면 
<br>

| 화면 | |
|:-----:|:----|
| <img src="https://media.giphy.com/media/PjDpLMkyigW9OxnYtX/giphy.gif" width= 300> | <h2>After Mission Completed </h2> <br> 미션이 완료되면 순차적으로 해당 미션이 완료되어 홈에서 확인할 수 있습니다. <br> 한번 완료된 미션은 다시 할 수 없습니다. |

 <div align="center">
 
<br>

### 상세 화면

| 미션 완료 화면 | 미션 완료 후 별이 채워진 캘린더 |
|:-----:|:----:|
| <img src= "https://user-images.githubusercontent.com/37579661/104609760-ba0f2480-56c6-11eb-8b71-a37591e85b61.png" width=300>| <img src= "https://user-images.githubusercontent.com/37579661/104609619-921fc100-56c6-11eb-82bd-7baf6aeeeddd.png" width=300> |

</div>

 <br>

## 📱 타임스탬프 화면 
<br>

| 화면 | |
|:-----:|:----|
| <img src="https://media.giphy.com/media/sHFLBAgqJkyhz6jlHU/giphy.gif" width= 300> | <h2>TimeStamp</h2> <br>미닝 앱의 메인 기능이라고 할 수 있는 '타임스탬프' 기능입니다.<br> 카메라를 키게 하여 카메라 위에 현재 시간이 나와있는 뷰를 올려 화면을 캡쳐한 후 저장하는 기능입니다.|

 <div align="center">
 
<br>

### 상세 화면

| 타임스탬프 화면 
|:-----:|
| <img src= "https://user-images.githubusercontent.com/37579661/104604103-71ed0380-56c0-11eb-8ebc-68ffc1fdd1c8.png" width=300>|

</div>


 <br>

## 📱 4개 미션 화면 
<br>

| 화면 | |
|:-----:|:----|
| <img src="https://media.giphy.com/media/YhWWxvkdPj2eLU0m1i/giphy.gif" width = 500> | <h2>Missions</h2> <br> 기본 기상인증 미션은 네가지가 주어집니다. <br> 첫번째는 타임카메라를 통해 자신의 아침을 인증하고, 그룹에 속해있다면 그룹에 인증사진을 올리고 그룹에 속해있지 않다면 개인피드에 인증사진을 업로드하는 것으로 미션을 수행합니다. <br> 두번째로 자극을 줄 수 있는 격언을 읽는 미션을 수행합니다. <br>세번째로 하루 회고일기를 작성합니다. <br>마지막으로 짧은 독서록을 쓰는 미션을 수행합니다.|

 <div align="center">
 
<br>

### 상세 화면

| 하루다짐 미션 화면 | 회고일기 미션 화면 | 회고일기 작성 화면 |
|:-----:|:----:|:---:|
| <img src= "https://user-images.githubusercontent.com/37579661/104612480-97323f80-56c9-11eb-9728-0afb91b57c03.png" width=300>| <img src= "https://user-images.githubusercontent.com/37579661/104612562-afa25a00-56c9-11eb-978e-6beb7b2ef8d5.png" width=300> | <img src= "https://user-images.githubusercontent.com/37579661/104612599-baf58580-56c9-11eb-9b99-49cc112b1f7d.png" width=300> |

| 짧은독서 미션 화면 | 짧은독서 작성 화면 |
| :-----:|:---:|
| <img src= "https://user-images.githubusercontent.com/37579661/104612783-e8423380-56c9-11eb-8e2c-37d14fae6bfa.png" width=300> | <img src= "https://user-images.githubusercontent.com/37579661/104612852-f728e600-56c9-11eb-95da-8a090f7f7876.png" width=300> |

| 타임스탬프 미션 화면 | 타임스탬프 작성 화면 |
| :-----:|:---:|
| <img src= "https://user-images.githubusercontent.com/37579661/104625733-6ad1ef80-56d8-11eb-9903-7dd33d42bdd8.png" width=300> | <img src= "https://user-images.githubusercontent.com/37579661/104625786-7ae9cf00-56d8-11eb-918f-b29d1ef4c997.png" width=300> |


</div>


 <br>

## 📱 마이피드 - 마이피드 상세보기 화면 
<br>

| 화면 | |
|:-----:|:----|
| <img src= "https://user-images.githubusercontent.com/37579661/104734790-1e43ee00-5784-11eb-9ea1-095f11852c84.gif" width=300>| <h2>MyFeed </h2> <br> 자신의 기상미션에서 찍은 사진들이 업로드 되는 개인공간입니다. <br> 피드로 확인이 가능하고, 자신이 몇번째 미라클 모닝을 했는지 그리고 각 피드의 상세 페이지도 확인할 수 있습니다. |

<div align="center">
 
<br>

### 상세 화면

| 마이피드 화면 | 마이피드 상세보기 화면 |
|:-----:|:----:|
| <img src= "https://user-images.githubusercontent.com/37579661/104617184-7ae4d180-56ce-11eb-9179-d4b2cb267a45.png" width=300>| <img src= "https://user-images.githubusercontent.com/37579661/104617252-92bc5580-56ce-11eb-94af-3fdaae082d71.png" width=300> |
</div>
 <br>

## 📱 그룹 목록 화면 
<br>

| 화면 | |
|:-----:|:----|
| <img src="https://media.giphy.com/media/G3evgBnteXkD00iTeU/giphy.gif" width= 300> | <h2>Group List</h2> <br>다양한 그룹을 구경할 수 있는 목록 창 입니다.<br> 좌우 collectionview 로 확인할 수 있으며, 또 그 아래로는 테이블뷰로도 정보가 제공됩니다. |

 <div align="center">
 
<br>

### 상세 화면

| 그룹 목록 화면 | 참가 그룹이 없을 때 |
|:-----:|:---:|
| <img src= "https://user-images.githubusercontent.com/37579661/104618872-9650dc00-56d0-11eb-8ee8-503446f09cf8.png" width=300>| <img src= "https://user-images.githubusercontent.com/37579661/104627912-f51b5300-56da-11eb-9b02-7a5dd112c3b0.png" width=300>|
</div>

 
 <br>

## 📱 그룹 상세보기-가입 화면 
<br>

| 화면 | |
|:-----:|:----|
| <img src="https://media.giphy.com/media/Z7s5w7kV08OvHX0Ykt/giphy.gif" width= 300> | <h2>Joining Clubs </h2> <br>참가하고 싶은 그룹을 누르면 상세 설명을 확인할 수 있습니다. <br>그 이후에 참가 버튼을 누르면 참가가 완료되고, 그룹 홈에서 자신이 참가하는 그룹을 확인할 수 있습니다.<br> 그리고 더이상 홈에서 자신이 참가하고 있는 그룹이 보이지 않게됩니다.|

 <div align="center">
 
<br>

### 상세 화면

| 그룹 상세보기 | 참가버튼 누른 후 | 참가 후 그룹 목록<br>자신이 참가한 그룹<br> 더이상 보이지 않음 |
|:-----:|:----:|:---:|
| <img src= "https://user-images.githubusercontent.com/37579661/104619153-e3cd4900-56d0-11eb-8367-5bc82cc15f5e.png" width=300>| <img src= "https://user-images.githubusercontent.com/37579661/104630152-c81c6f80-56dd-11eb-8542-a49438c70cfb.png" width=300> |<img src= "https://user-images.githubusercontent.com/37579661/104628933-3102e800-56dc-11eb-8152-1607ff666246.png" width=300> | 

</div>


 <br>

## 📱 그룹생성 화면 
<br>

| 화면 | |
|:-----:|:----|
| <img src="https://media.giphy.com/media/TZsWJaCxQt4RjgoME2/giphy.gif" width= 300> | <h2>Create Group </h2> <br>자신이 속해있는 그룹이 없을 때, <br>그룹에 참여해도 되지만, 그룹을 직접 생성해도 됩니다.<br>그룹을 만들고 그룹의 피드를 확인하면 게시물이 없다는 블랭크 뷰가 나오게 됩니다. |

 <div align="center">
 
<br>

### 상세 화면

| 그룹 생성 화면 |  그룹 생성 내용 작성 화면 | 생성 완료 화면 |
|:-----:|:----:|:----:|
| <img src= "https://user-images.githubusercontent.com/37579661/104619305-0c554300-56d1-11eb-9cf2-e7d624019d4d.png" width=300>| <img src= "https://user-images.githubusercontent.com/37579661/104628425-930f1d80-56db-11eb-9deb-882d61779809.png" width=300> | <img src= "https://user-images.githubusercontent.com/37579661/104619395-2abb3e80-56d1-11eb-97b6-2b3f61728c94.png" width=300> |



</div>

<br>

## 📱 그룹 피드-피드 상세보기-그룹 설정 화면 
<br>

| 화면 | |
|:-----:|:----|
| <img src="https://media.giphy.com/media/iooYalOzPCuzSTSDNG/giphy.gif" width= 300> | <h2>Group Feed </h2> <br>그룹 피드는 자신이 참가하고 있는 그룹사람들의 인증 사진들을 확인하는 공간입니다.<br>피드에서 상세보기로 이동도 가능하며, 그룹을 설정하는 페이지에서 그룹에 대한 상세 내용을 확인할 수 있습니다. |

 <div align="center">
 
<br>

### 상세 화면

|  그룹 피드 비었을 때 화면 | 그룹 피드 내용 화면 |  
|:-----:|:----:|
| <img src="https://user-images.githubusercontent.com/37579661/104628470-9b675880-56db-11eb-9e91-2f4b5629d769.png" width=300> | <img src= "https://user-images.githubusercontent.com/37579661/104618915-a5378e80-56d0-11eb-8359-0fe8894bfdeb.png" width=300> | 


| 설정 화면 | 그룹 피드 상세보기 화면 |
| :-----:|:---:|
|<img src= "https://user-images.githubusercontent.com/37579661/104619484-445c8600-56d1-11eb-9ec8-a408ab86a9e7.png" width=300> | <img src= "https://user-images.githubusercontent.com/37579661/104619536-54746580-56d1-11eb-9210-b6e22fbe07a6.png" width=300> |


</div>

 <br>


 ## 🛠 기능명세서
|  우선순위 | 기능명 | 설명  | 구현여부  | 담당자  | 
| ------------ | ------------ | ------------ | ------------ | ------------ | 
|  P1 | 스플래쉬  | 앱 실행시 스플래쉬가 보여진다. |  🟣  |  선민승 | 
|  P1 | 로그인  | 로그인을 하여 미닝 앱을 사용한다. |🟣   |  선민승 | 
|  P1 | 온보딩(닉네임)  | 사용자가 원하는 닉네임을 입력한다.  | 🟣  | 김민희  |   
|  P1 |  온보딩(기상시간) | 오전 5시부터 오전 8시 사이의 목표 기상시간을 설정한다.  |  🟣 | 김민희  |
|  P1 | 온보딩(환영글)  | 사용자를 환영하며, 홈으로 연결된다. |  🟣  |  김민희 |  
|  P1 | 커스텀 탭바 | 가운데 카메라 버튼을 원형으로 탭바를 커스텀한다. 탭바 아이템을 클릭하여, 해당 뷰로 이동한다. |  🟣 | 박세은 |  
|  P1 | 카메라 (타임스탬프) | 현재 시간이 즉각 반영되어 이미지와 함께 촬영이 되며, 갤러리에 저장된다. | 🟣  | 김민희  |   
|  P1 | 홈 | 미션을 좌우 슬라이드가 되도록하며, 상단 날짜를 클릭하면 캘린더로 넘어간다. <br>미션을 완료하면, 미션 완료 텍스트가 보여지는 카드로 변한다. <br> 미션을 순차적으로 수행하지 않을 경우, 이전 먼저 해달라는 토스트 알림을 보여준다. | 🟣  | 김민희  | 
|  P1 |  캘린더 | 메인 홈에서 상단 날짜를 누르면 캘린더가 보인다. <br> 미션 완료 시 해당일의 별이 채워진다.  |🟡  |  김민희 |
|  P1 | 피드 업로드 (사진 업로드) |  사진을 마이 피드와 가입된 그룹 피드에 업로드 한다. | 🟡 |  김민희, 선민승  | 
|  P2 | 미션카드(오늘 하루 다짐)  |  모닝미라클과 관련된 글귀를 매일 중복을 피하면서 보여준다. | 🟡  |  선민승  |  
|  P2 | 미션카드(자기회고/일기)  |  200자 이내로 자기회고를 할 수 있는 텍스트필드가 있다. | 🟡 |  선민승 | 
|  P2 | 미션카드(책 한줄평)  |책을 읽고 200자 이내로 감상평이나 한줄평을 남길 수 있는 텍스트가 있다.   | 🟡 |  선민승 | 
|  P2 |마이피드   |그동안 내가 올린 미라클 모닝 인증샷을 세로 스크롤로 내려 볼 수 있고, 나의 달성 횟수를 보여준다. |  🟡 |선민승, 김민희   |  
|  P2 | 그룹 목록  |  내가 가입한 그룹, 다른 그룹들을 살펴볼 수 있다.  | 🟡  |  박세은, 김민희 |  
|  P2 | 그룹 상세보기  |그룹 목록에서 그룹을 클릭하면 그룹이름, 그룹 정보, 인원수 및 참가인원을 확인할 수 있다. |  🟡 | 박세은  |
|  P2 | 그룹 생성  |  그룹을 직접 만들어서 그룹을 관리할 수 있다. 이미 내 그룹이 있거나, 이미 있는 이름일 경우 생성이 불가하다. | 🟡 |  박세은 |
|  P2 | 그룹 참여  | 그룹 참여하기 버튼을 눌렀을 때 <br>1) 가입한 그룹이 없는 경우, 가입이 완료된다. <br>2) 가입한 그룹이 있는 경우, 이미 가입된 그룹이 있다는 팝업이 보인다.  |  🟡 | 박세은  | 
|  P2 | 그룹 피드  | 그동안 그룹 멤버들이 올린 미라클 모닝 인증샷을 세로 스크롤로 내려 볼 수 있고, 얼마나 많은 그룹원들이 참여하고 있는지를 보여준다. <br>그룹에 글이 올라오지 않은 경우, 게시물이 없다는 멘트와 함께  [홈으로 돌아가기] 버튼을 보여준다. |  🟡 | 김민희  | 
|  P3 |  인증글 상세보기 | 그룹에서 다른 사람의 인증글을 클릭하면 인증글을 볼 수 있다.|  🟢 |  김민희 | 
|  P3 | 그룹 설정  |그룹 정보 및 그룹원 정보를 보여준다.  |  🟢 |  박세은 | 


<br>

## 🎉 새롭게 도전해본 기능
> Meaning iOS 팀은 끝없는 도전을 두려워하지 않습니다. 
> 이번 프로젝트에서 각자 해보지 않았던 새로운 기술들을 도전하고 공부하는 시간을 가져보았습니다. 


<h3> 👀 민희   <br>
<br>  
1. Moya가 Moya?
</h3>

> [Moya 프레임 워크](https://github.com/Moya/Moya) 이용하기

- **추상화 네트워킹 라이브러리**
- URLSession과 Alamofire를 한번 더 감싼 API
- moya가 제시하는 기본 구현 방식의 문제점은?

 <div align="center">
<img src= "https://user-images.githubusercontent.com/37579661/104690323-93dd9900-5747-11eb-9c94-63420117fa0b.png" width=200>
</div>

    1. 새로운 앱을 쓰기 힘들게 만든다.
    2. 앱을 유지하기 어렵게 만든다.
    3. unit 테스트를 하기 어렵게 만든다.
   
- 그럼 moya는 뭐가 더 좋을까요?

<div align="center">
<img src= "https://user-images.githubusercontent.com/37579661/104690624-1f572a00-5748-11eb-9180-2a19aef5c345.png" width=150>
</div>

- moya는 열거형(enum)을 사용하여 네트워크 요청 방식을 **type-safe한 방식**으로 캡슐화 하는데 초첨을 맞춘 프레임워크
- moya는 자체적인 네트워크 수행은 X, Alamofire의 네트워킹 서비스를 사용하고, 추상화 하기 위한 기능들을 제공한다.
   → 결론 : Alamofire 직접 사용X, **Alamofire를 기반으로 하고 있는 Moya를 거쳐 사용 O**!

<br>

### 😳 Moya 그래서 어떻게 사용해요?

1. pod 에 설치하기 → Moya를 설치하면 자동으로 Alamofire도 설치되는 형태입니다.

<div align="center">
<img src= "https://user-images.githubusercontent.com/37579661/104690939-af956f00-5748-11eb-9514-59918a0ad7d6.png" width =500>
</div>


1. 서버 통신에 필요한 API를 enum을 이용해 case별로 추상화합니다.
    - case 별로 나눠서 추상화 함으로써 한눈에 api 별 통신에 필요한 type을 볼 수 있고, 수정하기 편리합니다.

    ```swift
    import Foundation
    import Moya

    enum APITarget {
        // case 별로 api를 나눠줍니다
        case onboard(token: String, nickName: String, wakeUpTime: String) // 온보드
        case timestamp(token: String, dateTime: String, timeStampContents: String, image: UIImage) // 타임스탬프 작성
        case groupEdit(token: String, groupid: Int) // 그룹 설정
    }

    // MARK: TargetType Protocol 구현

    extension APITarget: TargetType {
        var baseURL: URL {
            // baseURL - 서버의 도메인
            return URL(string: "[서버 도메인]")!
        }
        
        var path: String {
            // path - 서버의 도메인 뒤에 추가 될 경로
            switch self {
            case .onboard:
                return "/user/onboard"
            case .timestamp:
                return "/timestamp"
            case .groupEdit(_, let groupid):
                return "/group/\(groupid)/edit"
            }
        }
        
        var method: Moya.Method {
            // method - 통신 method (get, post, put, delete ...)
            switch self {
            case .timestamp:
                return .post
            case .onboard:
                return .put
            case .groupEdit:
                return .get
            }
        }
        
        var sampleData: Data {
            // sampleDAta - 테스트용 Mock Data
            return Data()
        }
        
        var task: Task {
            // task - 리퀘스트에 사용되는 파라미터 설정
            switch self {

            case .onboard( _, let nickName, let wakeUpTime):
    		// 파라미터 존재시
                return .requestParameters(parameters: ["nickName" : nickName, "wakeUpTime": wakeUpTime], encoding: JSONEncoding.default)
                
            case .timestamp(_, let dateTime, let timeStampContents, let image):
    		// multipart/form-data 사용시
                let dateTimeData = MultipartFormData(provider: .data(dateTime.data(using: .utf8)!), name: "dateTime")
                let timeStampContentsData = MultipartFormData(provider: .data(timeStampContents.data(using: .utf8)!), name: "timeStampContents")
                let imageData = MultipartFormData(provider: .data(image.jpegData(compressionQuality: 1.0)!), name: "image", fileName: "jpeg", mimeType: "image/jpeg")
                let multipartData = [dateTimeData, timeStampContentsData, imageData]
                return .uploadMultipart(multipartData)
            
            case .groupEdit:
                // 파라미터가 존재하지 않을 시
    		return .requestPlain
            }
        }
        
        var validationType: Moya.ValidationType {
            // validationType - 허용할 response의 타입
            return .successAndRedirectCodes
    	// successAndRedirectCodes - Array(200..<400)
        }
        
        var headers: [String : String]? {
            // headers - HTTP header
            switch self {

            case .onboard(let token, _, _), .groupEdit(let token, _):
                return ["Content-Type" : "application/json", "token" : token]
            case .timestamp(let token, _, _, _):
                return ["Content-Type" : "multipart/form-data", "token" : token]
             
            }
        }
        
    }
    ```
<br>

2. 데이터 통신 분기처리를 위한 모델을 만듭니다.

```swift
import Foundation
import Moya

struct APIService {

        static let shared = APIService()
    	// 싱글톤 객체 생성
        let provider = MoyaProvider<APITarget>()
    	// MoyaProvider(->요청 보내는 클래스) 인스턴스 생성
       
        func timestamp(_ token: String, _ dateTime: String, _ timeStampContents: String, _ image: UIImage, completion: @escaping (NetworkResult<TimestampData>)->(Void)) {
            // 타임스탬프를 업로드 하는 함수를 만들어 봅니다.
    	    // TimestampData는 서버에서 받아온 data를 넣어줄 구조체 입니다.
            let target: APITarget = .timestamp(token: token, dateTime: dateTime, timeStampContents: timeStampContents, image: image)
            // APITarget에서 만들어준 case 중 하나를 선택합니다!
    	judgeObject(target, completion: completion)
            
        }

    	// request하고 decode 하는 코드를 반복해서 사용할 수 있게 함수로 제작해보았습니다
        func judgeObject<T: Codable>(_ target: APITarget, completion: @escaping (NetworkResult<T>) -> Void) {
            provider.request(target) { response in
                switch response {
                case .success(let result):
                    do {
                        let decoder = JSONDecoder()
                        let body = try decoder.decode(GenericResponse<T>.self, from: result.data)
                        if let data = body.data {
                            completion(.success(data))
                        }
                    } catch {
                        print("구조체를 확인해보세요")
                    }
                case .failure(let error):
                    completion(.failure(error.response!.statusCode))
                }
            }
        }
      }
    ```

    1. 원하는 ViewController 에서 서버 통신 함수를 불러옵니다

    ```swift
    var timestampData: TimestampData?

    func uploadPictrue(_ token: String, _ dateTime: String, _ timeStampContents: String, _ image: UIImage) {
            APIService.shared.timestamp(token, dateTime, timeStampContents, image) { [self] result in
                    switch result {
                    case .success(let data):
    		    	data = timestampData
                    // 성공 시 처리 로직
                    case .failure(let error):
                        if error == 400 {
    										
    			} else if error = 404 {
    										
    			}
                    }
                }
        }
    ```


## 2.AVFoundation 이용해서 TimeStamp Camera 구현하기

- meaning에서는 타임 스탬프 기능을 위해 카메라 위에 현재 시간과 미닝의 로고를 올려 함께 촬영합니다.
- 핸드폰에서 보통 사용하는 기본 카메라 UIImagePickerController가 아닌 AVFoundation를 사용해 새로운 카메라 화면을 구현해주었습니다.

```swift
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
    var rootView: String?

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
        setCaptureSession()
    }

}

// MARK: Extension

extension TimeStampVC {
    
// MARK: Function
    
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
    
    func setCaptureSession() {
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .high
        // 캡쳐 화질은 high로 설정
        
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
        
        // startRunning는 시간이 걸릴 수 있는 호출이므로 main queue가 방해되지 않게 serial queue에서 실행해준다
        DispatchQueue.global(qos: .userInitiated).async {
            // 세션 실행 시작
            self.captureSession.startRunning()
            // 콜백 클로저를 통해 세션실행이 시작하는 작업이 끝난다면
            // cameraView에 AVCaptureVideoPreviewLayer를 띄우게 만든다
            DispatchQueue.main.async {
                self.videoPreviewLayer.frame = self.cameraView.bounds
            }
        }
    }
}

```

- 이제 화면에 나온 이미지를 촬영(캡쳐)하는 역할이 남았습니다. 기존의 카메라 촬영 버튼의 역할을 구현해주어야합니다. AVCapturePhotoCaptureDelegate를 이용해 사진을 캡쳐한 후의 결과를 받습니다.

```swift
// MARK: IBAction
    
    @IBAction func shootingButtonDidTap(_ sender: Any) {
        // 카메라 촬영 버튼 클릭 시 Action
        
        let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        // jpeg 파일 형식으로 format
        stillImageOutput.capturePhoto(with: settings, delegate: self)
        // AVCapturePhotoCaptureDelegate 위임
    }

extension TimeStampVC: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        guard let imageData = photo.fileDataRepresentation()
            else { return }
        
        let image = UIImage(data: imageData)
        timeStampImage = image?.cropToBounds(width: Double(cameraView.layer.frame.width), height: Double(cameraView.layer.frame.width))
        // cropToBounds 라는 Extesnion을 통해 정방형 크기로 크롭해주었다.
        
        guard let checkVC = self.storyboard?.instantiateViewController(identifier: "PhotoCheckVC") as? PhotoCheckVC else {
            return
        }
        
        // 다음 뷰로 이미지를 넘겨주었다.
        checkVC.photoImage = timeStampImage
        
        
        self.navigationController?.pushViewController(checkVC, animated: true)
    }
}
```

- 캡쳐 이미지는 내가 원하는 크기로 캡쳐가 되지 않습니다. 단순히 커스텀한 카메라 화면은 보여지는 특정 뷰에서의 user에게 보여지는 크기이고, 캡쳐 이미지는 일반 카메라의 비율은 4:3으로 나오게 됩니다.
- 그렇기 때문에 cropToBounds 라는 Extension을 만들어 사진을 원하는 크기로 잘라주었습니다.

```swift
import UIKit

extension UIImage {
    func cropToBounds(width: Double, height: Double) -> UIImage {
        // 이미지를 원하는 크기로 잘라줍니다

            let cgimage = self.cgImage!
            let contextImage: UIImage = UIImage(cgImage: cgimage)
            let contextSize: CGSize = contextImage.size
            var posX: CGFloat = 0.0
            var posY: CGFloat = 0.0
            var cgwidth: CGFloat = CGFloat(width)
            var cgheight: CGFloat = CGFloat(height)

            // width와 height 중 더 큰 길이를 중심으로 자른다.
            if contextSize.width > contextSize.height {
                posX = ((contextSize.width - contextSize.height) / 2)
                posY = 0
                cgwidth = contextSize.height
                cgheight = contextSize.height
            } else {
                posX = 0
                posY = ((contextSize.height - contextSize.width) / 2)
                cgwidth = contextSize.width
                cgheight = contextSize.width
            }

            let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)

            // rect를 이용해서 bitmap 이미지를 생성한다.
            let imageRef: CGImage = cgimage.cropping(to: rect)!

            // imageRef 이미지를 기반으로 새 이미지를 만든 후, 원래 방향으로 다시 돌려준다.
            let image: UIImage = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)

            return image
        }
}
```

- 또한 타임스탬프 카메라 안에서 시간이 지나면 자동으로 시간이 흐르도록 하기 위해 Timer를 이용해 1초마다 현재 시간을 검사해 분(minutes) 이 바뀐다면 라벨의 시간을 수정해줍니다.

```swift

Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(nowTimeLabel), userInfo: nil, repeats: true)

@objc func nowTimeLabel() {
    // 현재 시간을 기반으로 time과 날짜를 label에 넣어줌
		stampTimeLabel.text = Date().datePickerToString().recordTime()
		stampDateLabel.text = Date().datePickerToString().recordDate() + " (\(Date().weekDay()))"
}
```

<br>

## 3. CollectionView Animation

- 홈에서 카드를 넘길 때 CollectionView를 사용해서 구현을 했는데, 단조로운 느낌을 피하기 위해 가운데 오는 cell을 강조해주는 carousel 효과(혹은 회전목마 효과)의 Animation을 구현해보았습니다.
- UICollectionViewFlowLayout라는 것을 처음 사용해보았습니다. UICollectionViewFlowLayout를 사용하면 cell을 원하는 형태로 정렬할 수 있게 도와줍니다.

```swift
let customLayout = AnimationFlowLayout()
missonCardCollectionView.collectionViewLayout = customLayout
// 원하는 CollectionView에 선언해서 사용합니다. 
```

```swift
import UIKit

class AnimationFlowLayout: UICollectionViewFlowLayout {
    // 셀이 열의 흐름(세로, 가로)에 따라 이동 할 때 보여지는 것을 담당한다
    
    // MARK: Variable Part
    
    private var firstTime: Bool = false
    // 초기 한번만 설정되기 위해 변수를 선언
    
    override func prepare() {
        super.prepare()
        guard !firstTime else { return }
        
        guard let collectionView = self.collectionView else {
            return
        }
        
        let collectionViewSize = collectionView.bounds
        itemSize = CGSize(width: collectionViewSize.width-50*2, height: 100)
        // itemSize - 셀의 기본 크기
        
        let xInset = (collectionViewSize.width-itemSize.width) / 2 - 50
        self.sectionInset = UIEdgeInsets(top: 0, left: xInset, bottom: 0, right: xInset)
        // sectionInset - 섹션간의 여백
        
        scrollDirection = .horizontal
        // 가로 스크롤에 사용할 것이라는 걸 알려준다
        
        minimumLineSpacing = 10 - (itemSize.width - itemSize.width*0.7)/2
        // minimumLineSpacing - 행 사이에 사용할 최소 간격
        // 셀이 작아지면 더 멀리 있게 보이기 때문에 붙여주기 위해서 사용
        
        firstTime = true
        // 한번 설정을 했으면 다시 선언되지 않기 위해 바꿔준다
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        // 레이아웃 변경이 필요한지 묻는 함수
        return true
    }
   
}
```

- CGAffineTransform를 이용해 2D 그래픽을 그려 애니메이션을 화면에 보여줍니다. 가운데 있는 Cell을 기준으로 양 옆의 Cell은 가운데 Cell보다 작아졌다가 가운데로 도달했을 때, scale에서 identify로 커지는 애니메이션을 주었습니다.

```swift
override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        // 레이아웃 요소를 가져와서 조정하는 함수
            let superAttributes = super.layoutAttributesForElements(in: rect)
            
            superAttributes?.forEach { attributes in
                guard let collectionView = self.collectionView else { return }
                
                let collectionViewCenter = collectionView.frame.size.width / 2
                // collectionVIewCenter - 컬렉션 뷰의 중앙값으로 변하지 않는 고정 값
                let offsetX = collectionView.contentOffset.x
                // offsetX - 사용자가 스크롤할 때 기준점으로부터 이동한 거리(x축)
                let center = attributes.center.x - offsetX
                // center - 각 셀들의 중앙값
                // 기본 center값은 처음에 collectionView가 로드될 때 값이므로 여기서 offsetX 빼줘서 동적으로 계산한다
                
                let maxDistance = self.itemSize.width + self.minimumLineSpacing
                // maxDistance - 아이템 중앙과 아이템 중앙 사이의 거리
                let dis = min(abs(collectionViewCenter-center), maxDistance)
                // 현재 CollectionView의 가운데에서 cell의 가운데 값을 빼서 가운데 0을 기준으로 1까지 계산하기 위해 계산하는 값
                
                let ratio = (maxDistance - dis)/maxDistance
                // 비율을 구해서 애니메이션을 주기 위한 값
                let scale = ratio * (1-0.7) + 0.7
                
                attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
                // scale에서 identify로 커지는 애니메이션을 준다
            }
            
            return superAttributes
       }
```
<br>

<h3> 👀 민승 <br>

<br>
1. Login Animation 구현 </h3>

>한번도 해보지는 않았지만, 언제나 iOS 주니어 개발자로서 도전해보고 싶었던 자체 animation 구현을 도전해보았습니다.  

1. **부탁받은 애니메이션에 대한 설명**  
   먼저 이 디자인은 디자이너분이 제안해주신 소중한 아이디어였습니다. 로그인 버튼을 눌렀을 때, 자연스럽게 아이디, 비밀번호 작성란이 천천히 올라오는 방식으로 화면에 그려지는 애니메이션이었습니다.  
   <img src="https://user-images.githubusercontent.com/37579661/104633846-1b44f100-56e3-11eb-892c-522839102bce.png" width=300>
   

2. **애니메이션이 들어간 부분**  
   이 애니메이션의 **시작** 은 로그인 버튼이 눌러진 시점부터 입니다. 따라서 `@IBAction` 을 로그인버튼에 설정해놓고, 그 `IBAction` 내부에서 애니메이션 적용을 하였습니다.  

3. **애니메이션 코드** 
   ```swift
   UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions.transitionFlipFromTop, animations: { /* codes */ }, completion: { finished in
                /* codes */
   })
   ```
   흔히 사용하는 `UIView.animate()` 를 이용하였습니다.  

   단순히 자연스럽게 나타나는 애니메이션은 `alpha`값 즉, 투명도를 이용했습니다.  
   ```swift
    //뒤로 가기 버튼 나타나기
    self.backBtn.alpha = 1
    self.backBtn.isHidden = false
    ```

    위아래로 움직이는 애니메이션의 경우에는 `.center.y` 축을 이용했습니다.
    ```swift
    //회원가입 버튼 아래로 내려가기
    self.signUpBtn.center.y += self.view.bounds.height
    ```

4. **초기 위치 설정**  
   **아래에서 위** 로 움직여야 하는 애니메이션이었기 때문에 처음부터 autolayout을 200 만큼 아래로 위치를 잡았습니다. 그리고 버튼이 눌러졌을 때 애니메이션 코드를 통해 **다시 200만큼 올라오도록** 해주었습니다.  

5. **조건문 설정**  
   한가지 예외처리를 해주어야 했습니다. 로그인 버튼을 처음으로 눌러 들어오면서 애니메이션이 작동되고, 그 다음부터는 버튼을 눌러도 애니메이션이 작동하면 안되었습니다. (그렇게 되면 로그인 버튼을 누를 때마다 아이디 비밀번호 란이 200씩 위로 올라갈테니까요..) 그래서 `loginBtnFirstPressed: Bool`을 하나 선언해주어서 로그인 버튼이 처음으로 눌릴 때 `true`처리를 해주고, 그 다음부터는 서버통신이 되고 애니메이션은 작동이 안되도록 처리해주었습니다.  

6. **뒤로 돌아가는 버튼을 눌렀을 때**  
    로그인 버튼을 눌러 아이디 비밀번호를 치다가, 뒤로 돌아가는 경우가 있습니다. 이 경우에도 똑같이 애니메이션 작동을 넣어주어서 다시 내려가는 애니메이션을 적용해주었습니다.

<br>              
              
<h3> 👀 세은 <br>

<br>
1. UIRefreshControl </h3>

UIRefreshControl은 **테이블 뷰**를 아래 방향으로 슬라이드 해서 화면을 갱신하는 기능으로, 화면을 새로 고침 할 때 많이 사용됩니다.

우선 사용하고자 하는 뷰컨트롤러에 다음과 같은 구문을 선언해줍니다!

```swift
lazy var refreshControl: UIRefreshControl = {
        // Add the refresh control to your UIScrollView object.
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.meaningNavy
        
        return refreshControl
    }()
```

refreshControl 속성에 UIRefreshControl를 할당합니다. 새로 고침 중일 때 동작할 메서드를 addTarget를 이용해서 연결해줍니다.

그리고 뷰에 추가를 시켜줍니다. 테이블 뷰를 내리면 리로드 시키고 싶어서 테이블 뷰에 추가를 해주었습니다.

```swift
groupTableView.addSubview(self.refreshControl)
```

아래의의 함수는 refreshControl 선언시 타겟 액션 을 걸어준 함수이기 때문에 , 화면을 당겨서 내릴 때마다 함수가 실행됩니다. 따라서, handleRefresh 함수 안에 하고자 하는 액션을 추가하면 쉽게 구현할 수 있습니다.

UIRefreshControl 객체는 beginRefreshing() 메서드를 통해 실행이 시작되고 endRefreshing() 메서드를 통해 종료됩니다. 화면 당김이 임계점을 넘게 되면, 자동으로 beginRefreshing() 메서드는 호출됩니다. 

따라서 새로 고침이 완료되면 endRefreshing()만 호출해 주면 됩니다. 
(endRefreshing() 메서드를 호출하지 않으면 새로 고침 컨트롤이 멈추지 않게 됩니다.)

```swift
//새로고침 함수
@objc func handleRefresh(_ refreshControl: UIRefreshControl) {
	//새로고침 시 갱신되어야 할 내용
        groupList(token: UserDefaults.standard.string(forKey: "accesstoken")!)
        checkMyGroup(UserDefaults.standard.string(forKey: "accesstoken")!)

        //당겨서 새로고침 종료
        refreshControl.endRefreshing()
    }
```
<br>

### 2. Custom TabBar
<div align="center">
<img src= "https://user-images.githubusercontent.com/37579661/104692392-419e7700-574b-11eb-8ea1-5e4b5d0b24e2.png" height =100>
</div>

 UITabBarController에 가운데 카메라 버튼을 코드로 만들어서 addSubView 하는 방식으로 만들어줬습니다.

```swift
   var cameraButton: UIButton = {
	//버튼의 객체 생성
        let button = UIButton()

	//버튼에 이미지를 넣어줍니다.
        button.setBackgroundImage(UIImage(named:"navItemCamera"), for: .normal)

	//생성한 버튼의 이벤트를 지정해줍니다.
        button.addTarget(self, action: #selector(TabBarVC.buttonClicked(sender:)), for: .touchUpInside)

        return button
    }()
```
<div align="center">
<img src= "https://user-images.githubusercontent.com/37579661/104692511-76aac980-574b-11eb-804a-e001a415ec8b.png" height =100>
</div>

탭바 컨트롤러의 기본 설정대로 하게 되면,
탭바 아이콘들이 왼쪽의 사진과 같이 가운데로 쏠려보인다는 것을 볼 수 있다! 

따라서 UIEdgeInsets로 이미지의 인셋을  조정해줍니다.

```swift
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
        //탭바 아이템 이미지 인셋 조정
        homeVC.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: -20, bottom: -5, right: 0)
        homeVC.tabBarItem.image = UIImage(named: "tabBarHomeIcInactive")
        homeVC.tabBarItem.selectedImage = UIImage(named: "tabBarHomeIcActive")
        homeVC.title = ""
        
        groupVC.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -5, right: -20)
        groupVC.tabBarItem.image = UIImage(named: "tabBarGroupIcInactive")
        groupVC.tabBarItem.selectedImage = UIImage(named: "tabBarGroupIcActive")
        groupVC.title = ""
        
        setViewControllers([homeVC, groupVC], animated: true)
}
```

카메라 버튼의 크기와 위치를 정해주고, 탭바에 addSubView 해줍니다.

```swift
func setTabBar() {
	//카메라 버튼의 크기와 위치를 선정해줍니다.
        let width: CGFloat = 70/375 * self.view.frame.width
        let height: CGFloat = 70/375 * self.view.frame.width
        
        let posX: CGFloat = self.view.frame.width/2 - width/2
        let posY: CGFloat = -32
        
        cameraButton.frame = CGRect(x: posX, y: posY, width: width, height: height)
        
	//만들어준 카메라 버튼을 탭바에 추가해줍니다.
        tabBar.addSubview(self.cameraButton)
}
				
```
<br>

## 📚 Meaning Extension

### 1. Toast Alert Extension

textField에 입력된 값이 존재하거나 올바르지 않은 경우, 미션 수행 순서가 올바르지 못 할 경우,
사용자에게 알림을 주는 토스트 팝업을 extension 으로 만들어서 사용했습니다. 

```swift
// MARK: Toast Alert Extension

  // 사용법: showToast(message : "원하는 메세지 내용", font: UIFont.spoqaRegular(size: 15), width: 188, bottomY: 181)
    
 func showToast(message : String, font: UIFont, width: Int, bottomY: Int) {
        let guide = view.safeAreaInsets.bottom
        let y = self.view.frame.size.height-guide
        
	//토스트 라벨의 크기와 위치를 선정해줍니다.
        let toastLabel = UILabel(
            frame: CGRect( x: self.view.frame.size.width/2 - CGFloat(width)/2,
                           y: y-CGFloat(bottomY),
                           width: CGFloat(width),
                           height: 30
            )
        )
        
        toastLabel.backgroundColor = UIColor.gray4
        toastLabel.textColor = UIColor.gray6
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 6
        toastLabel.clipsToBounds  =  true

	//뷰에 토스트 라벨을 추가시켜줍니다.
        self.view.addSubview(toastLabel)

	//애니메이션을 설정해줍니다.
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
```

현재 UIView의 애니메이션 옵션을 curveEaseOut 으로 설정해뒀는데, 이는 빠르게 진행됬다가 완료됬을때 천천히 진행되는 애니메이션 효과입니다. 

이와 같이 애니메이션을 설정할 수 있는 옵션으로는 **curveEaseInOut, curveEaseIn, curveEaseOut** 가 있습니다.

**static var curveEaseInOut: UIView.AnimationOptions**

- 기본값
- 천천히 진행됬다가 duration의 중간쯤에 빨라지고, 완료되기 전에 다시 천천히 진행되는 옵션

**static var curveEaseIn: UIView.AnimationOptions**

- 애니메이션이 느리게 시작된 다음, 진행에 따라 애니메이션 속도가 빨라짐.

**static var curveEaseOut: UIView.AnimationOptions**

- 애니메이션이 빠르게 시작되고 완료 될 쯤 느려짐.

### 2. timeAgoSince Extension

마이피드와 그룹피드의 게시물 작성 시간이 현재로부터 얼마 전인지 표시해주는 extension입니다.

사용방법은 다음과 같습니다.

```swift
var createTime = "2021-01-13 14:00:00"

createTime.StringToDate().timeAgoSince()
// 1. createTime을 StringToDate를 통해 String타입에서 Date 타입으로 바꿔줌
// 2. timeAgoSince를 통해 이 시간이 현재 시간을 기준으로 얼마전인지 구해주기
```

자세히 알아보기 이전에, 날짜 계산에 필요한 `NSCalendar` 에 대해 알아보도록 하겠습니다!

쉽게 말해서 `NSCalendar` 객체는 실질적인 날짜 계산을 수행하는 클래스입니다. 

달력을 이용해서 특정 시점을 날짜 단위로 변경하면 이 날짜는 여러 구성 요소로 나뉘어 년, 월, 일, 요일, 몇 째 주인지 등의 정보가 나오게 됩니다. 이러한 정보를 모아서 표시할 수 있도록 해주는 객체가 `components` 입니다.

날짜 구성 요소로 지정된 시작 날짜와 종료 날짜의 차이를 반환하는 `components` 관련 메소드를 알아보겠습니다.

```swift
func components(_ unitFlags: NSCalendar.Unit, 
           from startingDateComp: DateComponents, 
             to resultDateComp: DateComponents, 
        options: NSCalendar.Options = []) -> DateComponents
```

각 파라미터를 살펴보면, 다음과 같습니다.

`unitFlags` : 반환 된 NSDateComponents 개체의 구성 요소를 지정합니다.

`startingDateComp` : NSDateComponents 개체로 계산의 시작 날짜입니다.

`resultDateComp` : NSDateComponents 개체로 계산의 종료 날짜입니다.

`option` : 옵션 매개 변수는 현재 사용되지 않습니다.

이러한 `components` 메소드를 바탕으로 게시물의 작성 시간이 현재보다 얼마 전인지 계산할 수 있습니다.

```swift
func timeAgoSince() -> String {
		        //유저의 캘린더에서 현재시점을 가져옵니다.
            let calendar = Calendar.current

						//date를 string으로 바꾸고, string타입을 date타입으로 바꿔줍니다.
            let now = Date().datePickerToString().stringToDate()

						//연도, 월, 일 및 시간과 같은 달력 단위를 식별해서 넣어줍니다.
            let unitFlags: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
						
						//게시물 작성날짜와 현재 날짜의 차이를 날짜 구성 요소로 반환합니다.
            let components = (calendar as NSCalendar).components(unitFlags, from: self, to: now, options: [])

            if let year = components.year, year >= 1 {
                return "\(year)년 전"
            }
                    
            if let month = components.month, month >= 1 {
                return "\(month)달 전"
            }
            
            if let week = components.weekOfYear, week >= 1 {
                return "\(week)주 전"
            }
                    
            if let day = components.day, day >= 1 {
                return "\(day)일 전"
            }
            
            if let hour = components.hour, hour >= 1 {
                return "\(hour)시간 전"
            }
            
            if let minute = components.minute, minute >= 1 {
                return "\(minute)분 전"
            }
            
            if let second = components.second, second >= 3 {
                return "\(second)초 전"
            }
            
            return "지금"
        }
```


<br>

## :point_right: About Us 

<br>

<div align="center">
	<h3> "미닝의 iOS 개발자들은 코드리뷰와 효율적인 협업으로 함께 성하는 앱개발을 지향합니다." </h3> 
 <br>
 
| **민희** | **민승** |  **세은** |
|:-----:|:-----:|:------:|
|  <img src="https://user-images.githubusercontent.com/37579661/103434922-46433580-4c4b-11eb-8527-81516ffe3079.png" height=500>| <img src="https://user-images.githubusercontent.com/37579661/103434773-46423600-4c49-11eb-91b6-6ac564adf15b.jpeg" height=500> | <img src="https://user-images.githubusercontent.com/37579661/103435523-16982b80-4c53-11eb-86b9-b64d4d61a5ba.jpeg" height=500 width=260>|
| **contact** : xwoud@naver.com </br> **github**: [xwoud](https://github.com/xwoud)|**contact** : seonminseung@naver.com </br> **github**: [MinseungSeon](https://github.com/minseungseon)  | **contact** : hotpigtomato@gmail.com </br> **github**: [pk33n](https://github.com/pk33n)|
| 타임스탬프, 홈 화면 담당 | 스플래시 및 로그인, 미션 화면 담당  | 그룹 및 커스텀 탭바 담당 |
</div>
