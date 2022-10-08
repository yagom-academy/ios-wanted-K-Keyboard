# ios-wanted-K-Keyboard

## 결과 동영상


https://user-images.githubusercontent.com/37897873/194697979-c94ba6a8-56a4-4ea3-b7c5-b990e393a1ea.mp4



## 팀원 소개

|                                                                Tom(박현중)                                                                |                                                                Julia(김지인)                                                         |
| :-----------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------: |
| <img src="https://user-images.githubusercontent.com/37897873/194698065-c2074577-7f06-42f3-a6f5-0d178bb2b07f.jpeg" width="170" height="200"/> | <img src="https://user-images.githubusercontent.com/37897873/194696643-2c42d5b0-4bd8-4780-bf16-e902756afa04.png" width="200" height="200"/> |
|                                                            Custom Keyboard                                                              |                                                          메인 화면 UI 구현                                                           |

</br>

## 📁 폴더 구조
 <img width="258" alt="스크린샷 2022-10-08 오후 5 05 32" src="https://user-images.githubusercontent.com/37897873/194697232-74db806d-c528-4a4f-a92d-1c5e8356a882.png">

## 기능 설명 
### Keyboard 
- 한글 조합 구현
- ⌫  구현 ( 한 음소 제거 )

### Main Screen
- MainViewController 
  - 키보드 올라가고 내려가는 부분에 따라 ScollView 위치 이동
  - 스크롤 올릴 시 자동으로 키보드 내림
- TagCollectionView 
  - 글자 수에 따른 Dynamic Cell 
  - UICollectionViewCompositionalLayout을 이용한 셀 왼쪽정렬
- Keywoard, Theme CollectionView 
  - 기본 CollectionView로 디자인 구현
  - ThemeCell 탭시 카운트 증가 및 색상 변경
- ReviewCollectionView 
  - enum으로 UserType(크리에이터/유저)에 따른 셀 구성 
  - 값 입력시 애니메이션 처리되어 셀 추가
- BottomView 
  - 기본 구매하기 버튼 화면 / textField가 포함된 화면으로 나누어 상황에 따라 보임
  - textField 값 입력시 Review 추가
- PopUpViewController
  - 커스텀 팝업뷰 구현

## 회고 및 느낀점
### Tom
- 스스로 구현한 코드를 해결해 보기 위해 포기하지 않고 끝까지 매달려 볼 수 있는 에너지가 있다는 것을 느끼게 되었다.
- 키보드 구현에 있어 내가 생각한 방법만을 가지고 진행했다. 그렇기에 시간을 많이 투자하게 되었고 다른 방법으로 변경을 하기가 어려웠다. 다른 방법에 있어 고민해 보고 시야를 조금 더 크게 못 봐서 아쉽다.
- 팀 프로젝트 진행하면서 팀원과 소통이 잘되었고 혼자 하는 개발보다는 누구와 함께하는 개발이 정말 나의 성장에 동기부여를 느끼게 만들어 준다. 
- 키보드 구현에 있어 정보 수집을 많이 못하고 시작한점이 아쉽다.

### Julia
- 한 화면에 컬렉션 뷰를 여러개 구성하며 어떻게 하면 중복된 코드를 줄일 지 고민하고 공통된 코드는 Extenstion으로 빼서 처리하였다.
- MainVC에 포함된 여러 Cell, BottomView나 PopUpVC에 연결된 동작(ex) 팝업 뷰의 버튼을 누르면 다시 main으로)의 의존성을 줄이기 위해 Delegate 패턴을 적극적으로 사용하였다.
- 여러 종류의 컬렉션뷰를 사용해보고 코드를 깔끔하게 쓰는 연습을 하게 될 수 있었다.
- 화면 구현을 빨리 끝내고 팀원의 키보드를 돕고 싶엇는데 생각보다 구현할 부분이 많고 시간도 촉박해서 같이 하지 못한 부분이 조금 아쉬운 부분이다.
