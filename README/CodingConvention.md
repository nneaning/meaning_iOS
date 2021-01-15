# ⌨️ Coding Convention  


## 코드 레이아웃

### 들여쓰기 및 띄어쓰기

- 들여쓰기에는 탭(tab) 대신 2개의 space를 사용합니다.
- 콜론(`:`)을 쓸 때에는 콜론의 오른쪽에만 공백을 둡니다.

    ```swift
    let names: String?
    var day: Date?
    ```

### 줄바꿈

- 함수를 호출하는 코드가 최대 길이를 초과하는 경우에는 파라미터 이름을 기준으로 줄바꿈합니다.

    ```swift
    let actionSheet = UIActionSheet(
      title: "정말 계정을 삭제하실 건가요?",
      delegate: self,
      cancelButtonTitle: "취소",
      destructiveButtonTitle: "삭제해주세요"
    )
    ```

    단, 파라미터에 클로저가 2개 이상 존재하는 경우에는 무조건 내려쓰기합니다.

    ```swift
    UIView.animate(
      withDuration: 0.25,
      animations: {
        // doSomething()
      },
      completion: { finished in
        // doSomething()
      }
    )
    ```

- `if let` 구문이 길 경우에는 줄바꿈하고 한 칸 들여씁니다.

    ```swift
    if let user = self.veryLongFunctionNameWhichReturnsOptionalUser(),
      let name = user.veryLongFunctionNameWhichReturnsOptionalName(),
      user.gender == .female {
      // ...
    }
    ```

- `guard let` 구문이 길 경우에는 줄바꿈하고 한 칸 들여씁니다. `else`는 `guard`와 같은 들여쓰기를 적용합니다.

    ```swift
    guard let user = self.veryLongFunctionNameWhichReturnsOptionalUser(),
      let name = user.veryLongFunctionNameWhichReturnsOptionalName(),
      user.gender == .female
    else {
      return
    }
    ```

### 빈 줄

- 빈 줄에는 공백이 포함되지 않도록 합니다.
- 모든 파일은 빈 줄로 끝나도록 합니다.
- MARK 구문 위와 아래에는 공백이 필요합니다.

    ```swift
    // MARK: Layout

    override func layoutSubviews() {
      // doSomething()
    }

    // MARK: Actions

    override func menuButtonDidTap() {
      // doSomething()
    }
    ```

### 임포트

모듈 임포트는 알파벳 순으로 정렬합니다. 내장 프레임워크를 먼저 임포트하고, 빈 줄로 구분하여 서드파티 프레임워크를 임포트합니다.

```swift
import UIKit

import SwiftyColor
import SwiftyImage
import Then
import URLNavigator
```

## 네이밍

### 클래스

- 클래스 이름에는 UpperCamelCase를 사용합니다.

    CamelCase에서, 맨 앞글자를 대문자로 표기하는 것을 뜻합니다. PascalCase라고도 불립니다.

    나머지 뒤에 따라붙는 단어들의 **앞글자는 모두 대문자**로 표기합니다

- 클래스 이름에는 접두사를 붙이지 않습니다.

### 함수

- 함수 이름에는 lowerCamelCase를 사용합니다.
- 함수 이름 앞에는 되도록이면 `get`을 붙이지 않습니다.

    **좋은 예:**

    ```swift
    func name(for user: User) -> String?
    ```

    **나쁜 예:**

    ```swift
    func getName(for user: User) -> String?
    ```

- Action 함수의 네이밍은 ‘주어 + 동사 + 목적어’ 형태를 사용합니다.
    - *will은 특정 행위가 일어나기 직전이고, did*는 특정 행위가 일어난 직후입니다.
    - *should~*는 일반적으로 `Bool`을 반환하는 함수에 사용됩니다.

    **좋은 예:**

    ```swift
    func backButtonDidTap() { // back 버튼을 클릭 했을 때
      // ...
    }
    ```


### 변수

- 변수 이름에는 lowerCamelCase를 사용합니다.

### 상수

- 상수 이름에는 lowerCamelCase를 사용합니다.

    **좋은 예:**

    ```swift
    let maximumNumberOfLines = 3
    ```

    **나쁜 예:**

    ```swift
    let kMaximumNumberOfLines = 3
    let MAX_LINES = 3
    ```

### 열거형

