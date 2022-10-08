![team1](https://user-images.githubusercontent.com/33388081/194698936-8386e827-4021-4909-84a5-953e5382ba27.jpeg) {: width="100" height="100"}
![KakaoTalk_Photo_2022-04-07-14-34-31 004](https://user-images.githubusercontent.com/33388081/194698957-4236e987-1ca2-4248-9659-e72eacecae5c.jpeg) {: width="100" height="100"}


# ios-wanted-K-Keyboard
## 역할 분담 및 앱에서 기여한 부분
### 휘양(신동원)
- 커스텀 키보드
  - 키보드 디자인 및 레이아웃
  - 키보드 터치 이벤트, 단축키 기능
  - 한글 텍스트 삭제 시 겹받침, 겹모음 분리 삭제 기능 및 기타 예외처리
  
- 테마 정보 페이지
  - tableView 기본 구조 구현(상단 미리보기, 스크립트)
  - collectionView 를 이용한 태그 및 키워드 cell 구현
  - 폰트, 라벨, 컬러 extension 구현
  - 하단 구매하기 바 구현
  - 충전/사용 modal 구현

### keurong(유영훈)
- 커스텀 키보드
    - 한글 자모 조합 기능 담당
    - 키보드의 커스텀 툴바 구현
    - 키보드 Sample1 자주쓰는말 리스트, 화면을 구현
- 테마 정보 페이지
    - 테마 평가, 광고 배너, 리뷰섹션 디자인 구현
    - 리뷰 작성 기능 구현
    - notification활용 구매 전, 후 UI 업데이트

## 뷰 구성 정보 및 기능

### 테마 정보 페이지

- 화면 구성
  - TableView
    - 협업의 편의를 위해 기능 마다 cell로 나누었음
    - 태그 및 키워드 cell의 경우 collectionView로 구현
  - bottomView
    - 구매전 : 구매하기 바 , 구매후 : 댓글 입력 바
    - 구매하기 : 버튼을 누를 시 modal 창을 띄운다
  - modal
    - 충전 및 사용 버튼을 누를 시 창이 닫히고 bottomView의 내용이 댓글 입력 창으로 바뀐다
  

### 커스텀 키보드

- 화면 구성
  - KeyboardViewController
  - KeyboardView
  - KeyboardCharacter
    - KeyboardCharacter의 버튼 배열을 이용하여 KeyboardView를 만든다
    - keyboardView를 KeyboardViewController 의 view로 교체 한다
    - 각 키보드 버튼의 기능을 구현한다
    
- 한글 입력/삭제 combine
    - HangulCombinater
        - 한글 자모의 분리, 조합기능을 담당한다.
            - 현재 입력텍스트, 직전 입력텍스트를 비교하여 케이스 분기

### 프로젝트 후기 및 고찰
### 휘양
  - 키보드 익스텐션
    - 항상 ios기본 키보드만을 이용했기 때문에 내부에서 한글 combine을 해주고 있었고, 직접 구현이 쉽지 않다는 걸 느꼈다.
  - 기본이 가장 어렵다
    - collectionView와 tableView는 ios ui의 기본이라고 할 수 있다. 허나 나에게 collectionView는 아직 공부가 부족하다는걸 알 수 있었다.
  - 아쉬운점
    - 요구사항에는 없었지만, 단축키를 등록/삭제 하는 기능을 만들어보고 싶었는데 시간이 부족하여 구현하지 못하였다
      
### keurong
- 키보드 익스텐션
    - 키보드 익스텐션을 처음 접했고 한글 자모 알고리즘 및 분기되는 케이스가 많았기에 구현에 시간이 조금 걸렸던듯하다.
- 코드로 구현하는 UI & Autolayout
    - 스토리보드로 주로구현하다 코드로 거의 처음 프로젝트를 많이 접하게됬는데
    익숙하지 않은 방식과 적은 시간제한에 어려움을 느꼇으나 코드로 UI를 구현하는데 좋은 경험을 한듯하다.

