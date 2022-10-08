# ios-wanted-K-Keyboard
## 팀원  소개  
|Channy(김승찬)|Beeem(김수빈)|
|:---:|:---:|
|<img src="https://user-images.githubusercontent.com/31722496/194575712-36002fac-9426-40cb-8adf-c5898be1114d.png" width="200" height="200"/>|<img src="https://user-images.githubusercontent.com/31722496/192567901-5f1ede08-e89e-4adf-b987-2af47ec2d1a3.png" width="200" height="200"/>|
|[Github](https://github.com/seungchann)|[Github](https://github.com/skyqnaqna)|  

## 개발 기간  
2022.09.29 ~ 10.18

## 구조 및 기능  
## 첫 번째 페이지  
<img width="200" alt="11" src="https://user-images.githubusercontent.com/63276842/194692911-e6a22676-189d-4e84-b758-81b153b55d1f.png"> <img width="200" alt="21" src="https://user-images.githubusercontent.com/63276842/194692906-1237707e-40e6-4f11-810f-ca04f57c379b.png"> <img width="200" alt="31" src="https://user-images.githubusercontent.com/63276842/194692895-c9261baf-8551-4888-b4ce-1ae9a4cc8de9.png"> <img width="200" alt="41" src="https://user-images.githubusercontent.com/63276842/194692889-9aa400a9-8dde-44b2-87b2-039bc2651c91.png">  

### 구조 및 상세 설명  
<img width="700" alt="fs" src="https://user-images.githubusercontent.com/63276842/194693418-8987cb1f-c498-457a-9129-036550d72ff4.png">  

### Section 1  
* 메인 기능  
  * 1번째 Section Cell 생성  
	* UIKit을 사용하여 주어진 화면 표현  
* 고민한 부분  
	* 코드로 UI를 만들 때, SwiftUI를 이용해서 cell을 확인해가면서 그릴 수 있지 않을까?  
	* [애플 공식 문서](https://developer.apple.com/documentation/swiftui/previews-in-xcode), [참고 문서](https://www.hohyeonmoon.com/blog/swiftui-tutorial-preview/)를 참고하여 preview 를 사용  
	```swift
	#if canImport(SwiftUI) && DEBUG
	struct FirstSectionCellPreview: PreviewProvider {
			static var previews: some View {
					UIViewPreview {
							let cell = FirstSectionCell(frame: .zero)
							return cell
					}.previewLayout(.fixed(width: 343, height: 544))
			}
	}
	#endif
	```
	* 문자열에서 일부만 뽑아서 색상을 변경할 수 있을까?  
	* `NSString` 의 `range` 를 활용하여 해결할 수 있다.  
	```swift
	let participantsLabel: UILabel = {
				let label = UILabel()
				...
				var userNum: Int = 78
				let highlightedColor: UIColor = UIColor(red: 0.792, green: 0.278, blue: 0.426, alpha: 1)
				let attributedString = NSMutableAttributedString(string: "\(userNum)명이참여했어요!", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
				attributedString.addAttribute(.foregroundColor, value: highlightedColor, range: (attributedString.string as NSString).range(of: "\(userNum)"))
				label.attributedText = attributedString
				return label
		}()
	```
### Section 2 - 태그 시스템  
* 메인 기능  
  * 2번째 Section cell 생성  
	* Cell 내부에 태그들을 표시하는 `TagCollectionView` 를 사용하여 구현  
	* 태그의 길이에 맞춰 label 의 width 가 동적으로 늘어남  
	* 가장 우측의 태그 길이가 frame 을 넘어갈 경우, 다음 줄에 표시됨  
* 고민한 부분  
  * 해결한 부분  
	  * label 내부의 text 길이에 따라 동적으로 width 를 변화시킬 수 있는 방법이 있을까?  
		* `sizeForItemAt -> CGSize` 에서 dummy label 의 사이즈를 활용하여 크기를 정해준다.  
		* 이 때 dummy label 에 사용된 폰트나 사이즈가 실제 label 과 똑같아야 한다.  
		```swift
		func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
					let label: UILabel = {
							let label = UILabel()
							label.font = UIFont(name: "NotoSansKR-Medium", size: 14)
							label.text = self.items[indexPath.row]
							label.sizeToFit()
							return label
					}()

					let size = label.frame.size
					let widthMargin: CGFloat = 10.3
					let heightMargin: CGFloat = 4.0

					return CGSize(width: size.width + (2 * widthMargin), height: size.height + (2 * heightMargin))
			}
		```
	* 해결해야 할 부분  
		* 현재는 상위 `TableView` 의 cell 의 높이를 고정해주는 방식으로 `tagCollectionView` 의 `height` 값을 고정하여 모든 태그를 표시했다.
		* 태그 갯수와 상관없이 동적으로 모든 tag 를 표시할 수 있을까?  
		* 현재는 `SecondSectionCell` 의 `items` 를 사용해서 tag 를 만드는데, 확장가능한 구조로 변경할 수 있지 않을까?  
	
### Section 3 - CardView  
* 메인 기능  
	* 3번째 Section cell 생성  
	* Cell 내부에 카드들을 표시하는 `CardCollectionView` 를 사용하여 구현  
* 고민한 부분  
	* 해결한 부분  
		* CardView 에서 카드 테두리의 그림자를 어떻게 표현할까?  
		```swift
		func setShadows() {
					self.layer.backgroundColor = UIColor.white.cgColor
					self.layer.shadowColor = UIColor.gray.cgColor
					self.layer.masksToBounds = false
					self.layer.cornerRadius = 20
					self.layer.shadowOffset = CGSize(width: 0, height: 0)
					self.layer.shadowRadius = 3.5
					self.layer.shadowOpacity = 0.3
			}
		```
		* 그림자는 현재 view의 테두리에 겹쳐있는 상태이기 때문에, `shadowOffset`을 통해 이동시켜 그림자의 방향을 정할 수 있다.  
	* 해결해야 할 부분  
		* `MVC` 패턴에서 `View` 는 모두 분리하여 명시해줘야 할까?  
		* 예를 들어, ThirdSectionCell 에서 CardCollectionView 를 생성한다면, `CardCollectionView.swift` 파일을 만들어 관리해야 할까?

***
<img width="700" alt="ss" src="https://user-images.githubusercontent.com/63276842/194693416-3065ecc4-7ad6-47b3-9b66-a28996a8f9f6.png">  

### Section 4  
* 메인 기능  
	- 4번째 Section Cell 생성
	- UIStackView를 사용하여 이모티콘과 관련 UILabel을 표현
* 고민한 부분
	- 이모티콘 Label과 하단 Label을 하나의 수직 스택 뷰에 담을 때, 어떻게 spacing을 다르게 할 수 있을까?
	- `setCustomSpacing(_:, after: )` 메서드로 원하는 지점에 spacing을 다르게 설정할 수 있다.  
	```swift
	stackView.spacing = 0
	stackView.setCustomSpacing(8, after: emoji)
	```
### Section 5 - Comment View  
* 메인 기능
	- 5번째 Section Cell 생성
	- 구매 리뷰 개수와 안내 문구는 `UITableHeaderFooterView`로 구현
	- 프로필과 리뷰는 하나의 `UITableCell`
	- 리뷰의 작성자명과 내용은 `CommentView`라는 `UIView` 객체로 구성
* 고민한 부분
	- 해결한 부분
		- `CommentView`가 셀 밖으로 벗어나거나 배경 크기가 0이 되는 현상
		- widthAnchor를 설정하여 셀 밖으로 벗어나지 않도록 해결
	```swift
	commentView.widthAnchor.constraint(lessThanOrEqualToConstant: contentView.frame.width - 108)
	```	
	* 해결해야하는 부분
		- Label과 Button에 설정한 TitleLabel의 위치를 동일하게 맞추기
			- Button 내에서 Label의 위치를 조정할 방법 찾기

### Section5 & FirstFooterView  
* 메인 기능
	- 구매하기 버튼 클릭 시 `PopupViewController`로 이동하여 팝업창 표시
	- 텍스트 작성 후 등록 버튼 누르면 구매 리뷰에 내용 추가 및 리뷰 수 증가
* 고민한 부분
	- 해결한 부분

    |해결 전|해결 후|
	|:---:|:---:|
    |<img src=https://user-images.githubusercontent.com/31722496/194598565-3d6a349f-2cf6-4c6e-821d-bac1930b5ca6.png width=300px>|<img src=https://user-images.githubusercontent.com/31722496/194598579-41cb3334-b9b0-4229-abcc-e534b99ede19.png width=300px>|

	- 텍스트 작성할 때 키보드가 화면 아래 영역을 가리는 현상
	```swift
	@objc func keyboardWillShow(notification: NSNotification) {
		guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }

		self.view.frame.origin.y = 0 - keyboardSize.height
	}

	@objc func keyboardWillHide(notification: NSNotification) {
		self.view.frame.origin.y = 0
	}
	```
	- 키보드가 올라오면 키보드 높이만큼 뷰를 올려준다. [(출처)](https://fluffy.es/move-view-when-keyboard-is-shown/)
	- 해결해야하는 부분
		- 리뷰 작성하면 뷰를 더 올려서 방금 작성한 리뷰가 보이게 하기

### PopupViewController  

<img width="350" alt="41" src="https://user-images.githubusercontent.com/63276842/194692889-9aa400a9-8dde-44b2-87b2-039bc2651c91.png">  

- 메인 기능
	- 팝업창 표시
	- Delegate 패턴을 적용하여 버튼 누르면 `PopupViewController`를 닫고 텍스트 입력란 활성화
- 고민한 부분
	- 해결한 부분
		- 팝업뷰에서 첫 번째 화면으로 돌아가서 `FirstFooterView`를 텍스트 입력란으로 어떻게 바꿀까?
		- Delegate 패턴을 사용하여 `PopupView`에서는 버튼이 눌리면 해야할 일을 `PopupViewController`에게 시키고, `PopupViewController`는 `FirstViewController`에게 시키도록 하여 해결했다.
<img width=100% src="https://user-images.githubusercontent.com/31722496/194618394-09cfa613-ecb7-4bbb-b1e0-e2f0180e6296.png">

```swift
	extension PopupViewController: PopupViewDelegate {
		func buyAndUseButtonPressed() {
			self.delegate?.activateTextField()
			self.dismiss(animated: true)
		}
	}
```
- 텍스트 입력란은 hidden 상태에서 !hidden 상태로 바뀌면서 보이게 된다.
```swift
	func updateConstraints() {
		[gemImage, gemCount, gemPrice, buyButton].forEach { $0.isHidden = true }
		[inputBar, saveButton].forEach { $0.isHidden = false }
		...
	}
```
- 해결해야하는 부분
	- Delegate 패턴 외에 다른 방법은 없는가?
	- 텍스트 입력란을 hidden 방식말고 기존 컴포넌트를 지우면서 생성하는 방식 고려해보기

***

## 두 번째 페이지  
<img width="350" alt="12" src="https://user-images.githubusercontent.com/63276842/194694348-b67c8fba-66fb-40d1-9af6-9866b1fd821b.png"> <img width="350" alt="22" src="https://user-images.githubusercontent.com/63276842/194694342-c7f1be33-983c-4f4f-b6f6-ffa8bab278a8.png">  

## 구조 및 상세 설명  
* Keyboard  
* Shift Button 기능 구현  
* Next Button 기능 구현  

### Keyboard
- 한글 조합 로직과 다이어그램
	- 고민한 부분
		- 조합을 어떤 방식으로 할 것인지가 가장 큰 고민이었다.
		- 처음엔 한글의 모든 자음과 모음의 조합으로 생각해서 너무 복잡했다.
		- 그래서 초성, 중성, 종성과의 조합으로 생각해봤고, 아래와 같은 로직을 떠올렸다.

<img width=100% src="https://user-images.githubusercontent.com/31722496/194618368-c26ceea1-d20d-42b3-96c0-bf144ae6e7f7.png">
<img width=100% src="https://user-images.githubusercontent.com/31722496/194618380-c46ea22b-2436-4a36-acb6-36332f549fe7.png">
<img width=100% src="https://user-images.githubusercontent.com/31722496/194618387-2b13fc92-0f44-4a9f-9af9-8983097fdfa9.png">
<img width=100% src="https://user-images.githubusercontent.com/31722496/194618392-22307081-1d45-4ca4-84d8-9601dc639edd.png">

- `KoreanData`에서 유니코드 조합을 위해 각 초성, 중성, 종성에 대한 유니코드 값을 딕셔너리에 저장한다.
- stack에 들어있는 문자와 state 정보를 받아 `letter` 함수에서 한글 유니코드를 조합한 결과를 반환한다.
	```swift
		private static let unicodeBase = 44032
		private static let initialNum = 588
		private static let medialNum = 28

		static func letter(_ stack: [String], _ state: Int) -> String {
			var unicodeValue = unicodeBase

			switch stack.count {
			case 2:
				unicodeValue += initialConsonant[stack[0]]! * initialNum + medialVowel[stack[1]]! * medialNum
			case 3:
				if state == 0b11010 {
					unicodeValue += initialConsonant[stack[0]]! * initialNum + medialVowel[stack[1]]! * medialNum + finalConsonant[stack[2]]!
				} else {
					unicodeValue += initialConsonant[stack[0]]! * initialNum + medialVowel[stack[1] + stack[2]]! * medialNum
				}
			case 4:
				if state == 0b11011 {
					unicodeValue += initialConsonant[stack[0]]! * initialNum + medialVowel[stack[1]]! * medialNum + finalConsonant[stack[2] + stack[3]]!
				} else {
					unicodeValue += initialConsonant[stack[0]]! * initialNum + medialVowel[stack[1] + stack[2]]! * medialNum + finalConsonant[stack[3]]!
				}
			case 5:
				unicodeValue += initialConsonant[stack[0]]! * initialNum + medialVowel[stack[1] + stack[2]]! * medialNum + finalConsonant[stack[3] + stack[4]]!
			default:
				return stack.isEmpty ? "" : stack[0]
			}

			return String(UnicodeScalar(unicodeValue)!)
		}
	```
	- `KorKeyboardView`에서는 stack에 현재 조합할 글자를 담고 state 변수는 글자의 상태를 나타낸다.
	- `KorKeyboardView`에 있는 letter 변수는 `KoreaData`의 `letter`함수에 stack과 state를 전달하여 조합된 글자를 받아오는 변수다.
	```swift
		var letter: String { return KoreanData.letter(stack, state) }
	```
	- 키보드 자판을 입력하면 자음인지 모음인지에 따라 조합이 가능한지 확인하여 상태를 전이시키고 텍스트 입력 객체에 이전 상태(글자)를 지우고 현재 상태(글자)를 반영한다.
	```swift
	extension KorKeyboardView {
    @objc func korButtonPressed(_ sender: UIButton) {
        print(sender.currentTitle!)
        let char = sender.currentTitle!

        if KoreanData.vowel.contains(char) {
            switch state {
            case 0:
                delegate?.insertCharacter(char)
            case 0b10000:
                stack.append(char)
                state |= (1 << 3)
                delegate?.deleteCharacterBeforeCursor()
                delegate?.insertCharacter(letter)
            case 0b11000:
                if KoreanData.medialVowel[stack.last! + char] != nil {
                    stack.append(char)
                    state |= (1 << 2)
                    delegate?.deleteCharacterBeforeCursor()
                    delegate?.insertCharacter(letter)
                } else {
                    stack.removeAll()
                    state = 0
                    delegate?.insertCharacter(char)
                }
				...
	```
	- 글자를 지우는 로직은 stack의 가장 마지막 요소를 지우고 state를 바꿔준 후 텍스트 입력 객체에 반영한다.
	```swift
	    @objc func deletePressed() {
			if stack.isEmpty {
				delegate?.deleteCharacterBeforeCursor()
			} else {
				stack.removeLast()

				for i in 0 ..< 5 {
					if (state & (1 << i)) != 0 {
						state ^= (1 << i)
						break
					}
				}

				delegate?.deleteCharacterBeforeCursor()
				delegate?.insertCharacter(letter)
			}
			
			if self.isShiftPressed == true {
				shiftPressed()
			}
		}
	```
	- 스페이스 바는 stack을 비우거나 텍스트 입력 객체에 공백을 삽입한다.
***

### Shift 버튼 기능 구현  
* `Shift` 입력 시 `ㅂㅈㄷㄱㅅ ㅔㅔ` 를 `ㅃㅉㄸㄲㅆ ㅒㅖ` 로 변경  
* `ㅂㅈㄷㄱㅅㅛㅕㅑㅐㅔ` 를 담고 있는 `horizontal1` stackView 생성  
* `ㅃㅉㄸㄲㅆㅛㅕㅑㅒㅖ` 를 담고 있는 `horizontal1Shift` stackVie 생성  
* `Shift` 버튼 입력에 따라 어떤 `stackView` 를 표시할 지 결정하는 `shiftPressed()` 구현  
```swift
@objc func shiftPressed() {
        if self.isShiftPressed {
            print("change to X")
            self.isShiftPressed = false
            self.horizontal1.isHidden = false
            self.horizontal1Shift.isHidden = true
            self.shiftButton.setBackgroundImage(UIImage(systemName: "shift"), for: .normal)
        } else {
            print("Shift pressed")
            self.isShiftPressed = true
            self.horizontal1.isHidden = true
            self.horizontal1Shift.isHidden = false
            self.shiftButton.setBackgroundImage(UIImage(systemName: "shift.fill"), for: .normal)
        }
    }
```
* `horizontal3` 내부에서 생성된 `shift` 버튼의 색상을 바꿔주기 위해, 리팩토리 진행 (https://github.com/skyqnaqna/ios-wanted-K-Keyboard/pull/10)  

### Next 버튼 (키보드 스위칭) 기능 구현  
* 키보드 스위칭을 위한 `action` 을 `KorKeyboardView` 의 `nextButton` 에 연결  
```swift
self.keyboardView.nextButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
```
* 키보드 스위칭 버튼이 필요한 기기들은 `self.needsInputModeSwitchKey` 프로퍼티를 사용하여 분기 처리  
* 스위칭 버튼이 내장된 기기의 경우, `viewDidLoad` 에서 `KorKeyboardView` 의 `shortcutButton` 가 `keyboardView.leadingAnchor` 에 붙을 수 있도록 구현  

***
## 세 번째 페이지  
<img width="350" alt="13" src="https://user-images.githubusercontent.com/63276842/194694423-ed71f1bf-0955-4ba1-b8fd-95642eabc149.png"> <img width="350" alt="14" src="https://user-images.githubusercontent.com/63276842/194694418-b18ee856-ebee-48fd-9613-68de02b8f6c8.png">

## 구조 및 상세 설명  
* `키보드 자주 쓰는 말` 기능 구현  
* `키보드 단축키` 기능 구현  

#### 키보드 자주 쓰는 말  
* 메인 기능  
  * 상단 `ToolbarView` 버튼 중, 세번째 버튼을 클릭하면 `자주 쓰는 말` 을 위한 선택창이 나타난다.  
  * 첫번째 버튼을 클릭하면 다시 키보드로 돌아간다.  
* 고민한 부분  
	* `KeyboardView` 와 `FavoritesView` (자주 쓰는 말) 을 버튼 입력에 따라 표시해줘야 했다.  
	* 버튼 `action` 은 `ToolbarView`에 결정되지만, 두 개의 `View` 를 관리하는 `KeyboardViewController` 에서 실제 변화가 일어난다.  
	* `Delegate` 패턴을 사용해서, `KeyboardViewController` 에서 업데이트 할 수 있도록 구조를 설계했다.  
	```swift
	// KorKeyboardToolbarView.swift
	protocol KorKeyboardToolbarViewDelegate: class {
    	func keyboardButtonPressed()
    	func favoritesButtonPressed()
	}
	
	class KorKeyboardToolbarView: UIView {
		weak var delegate: KorKeyboardToolbarViewDelegate?
		
		...
		delegate?.keyboardButtonPressed()
		delegate?.favoriteButtonPressed()
		
	}
	
	// KeyboardViewController
	extension KeyboardViewController: KorKeyboardToolbarViewDelegate {
		@objc func keyboardButtonPressed() {
				keyboardView.isHidden = false
				favoritesView.isHidden = true
		}

		@objc func favoritesButtonPressed() {
				keyboardView.isHidden = true
				favoritesView.isHidden = false
		}
	}
	```

#### 키보드 단축키
- 메인 기능
	- `ShortcutData`에 6개의 단축키를 저장했으며, 짧게 누르면 현재 단축키를 입력하고 길게 누르면 단축키 선택창이 나타난다.
- 고민한 부분
	- 해결된 부분
		- 키보드의 `shortcutButton`을 선택한 단축키로 업데이트 하는 부분에서 문제가 많았다.
		- `KeyboardViewController`가 아닌 `KorKeyboardView`에서 업데이트를 하려고 해서 계속 문제가 발생했고, MVC구조를 다시 생각해서 `KeyboardViewController`에서 업데이트 할 수 있도록 Delegate 패턴을 사용해서 해결했다.
<img width=100% src="https://user-images.githubusercontent.com/31722496/194618397-ab449200-87cd-47ba-acf8-7605305d8058.png">

- 해결해야하는 부분
	- 현재 `shortcutButton`을 길게 누르면 단축키 선택 화면이 나타나고, 단축키 중 하나를 선택해야지만 화면이 사라진다.
	- 이 방식을 개선하여 길게 누르는 동안에만 화면에 나타나게 하거나, 다른 영역을 눌렀을 때 사라지도록 개선해야 한다.

## 앱에서 기여한 부분

### Channy
- 첫 번째 페이지
	- 1, 2, 3 Section
- 두 번째 페이지  
  - 키보드 전환 버튼 구현   
  - Shift 기능
- 세 번째 화면
	- 자주 쓰는 말 기능

### Beeem
- 첫 번째 페이지 
	- 4, 5 Section, PopupView
- 두 번째 페이지
	- 한글 조합
- 세 번째 화면
	- 단축키 기능
