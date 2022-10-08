# README

# ****K-Keyboard**** App

---

## 팀원

|엄철찬|지준영|
|----|---|
|<img src="https://user-images.githubusercontent.com/96690194/194688984-8c9ae0e7-4d13-4e66-a522-5a307d9b5d9f.png" width="100" height="100"/>|<img src="https://user-images.githubusercontent.com/96690194/194689572-650cbc8b-eddc-4cb7-90f5-499eeea7fa19.jpg" width="100" height="100"/>
|James|Bill|


# 기본구조

## MVVM

- MVVM 패턴
- UIViewController에서 작성할 수 있는 UITableView, UIButton 등 UI컴포넌트 관련 로직을 최대한 타 클래스로 이관
- 모델, 뷰모델, 뷰 간에 일어날 수 있는 데이터의 흐름, 사용자 입력 이벤트의 전달은 클로저를 통해 처리
    
    ### Model
    
    - 비즈니스 로직
    - Repostiory
    - ViewModel의 초기화, ViewModel과의 참조 관계 설정
    - 초기화 시 Repository를 주입 받음
    
    ### ViewModel
    
    - Model이 처리하기에 작은, View의 특성과 연관된 로직 처리
    - Model에서 받은 데이터의 가공
    - View에 필요한 데이터 전달
    - View의 이벤트 수신. 필요시 Model로 전파
    - 초기화 시 Repository를 주입 받지 않음
    
    ### View
    
    - UITableView, UIButton등 UI컴포넌트를 add한 뷰
    - UITableViewDelegate, DataSource 역할을 겸함
    - UIButton Action 등 사용자 입력 이벤트를 수신
    - 사용자 입력 이벤트, 입력값 등 별도 처리가 필요한 사항은 ViewModel로 전달
    - 필요시 2개 이상의 View를 ViewController에 addSubView할 수 있음
    - 초기화 시 ViewModel을 주입 받음

## Repository

- Model 클래스 생성 시 기본적으로 주입하는 클래스
- UnitTest 추가 시 MockRepository의 구현을 용이하게 하고자 RepositoryProtocol을 채택
- 실전 상황이라고 가정했을 시 Repository가 HTTPClient를 통해 데이터를 주고 받을 필요성이 있어 임의로 추가
- ViewModel은 생성 시 Repository를 주입받지 않음. ViewModel은 연계된 특정한 View에 특화된 로직처리, 사용자의 입력 이벤트 송수신과 같은 처리만을 진행함. ViewModel이 Repository를 주입받지 않는 것은 ViewModel이 Repository와 타이트하게 커플링 되는 것을 막고자 하는 의도도 있음.

## ViewController Presentation + Dependency Injection

- ViewController에서 의존성주입, 다음 ViewController의 생성, Present 등 여러 코드를 작성하는 방법을 지양하고자 구현
- 이를 위해 Scenable, SceneBuildable, Routable, SceneCategory, SceneContext등 기본적인 프로토콜, Enum, Class를 구성
- Model 클래스는 연관된 ViewModel 클래스로부터 클로저로 처리된 특정한 알림을 받으며, 어느 ViewController를 띄울지, 어느 Alert을 띄울지와 같은 것을 평가하는 로직을 수행함. 수행된 로직에 따라 띄울 ViewController를 정하고 Model과 연결된 ViewController는 route() 메소드를 호출함. route() 메소드가 호출된 다음의 로직은 Routable, SceneBuildable이 처리함
    
    ### Routable, SceneBuildable, Scenable
    
    - SceneDelegate, ViewController는 각 클래스만을 위한 별도의 프로토콜을 채택할 수 있으며 이 별도의 프로토콜이란 SceneBuildable, Routable을 채택한 별도의 aaaSceneBuildable, aaaRoutable을 의미함
    - 필요시 aaaSceneBuildable, aaaRoutable 등의 프로토콜 조합, 프로토콜 제약을 활용
    - Routable, SceneBuildable은 파라미티로 SceneCategory Enum 값을 받으며 이 값을 통해 다음에 어느 ViewController를 생성하고, Present 할 지를 분기 처리함
    - 상기 로직을 처리하고자 모든 ViewController는 Scenable 프로토콜을 따름
    
    ### SceneCategory
    
    - App에서 전반적으로 present, push 되어야 할 ViewController에 대한 열거형
    - 각 case는 연관값으로 SceneCategory안에 정의된 또다른 ViewController에 대한 enum을 받거나, 의존성 주입을 위해 만든 클래스인 SceneContext를 받을 수 있음
    
    ### SceneContext
    
    - 각 ViewController에 주입해야 할 Model을 들고 있는 클래스

