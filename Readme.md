# Readme

### 쏘롱

- 첫번째 화면 UI구현

### Eric

- 키보드 관련 기능 구현

## 정보 및 기능

### 첫번째 화면 - MainViewController

- KeyboardImageView
    - image와 lebel을 이용해 뷰의 첫화면을 구성
- TagView
    - collectionView를 이용하여 cell의 lebel의 길이에 맞게 넓이 구현
- KeyWordView
    - collectionView를 이용하여 카드형식의 셀을만들어 가로 스크롤 형식으로 구현
- ThemaView
    - stackView를 이용하여 각느낌의 뷰를 담아 선택시 생상변경과 카운트갯수를 증가시키고 해제시 원래상태로 복구
- PurchaseReviewView
    - tableView를 이용하여 Cell의 lebel에 맞게 넓이 구현
    - 리뷰작성시 tableView에 저장기능구현
- PopView
    - 구매하기 버튼을 클릭시 보여줄 View를 만든뒤 PurchaseAlertViewController를 이용하여 보여주는 기능 구현
    - PopView의 충전하고 바로사용하기 버튼을 눌릴시 TextFiled로 화면전환 구현및 TableView에 저장 기능 구현

# Keyboard Extension

## 구조

- Extensions
    - KeyboardExtension 내에서만 사용하는 Extension 파일들입니다.
- Models
    - KeyboardExtension 내에서 공통적으로 사용하는 Struct들을 정의했습니다.
    - Phoneme
        - 음소를 나타내는 Protocol입니다. Phoneme을 채택하는 Consonant(자음)과 Vowel(모음)으로 나뉩니다.
    - Syllable
        - 음절을 나타내는 Syllable입니다.
        - 초성, 중성, 종성을 나타내는 Phoneme을 가지고 있으며 이를 기반으로 unicode를 계산하여 리턴하는 기능이 있습니다.
        - receive(_:) 메소드를 통해 다음 음소를 이 음절 내에서 처리할 수 있다면 처리한 뒤 true를 리턴하고, 처리할 수 없다면 false를 리턴합니다.
- ViewModels
    - 각 View들이 참조하는 ViewModel들이 있습니다.
- Views
    - ViewModel을 참조하여 UI를 그리는 View들이 있습니다.
    - MainViewController
        - UIInputViewController의 서브클래스입니다.
        - 키보드, 툴바 View 등을 가지고 있으며, 각 View들이 글의 추가 / 삭제 요청을 현재 입력창의 Context에 맞게 처리해줍니다.
    - FrequentlyUsedWords
        - 자주 쓰는 말 화면을 구현하는데 필요한 View들이 모여 있습니다.
        - 자주 쓰는말의 목록을 가지고 있으며, 사용자가 선택하면 MainViewController에 입려요청을 보냅니다.
    - Keyboard
        - 키보드 화면을 구현하는 View입니다. 조합중인 문자열을 저장하고 있다가, 키보드의 입력이 발생하면 MainViewController에 업데이트를 요청합니다.
        - MainViewController에서 커서의 위치가 이동하는 등의 Action으로 인해 입력창의 Context가 바뀌면, 조합중인 음소들을 모두 비우고 새롭게 조합을 시작합니다.
    - ToolBar
        - 상단 툴바를 구현하는 View입니다.
        - 선택된 index를 확인해 MainViewController가 FrequentlyUsedWordsView와 KeyboardView 중 어떤 View를 띄울지 결정하도록 합니다.

### UnitTests

- 음소 조합과 관련된 기능을 테스트하기 위해 Syllable 객체와 KeyboardModel, MainViewModel에 대한 유닛테스트를 작성하였습니다.

### 기능

- 한글 쿼티 키보드
    - iOS에서 기본적으로 제공하는 한글 키보드와 동일하게, 키 입력을 통해 어느 앱에서든 한글을 입력할 수 있도록 구현하였습니다.
    - UIInputViewController의 textDidChange(_:) 메소드와 UITextDocumentProxy.documentContextBeforeInput를 통해 커서 이동 등의 Action이 있어도 정상적으로 입력될 수 있도록 구현하였습니다.
    - textDocumentProxy에 입력을 진행할 때, 앞서 입력된 내용들을 모두 지우고 새로 입력하는 방식 대신, 이전에 입력되어 있던 내용과 입력될 내용의 길이를 비교하여 필요한 만큼만 deleteBackward() 메소드를 통해 지우고, 새로 입력되는 내용이 들어가도록 최적하 하였습니다.
- 상단 탭바 및 자주 쓰는 말
    - 기능 선택이 가능한 상단 탭바를 추가하고, 세 번째 버튼이 활성화 되었을 때 자주 쓰는 말 화면이 노출되어 미리 등록된 단어들을 입력할 수 있도록 구현하였습니다.
- 단축키
    - 한글 쿼티 키보드 하단에 단축키 버튼을 추가하였습니다.
    - 짧게 탭하면 마지막으로 선택한 단축키가 입력됩니다.
    - 길게 탭하면 다음으로 사용할 단축키 목록을 보여줍니다.
    - 다음으로 사용할 단축키를 선택하면, 단축키 목록에서 해당 단축키를 제일 위로 올리고, 쿼티 키보드 하단의 단축키 버튼을 해당 단어로 교체합니다.
    

### 프로젝트 후기

### 쏘롱

- 화면을 구현할때 많은 방법들이 있지만 이번 프로젝트를 하면서
코드위주로 UI구성을 하게되었다.주로 Storyboard로 UI구성을 해봤기때문에 코드로 하나하나 다 구현해본적은 처음이라 눈에 보이지않는 레이아웃들을 잡아 나가는게 쉽지않았지만 코드로 구현해보니 읽기쉽고 유지보수하기 간편하다는걸 알수있었고 코드로가능한 기능또한 공부할수있었다. 또한 아직 해보지 못한 xib를 사용하여 UI구성을 해봐야겠다는 생각을 했다.