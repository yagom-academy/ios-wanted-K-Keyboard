# ios-wanted-K-Keyboard

</br>

## 팀원 소개

|                                                                Eddy(권준상)                                                                 |                                                                Mango(강민교)                                                                |
| :-----------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------: |
| <img src="https://user-images.githubusercontent.com/31722496/192504266-ff50f0da-68f1-488d-82a5-765cc5a249be.png" width="200" height="200"/> | <img src="https://user-images.githubusercontent.com/61138164/194685598-2fb5ef98-a001-44d2-b020-50554b1cf939.png" width="200" height="200"/> |
|                                                             Extension Keyboard                                                              |                                                          첫번째 화면 UI 코드 구현                                                           |
|                                                                한글 오토마타                                                                |                                                                  리팩토링                                                                   |

</br>

## 📁 폴더 구조
![KakaoTalk_Photo_2022-10-08-12-20-15]()

<img width="330" alt="스크린샷 2022-10-08 오후 12 10 08" src="https://user-images.githubusercontent.com/61138164/194685232-9c3e02ba-0df1-4e89-95bd-0f224dfaa35e.png">

### Application

- AppDelegate, SceneDelegate, Info.plist 등

### Source

- **Extensions**: Extension 모음
- **Feature** : 기능 구현

### Feature

- **BuyKeyboard**: 첫 번째 화면 관련 모음
- **Keyboard**: 커스텀 키보드 화면 관련 모음

### Resource

- **Assets**: Color, 디자인에 필요한 이미지

### KKeyboard

- Extension Keyboard 관련 파일

</br>

## 📱 구현 화면

### 첫 번째 화면
<div>
<img width="250" alt="스크린샷 2022-10-08 오후 12 10 08" src="https://user-images.githubusercontent.com/61138164/194685341-0503719b-7b3d-44a8-aecf-bc36a0da04fa.png">
<img width="250" alt="스크린샷 2022-10-08 오후 12 10 08" src="https://user-images.githubusercontent.com/61138164/194685352-25330016-b8da-42ff-afa8-399e78c266a5.png">
<img width="250" alt="스크린샷 2022-10-08 오후 12 10 08" src="https://user-images.githubusercontent.com/61138164/194685376-a74636f8-a610-4258-b125-c58cd5c9f749.png">
</div>

</br>

### 두 번째 화면
<img width="250" alt="스크린샷 2022-10-08 오후 12 10 08" src="https://user-images.githubusercontent.com/61138164/194685391-f98ce189-82a4-414a-a7cb-5870e15b3d13.png">


</br>

### 세 번째 화면
<img width="250" alt="스크린샷 2022-10-08 오후 12 10 08" src="https://user-images.githubusercontent.com/61138164/194685402-3a18bb15-13cc-4ff0-a224-83b5b2938d26.png">

</br>

## 🛠 기능 구현 방식

## 💁‍♀️ 테마 정보 페이지 구현

### ViewController

### 화면구성

- ScrollView
    - 전체적인 화면 구성
        - TagView
        - keywordView
        - emojiView
        - BannerView
        - TableView
            - 작성된 댓글 보여주기

- Toolbar
    - 구매하기 툴바
        - 젬 개수 보여주기
        - 구매하기 버튼 누르면 PopUpView로 이동
    - 댓글작성 툴바
        - 상품 구매 후 리뷰 작성 가능
        - 빈 댓글 등록 불가능
        - 20글자 이상 작성불가능
        - 댓글을 쓰고 등록을 누르면 TableView에 추가

### PopUpViewController

### 화면구성

- PopUpView
    - 충전하고 바로 사용하기 버튼
        - MainView의 툴바가 댓글 작성 툴바로 변경

이슈

- backgroundView와 popupView를 분리하지 않아 popupView도 투명해짐
- iOS 최소버전을 나중에 맞춰 에러가 발생함

</br>

## 🧾 한글 오토마타 구현

### 입력 로직