---

# UI Drawing

- UI 속성 추가를 위해 별도의 프로토콜 추가
    
    ## Programmatic UI
    
    - 스토리보드 - xib 미사용, 오토레이아웃으로 컨스트레인트 설정
    - UIViewController와 같은 클래스에는 별도의 UI컴포넌트를 붙이지 않음. 대신 UIView를 필요에 따라 2, 3개 이상 생성 후 addSubView를 진행.
    - addSubView된 UIView가 UITableView, UIButton 등의 UI컴포넌트를 소유
    - addSubView된 UIView가 UITableViewDelegate, DataSource의 역할을 수행
    
    ## UI Attribute - Presentable
    
    - 뷰간 하이어라키 설정, 오토레이아웃 설정, 바인딩 설정 등 기본적인 사항 진행 시 모든 ViewController, View가 어느 정도는 정해진 순서대로 절차를 진행해야 코드 가독성이 높아질 것으로 판단하여 만든 프로토콜
    - 강한 제약사항을 위한 것은 아니나 추후 다른 프로토콜과 합성, 제약 추가를 통해 응용이 가능할 것이기에 추가
    
    ## UI Attribute - Styleable
    
    - UI의 폰트컬러, 텍스트정렬, 그림자 효과 등을 추가할 시 한줄 한줄 적는 방식을 지양하고자 추가
    - 여러 속성을 한 번에 줄 수 있는 클로저를 넘기고, 실행하는 방식으로 구현
    - UIView, UIBarButtonItem, UINavigationItem 등 UI컴포넌트는 Styleable 프로토콜을 채택, 해당 UI타입들은 Styleable 의 메소드를 호출할 수 있음

---

# Keyboard

## Custom Keyboard Extension

- Xcode 프로젝트에 extension을 활용한 어느 앱에서나 작동하는 커스터마이즈된 키보드
- 기존의 시스템 키보드를 대체 가능
- 사용하기 위해선 별도의 세팅이 필요

|<img src="https://user-images.githubusercontent.com/96690194/194690092-91c22685-41bc-4336-acb3-0f932a119005.png" width="150" height="300"/>|<img src="https://user-images.githubusercontent.com/96690194/194690113-bf83f4d3-0809-4e01-b61d-713dbf1c0728.png" width="150" height="300"/> |<img src="https://user-images.githubusercontent.com/96690194/194690286-2d100c3e-6610-48f3-819d-0bab22fa9821.png" width="150" height="300"/>|<img src="https://user-images.githubusercontent.com/96690194/194690304-ada7bd59-cca1-4b03-ad13-7462d40709b7.png" width="150" height="300"/> |<img src="https://user-images.githubusercontent.com/96690194/194690327-880a81b5-8e23-4d41-861c-8e46f030af2a.png" width="150" height="300"/>|
|---------|----------|-----------|--------------|--------------|
|설정 → 일반|일반 → 키보드|키보드 → 키보드|새로운 키보드 추가|추가할 키보드 선택|



- 서드파티 키보드를 지원하는 앱이라면 사용할 수 있음

<p align="left">
<img src="https://user-images.githubusercontent.com/96690194/194690997-b6e312d2-9ed3-4b67-857a-f07acb729d1f.png" width="150" height="300"/>
<img src="https://user-images.githubusercontent.com/96690194/194690557-0914389e-7901-4e8d-ad2d-9780e09bb54c.png" width="150" height="300"/>
<img src="https://user-images.githubusercontent.com/96690194/194690569-62a315f6-59c7-4cb4-b590-18f49a551a01.png" width="150" height="300"/>
</p>