- enum의 각 case에는 lowerCamelCase를 사용합니다.

    **좋은 예:**

    ```swift
    enum Result {
      case .success
      case .failure
    }
    ```

    **나쁜 예:**

    ```swift
    enum Result {
      case .Success
      case .Failure
    }
    ```

### 약어

- 약어로 시작하는 경우 소문자로 표기하고, 그 외의 경우에는 항상 대문자로 표기합니다.

    **좋은 예:**

    ```swift
      let userID: Int?
      let html: String?
      let websiteURL: URL?
      let urlString: String?
      
    ```

    **나쁜 예:**

    ```swift
      let userId: Int?
      let HTML: String?
      let websiteUrl: NSURL?
      let URLString: String?
      
    ```

### Delegate

- Delegate 메서드는 프로토콜명으로 네임스페이스를 구분합니다.

    **좋은 예:**

    ```swift
    protocol UserCellDelegate {
      func userCellDidSetProfileImage(_ cell: UserCell)
      func userCell(_ cell: UserCell, didTapFollowButtonWith user: User)
    }
    ```

    **나쁜 예:**

    ```swift
    protocol UserCellDelegate {
      func didSetProfileImage()
      func followPressed(user: User)

      // `UserCell`이라는 클래스가 존재할 경우 컴파일 에러 발생
      func UserCell(_ cell: UserCell, didTapFollowButtonWith user: User)
    }
    ```

## 클래스와 구조체

- 클래스와 구조체 내부에서는 `self`를 명시적으로 사용합니다.
- 구조체를 생성할 때에는 Swift 구조체 생성자를 사용합니다.

    **좋은 예:**

    ```swift
    let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    ```

    **나쁜 예:**

    ```swift
    let frame = CGRectMake(0, 0, 100, 100)
    ```

## 타입

- `Array<T>`와 `Dictionary<T: U>` 보다는 `[T]`, `[T: U]`를 사용합니다.

    **좋은 예:**

    ```swift
    var messages: [String]?
    var names: [Int: String]?
    ```

    **나쁜 예:**

    ```swift
    var messages: Array<String>?
    var names: Dictionary<Int, String>?
    ```

## 주석

- `///`를 사용해서 문서화에 사용되는 주석을 남깁니다.

    ```swift
    /// 사용자 프로필을 그려주는 뷰
    class ProfileView: UIView {

      /// 사용자 닉네임을 그려주는 라벨
      var nameLabel: UILabel!
    }
    ```

- `// MARK:`를 사용해서 연관된 코드를 구분짓습니다.

    Objective-C에서 제공하는 `#pragma mark`와 같은 기능으로, 연관된 코드와 그렇지 않은 코드를 구분할 때 사용합니다.

    ```swift
    // MARK: Init

    override init(frame: CGRect) {
      // doSomething()
    }

    deinit {
      // doSomething()
    }

    // MARK: Layout

    override func layoutSubviews() {
      // doSomething()
    }

    // MARK: Actions

    override func menuButtonDidTap() {
      // doSomething()
    }
    ```

## 코드 위치

```swift
class HomeVC: UIViewController { 
	// Mark: Variable Part
	// 변수 상수들을 선언하기
	// lowerCamelCase를 사용한다
	// ex) var userName: String?
	
	// Mark: IBOutlet
	// Label,ImageView,Button 등 @IBOutlet 선언하기
	// @IBOutlet weak var titleLabel: UILabel!

	// Mark: IBAction
	// 동작을 선언하는 @IBAction 선언하기
	// 주어 + 동사 + 목적어의 형태 사용하기
	// ex) @IBAction func backButtonDidTap(_ sender: Any)
	
	// Mark: Life Cycle Part
	// ex) viewWillAppear(), ViewDidLoad()
}

extension HomeVC {
	// Mark: Function
	// 로직을 구현하는 함수 부분
	// ex)func name(for user: User) -> String?

}

// Mark: Extension
// 클래스를 확장할 때 사용
// ex) UITableViewDelegate
```
<br>

## 라이센스

본 문서는 Swift Style Guide를 참고해 **team meaning**에 맞게 수정하였습니다.
[크리에이티브 커먼즈 저작자표시 4.0 국제 라이센스](http://creativecommons.org/licenses/by/4.0/)에 따라 이용할 수 있으며, 저작권은 [전수열](https://github.com/devxoul)과 [StyleShare](https://stylesha.re/)에게 있습니다.

<br>