```
5개의 상태로 나누어 구현하였습니다.

enum KeyboardState {
    case start              // Space 키 입력한 상태 or 처음 시작 상태
    case firstConsonantOnly // 자음만 있는 상태 ex) ㄱ, ㄲ
    case vowelOnly          // 모음만 있는 상태 ex) ㅓ, ㅘ
    case consonantPlusVowel // 자음 + 모음 ex) 가, 과
    case finalConsonant     // 자음 + 모음 + 자음 ex) 강, 갏, 괋
}

1) Start : Space 키 입력한 상태 or 처음
입력된 글자가 자음
- firstConsonantOnly 상태, 입력한 글자 추가

입력된 글자가 모음
- vowelOnly 상태, 입력한 글자 추가

2) FirstConsonantOnly : 초성만 있는 상태
입력된 글자가 자음 (자음 + 자음 == 된소리자음)
- 글자가 (ㅂ, ㅈ, ㄷ, ㄱ, ㅅ) 중 하나이고 그 전 값과 같을 경우, 된소리로 변환
- firstConsonantOnly 상태, 전 글자 삭제 후 된소리 글자 추가

입력된 글자가 자음 (자음 + 자음 != 된소리 자음)
- 영어처럼 분리
- firstConsonantOnly 상태, 입력한 글자 추가

입력된 글자가 모음 (자음 + 모음)
- 전 값은 초성이기 때문에 함께 합쳐 글자가 만들어진다.
- consonantPlusVowel 상태, 전 글자 삭제 후 생성된 글자 추가

3) VowelOnly : 모음만 있는 상태
입력된 글자가 자음 (모음 + 자음)
- 영어처럼 분리
- firstConsonantOnly 상태, 입력한 글자 추가

입력된 글자가 모음 (모음 + 모음 == 이중 모음)
- 두 개의 모음을 합쳐 글자를 생성한다.
- vowelOnly 상태, 전 글자 삭제 후 입력한 글자 추가

입력된 글자가 모음 (모음 + 모음 != 이중 모음)
- 영어처럼 분리
- vowelOnly 상태, 입력한 글자 추가

4) ConsonantPlusVowel : 자음 + 모음인 상태
입력된 글자가 자음 (자음 + 모음 + 자음)
- 입력된 글자는 종성이기 때문에 함께 합쳐 글자를 생성한다.
- finalConsonant 상태, 전 글자 삭제 후 생성된 글자 추가

입력된 글자가 모음 (자음 + 모음 + 모음 && 모음 + 모음 == 이중모음)
- 두 개의 모음이 합쳐지는 이중 모음이라면 함께 합쳐 글자를 생성한다.
- consonantPlusVowel 상태, 전 글자 삭제 후 생성된 글자 추가

입력된 글자가 모음 (자음 + 모음 + 모음 && 모음 + 모음 != 이중 모음)
- 영어처럼 분리
- vowelOnly 상태, 입력된 글자 추가

5) FinalConsonant : 자음 + 모음 + 자음인 상태
입력된 글자가 자음 (자음 + 모음 + 자음 + 자음 && 자음 + 자음 == 이중 종성)
- 두 개의 자음이 합쳐지는 이중 종성이라면 함께 합쳐 글자를 생성한다.
- finalConsonant 상태, 전 글자 삭제 후 생성된 글자 추가

입력된 글자가 자음 (자음 + 모음 + 자음 + 자음 && 자음 + 자음 != 이중 종성)
- 영어처럼 분리
- firstConsonantOnly 상태, 입력된 글자 추가

입력된 글자가 모음 (자음 + 모음 + 자음 + 모음)
- 두 글자로 분리됨, 종성과 입력된 중성이 만나 (초성 + 중성)의 형태로 합성됨
- consonantPlusVowel 상태, 전 글자 삭제 후 분리된 두 글자를 추가
```

### 삭제 로직

```
1) Start
- 지우고 나서 상태를 모름

2) FirstConsonantOnly
지운 단어가 된소리 자음
- firstConsonantOnly 상태, 된소리 전 자음 추가

지운 단어가 그냥 자음
- 지우고 나서 상태를 모름

3) VowelOnly
지운 단어가 이중 모음
- vowelOnly 상태, 이중 모음 중 마지막 모음 삭제

지운 단어가 그냥 모음
- 지우고 나서 상태를 모름

4) ConsonantPlusVowel
지운 단어가 이중 모음
- ConsonantPlusVowel 상태, 이중 모음 중 마지막 모음 삭제

지운 단어가 그냥 모음
- firstConsonantOnly 상태, 모음만 삭제

5) FinalConsonant
지운 단어가 그냥 종성
- ConsonantPlusVowel 상태, 마지막 종성만 제거

지운 단어가 이중 종성
- FinalConsonant 상태, 이중 종성 중 마지막 종성 삭제

6) 지우고 나서 상태를 모르는 경우 : deleteInUnpredictableState()
-> 직접 마지막 문자를 분석하여 상태를 알아낸다
```

## 📼 실행 영상

https://user-images.githubusercontent.com/61138164/194685913-fb9d7bee-e580-41df-9310-a82a077ce6dc.mov