---

# 한글 조합

- 한글은 초성 19개(ㄱㄲㄴㄷㄸㄹㅁㅂㅃㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎ), 중성 21개(ㅏㅐㅑㅒㅓㅔㅕㅖㅗㅘㅙㅚㅛㅜㅝㅞㅟㅠㅡㅢㅣ), 종성(없는 경우 포함)(  ㄱㄲㄳㄴㄵㄶㄷㄹㄺㄻㄼㄽㄾㄿㅀㅁㅂㅄㅅㅆㅇㅈㅊㅋㅌㅍㅎ) 27개가 존재
- 유니코드 기준 0xAC00 (가) 를 시작으로 588 단위로 초성이 변경
- **가각갂갃간갅갆갇갈갉갊갋갌갍갎갏감갑값갓갔강갖갗갘같갚갛개객갞갟갠갡갢갣갤갥갦갧갨갩갪갫갬갭갮갯갰갱갲갳갴갵갶갷갸갹갺갻갼갽갾갿걀걁걂걃걄걅걆걇걈걉걊걋걌걍걎걏걐걑걒걓걔걕걖걗걘걙걚걛걜걝걞걟걠걡걢걣걤걥걦걧걨걩걪걫걬걭걮걯거걱걲걳건걵걶걷걸걹걺걻걼걽걾걿검겁겂것겄겅겆겇겈겉겊겋게겍겎겏겐겑겒겓겔겕겖겗겘겙겚겛겜겝겞겟겠겡겢겣겤겥겦겧겨격겪겫견겭겮겯결겱겲겳겴겵겶겷겸겹겺겻겼경겾겿곀곁곂곃계곅곆곇곈곉곊곋곌곍곎곏곐곑곒곓곔곕곖곗곘곙곚곛곜곝곞곟고곡곢곣곤곥곦곧골곩곪곫곬곭곮곯곰곱곲곳곴공곶곷곸곹곺곻과곽곾곿관괁괂괃괄괅괆괇괈괉괊괋괌괍괎괏괐광괒괓괔괕괖괗괘괙괚괛괜괝괞괟괠괡괢괣괤괥괦괧괨괩괪괫괬괭괮괯괰괱괲괳괴괵괶괷괸괹괺괻괼괽괾괿굀굁굂굃굄굅굆굇굈굉굊굋굌굍굎굏교굑굒굓굔굕굖굗굘굙굚굛굜굝굞굟굠굡굢굣굤굥굦굧굨굩굪굫구국굮굯군굱굲굳굴굵굶굷굸굹굺굻굼굽굾굿궀궁궂궃궄궅궆궇궈궉궊궋권궍궎궏궐궑궒궓궔궕궖궗궘궙궚궛궜궝궞궟궠궡궢궣궤궥궦궧궨궩궪궫궬궭궮궯궰궱궲궳궴궵궶궷궸궹궺궻궼궽궾궿귀귁귂귃귄귅귆귇귈귉귊귋귌귍귎귏귐귑귒귓귔귕귖귗귘귙귚귛규귝귞귟균귡귢귣귤귥귦귧귨귩귪귫귬귭귮귯귰귱귲귳귴귵귶귷그극귺귻근귽귾귿글긁긂긃긄긅긆긇금급긊긋긌긍긎긏긐긑긒긓긔긕긖긗긘긙긚긛긜긝긞긟긠긡긢긣긤긥긦긧긨긩긪긫긬긭긮긯기긱긲긳긴긵긶긷길긹긺긻긼긽긾긿김깁깂깃깄깅깆깇깈깉깊깋**
- 가 0xAC00 ~ 깋 0xAE4B ( 588개 ) 에서 다음 초성(ㄱ → ㄲ)만 변한 채로 같은 과정을 반복
- 위와 같은 과정으로 초성 19개 X 중성 21개 X 종성 28개 = 11172개의 한글을 표현

---

# 기능 - 이미지 총 4개

