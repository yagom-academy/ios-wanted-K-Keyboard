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
  - ㅇㅇㅇㅇㅇ
  
- 테마 정보 페이지
  - ㅇㅇㅇㅇㅇ

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
  - ㅇㅇㅇㅇㅇ

### 프로젝트 후기 및 고찰
### 휘양
  - 키보드 익스텐션
    - 항상 ios기본 키보드만을 이용했기 때문에 내부에서 한글 combine을 해주고 있었고, 직접 구현이 쉽지 않다는 걸 느꼈다.
  - 기본이 가장 어렵다
    - collectionView와 tableView는 ios ui의 기본이라고 할 수 있다. 허나 나에게 collectionView는 아직 공부가 부족하다는걸 알 수 있었다.
  - 아쉬운점
    - 요구사항에는 없었지만, 단축키를 등록/삭제 하는 기능을 만들어보고 싶었는데 시간이 부족하여 구현하지 못하였다
      
### keurong

