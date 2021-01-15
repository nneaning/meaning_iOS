# Git Flow
```shell
💻 main
 ┗ 🗂 develop
   ┣ 📑 1st/camera_view
   ┣ 📑 1st/login_view
   ┣ 📑 2nd/card_detail
   ┗ 📑 ...
 ```
- 기능별 브랜치를 만들어서 작업합니다.
- master(main) - develop - feature branch 의 형태
- master(main)
    - 배포 가능한 상태(= 제출 가능한 상태)로 관리
- develop
    - 다른 브랜치를 합치는 통합 브랜치로서 사용
    - 우리의 feature branch를 여기로 merge 하여 오류가 나지않은 안정적인 상태일 때 main(master)에 올려서 main(master)는 항상 안정적인 상태로 유지합니다.
- feature
    - feature 브랜치들은 기능별로 생성하여 사용합니다.
    - 우선순위/기능이름 으로 이름을 짓습니다. ex) 1st/login, 1st/home, 2nd/calendar, 3th/mypage
    - 기능 구현이 완료된다면 develop으로 병합 후 삭제합니다.
<br>

# Git Message  

1. 먼저 커밋 메시지는 크게 **제목, 본문, 꼬리말** 세 가지 파트로 나누고, 각 파트는 빈줄을 두어서 구분합니다.
2. 커밋 메세지는 모두 **한글**로 통일합니다.
3. 제목의 경우, type은 **대괄호 안에 소문자로 작성**합니다.
4. 이슈를 해결했다면, footer에 적습니다.(footer는 생략 가능합니다.)

```bash
[type] Subject  // -> 제목 

(한 줄을 띄워 분리합니다.)

body //  -> 본문 

(한 줄을 띄워 분리합니다.)

footer(옵션) // -> 꼬리말
```
<br>

## type

- 어떤 의도로 커밋했는지를 type에 명시합니다.
- 제목은 최대 50글자가 넘지 않도록 하고 마침표는 찍지 않습니다.

1. `feat` : 새로운 기능 추가하기

    ```bash
    [feat] 버튼 클릭 시 날짜 선택 하는 기능 추가

    body: 버튼 클릭 시 picker를 통해 날짜를 선택하게 구현
    picker뷰는 toolbar를 이용했음
    ```

2. `fix` : 버그 수정하는 경우

    ```bash
    [fix] 라벨 길이가 짤리는 버그 수정

    body: 라벨 길이를 view leading에서 간격 추가
    ```

3. `refactor` : 코드 리팩토링 하는 경우

    ```bash
    [refactor] MainVC 코드 정리

    body: convension 내용 중 변수명을 지키지 못한 점 수정
    lowerCamelCase를 지켜서 변수명을 수정했음

    ```

4. `style` : 색상 변경, 폰트 변경 등이 있는 경우

    ```bash
    [style] back 버튼 색상 red로 변경

    body: 제플린 수정으로 인해 black -> red로 변경
    ```

5. `upload` : 파일 생성하는 경우

    ```bash
    [upload] HomeVC 파일 생성
    ```

6. `docs` : 문서 수정하는 경우

    ```bash
    [docs] README.md 파일 수정

    body: Git Message Convention 방법 정리
    ```

## body

- **"body: " 를 앞에 포함**하여 작성합니다.
- 긴 설명이 필요한 경우에 작성합니다.
- **어떻게** 했는지가 아니라, **무엇을** **왜** 했는지를 작성합니다.
- 최대 75자를 넘기지 않도록 합니다.

## footer (생략 가능)

- 꼬리말은 optional이고 이슈 트래커 ID를 작성합니다.
- 꼬리말은 "유형: #이슈 번호" 형식으로 사용합니다.
- 여러 개의 이슈 번호를 적을 때는 쉼표로 구분합니다.
- 이슈 트래커 유형은 다음 중 하나를 사용합니다.
    - Fixes: 이슈 수정중 (아직 해결되지 않은 경우)
    - Resolves: 이슈를 해결했을 때 사용
    - Ref: 참고할 이슈가 있을 때 사용
    - Related to: 해당 커밋에 관련된 이슈번호 (아직 해결되지 않은 경우)

    ### ex)

    - Fixes: #45
    - Related to: #34, #23
    - close #45
    - Related to: #112

```bash
[feat] "추가 로그인 함수" 로그인 서버 연결

body: 로그인 구조체 생성(Login Model)
로그인 URL 연결

Resolves: #5
```
<img src = "https://user-images.githubusercontent.com/51286963/103551614-eddf9280-4eed-11eb-89a9-713ee42927ba.png" width = "300">

<br>

# Template

meaning iOS 팀은 더 나은 개발 협업을 위해 PR, ISSUE 템플릿을 사용합니다. 

## 01 PR Template

```markdown
## 작업 내용 
[ ]
[ ] 
[ ] 

## 관계된 이슈, PR : 

## 스크린샷

## 레퍼런스 
```

## 02 Issue Template - Bug

```markdown
## 어떤 bug 인가요? 

## 에러 메시지 또는 스크린샷

## bug 확인 방법
1. bug 위치 
2. 어떻게 발생하는지 (컴파일 에러, 등 )

## tried out solution 

```

## 03 Issue Template - Challenge

```markdown
## CHALLENGE 내용 
- [] ex. 컬렉션 뷰 레이아웃 잡기
- []
- [] 

## 관련 스크린샷 

## 관련된 이슈

## 논의했던 관련 레퍼런스

## 유의할 점 
```
<br>

# Git Tool  
meaning iOS 는 더 나은 git hub 협업을 위해 **zenhub** 를 사용합니다.
zenhub를 통해 epic과 issue를 관리합니다.
<img src = "https://user-images.githubusercontent.com/51286963/103551956-7c541400-4eee-11eb-8e6b-708d793644d9.png" width = 600>