## 한글 조립
![Oct-08-2022_00-52-23](https://user-images.githubusercontent.com/96690194/194689712-0fe04e63-3b77-49a8-bbc4-c9416a770db3.gif)|
![Oct-08-2022_00-51-41](https://user-images.githubusercontent.com/96690194/194689682-925e676e-0e58-49b0-a9bd-2f4fd35dcb64.gif)

## 뒤로가기

![Oct-08-2022_00-53-03](https://user-images.githubusercontent.com/96690194/194689725-804f7ba2-468a-4312-b16b-6a0179ba9dc2.gif)

## 쉬프트

![Oct-08-2022_00-53-46](https://user-images.githubusercontent.com/96690194/194689741-f778343b-7415-46e7-a9f1-7defac7ac59f.gif)

## 첫번째 화면과 연결하여 덧글 작성시에 사용


![Oct-08-2022_13-34-18](https://user-images.githubusercontent.com/96690194/194689784-ed4171f9-a10e-495b-bb41-19b532861e24.gif)

## 자주 쓰는 말

![Oct-08-2022_00-54-22](https://user-images.githubusercontent.com/96690194/194689756-e256ad2c-6d31-4d14-81fc-6c44df4055e3.gif)

키보드 상단의 툴바에서 3번째 버튼을 누르면 자주 쓰는 말 목록이 나타남 

셀을 클릭하면 셀의 내용이 텍스트필드에 입력

## 단축키

![Oct-08-2022_00-54-33](https://user-images.githubusercontent.com/96690194/194689771-9d6633fe-c8d0-48cf-b217-8780b6d4832e.gif)

스페이스 좌측의 단축키를 길게 누르면 단축키를 선택할 수 있는 뷰가 나타남

단축키를 길게 누른 상태로 끌어가도 되고 손가락을 한 번 떼었다가 클릭하여도 된다

단축키키를 짧게 누르면 단축키에 설정된 문자가 텍스트필드에 입력

---

# 팀원별 구현사항

## 엄철찬(James)

### UI

- 명세에서 주어진 키보드 디자인을 바탕으로 키보드의 디자인을 담당.
- 키보드의 자주 쓰는 말 디자인을 담당
- 키보드의 단축키 디자인을 담당

### Keyboard

- 키보드가 나타날 때 앱을 키보드의 높이만큼 위치 변경
- 키보드 한글 조합 및 분해 로직 구현
- 자주 쓰는 말 기능 구현
- 단축키 기능 구현

## 지준영(Bill)

### Architecture

- App 기본구조 관련 사항 설계 및 시연용 프로젝트 구현, 공유
- UI속성 관련 프로토콜 설계 및 시연용 프로젝트 구현, 공유
- ViewController Presentation 관련 사항 설계 및 시연용 프로젝트 구현, 공유
- Model, ViewModel, View간 관계, 정책 설계
- UIView를 UIViewController의 ContentView로 활용, UIViewController 경량화하는 정책 설계
    
    ### Repository
    
    - Model, ViewModel,Repository간 관계, 정책 설계
    - Repository Pattern 정책 설계
    
    ### ViewController Presentation + Dependency Injection
    
    - Routable, SceneBuildable, Scenable, SceneCategory 이용한 ViewController present, push, pop 관련 구조 설계
    - SceneContext 이용한 Model 클래스 의존성 주입 구조, Routable, SceneCategory, SceneContext간 관계, 정책 설계

### UI

- UI속성 관련 프로토콜 설계 및 시연용 프로젝트 구현, 공유
    - Presentable 설계
    - Styleable 설계
    - UIView를 UIViewController의 ContentView로서 응용하는 정책 설계

### 첫번째 화면

- UI구성 + 팀원 구현사항 버그픽스
- MVVM 패턴처리
- 댓글 입력 기능

### 두번째 화면

- 팝업뷰 UI 구성 + 팀원 구현사항 버그픽스
- MVVM 패턴처리

### Keyboard

- 리팩토링(non Design Pattern → MVC)

### Project Merge

- Git 아닌 압축파일, 데모프로젝트 전달받은 경우 —> 개발중인 프로젝트에 코드 반영

### Documentation

- README 기본 레이아웃, 샘플 작성
