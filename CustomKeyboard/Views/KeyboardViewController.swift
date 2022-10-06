//
//  KeyboardViewController.swift
//  CustomKeyboard
//
//  Created by pablo.jee on 2022/10/02.
//

import UIKit

protocol KeyboardViewDelegate : AnyObject {
    func insertCharacter(_ newCharacter: String)
    func deleteCharacterBeforeCursor()
    func characterBeforeCursor() -> Character?
    func insertSpace()
    func insertNextLine()
    func presentShortCutView()
    func dismissShortCutView()
}

class KeyboardViewController: UIInputViewController {
    

    //A UIInputViewController subclass that acts as the primary view controller for custom keyboard extensions. This is where you’ll connect the MorseKeyboardView and implement any custom logic for the keyboard similar to how it’s done in PracticeViewController.
    
    //the main requirement of a custom keyboard is that it provides a key to switch to other keyboards.
    
    
    @IBOutlet var nextKeyboardButton: UIButton!
    
    var model: KeyboardModel = KeyboardModel()
    
    let backView = KeyboardView()
    let toolbar  = ToolBar()
    let frequentView = FrequentView()
    let shortCutView = ShortCutView()
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewHierarchy()
        configureView()
        bind()
        frequentView.isHidden = true
        view.backgroundColor = .darkGray
    }

    
    override func viewWillLayoutSubviews() {
       // self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        // TODO: 얘는 어떻게 쓰는 건지 확인을 해봐야...
        var textColor: UIColor
        if self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
    }

}



// TODO: Presentable
//LoadView를 넣으니 앱이 죽음...익스텐션은 다른가 좀 확인 필요...
extension KeyboardViewController: Presentable {
    func initViewHierarchy() {
        // TODO: inputView에 넣어야 할거 같은데 왜 self.view에 넣었지...
        // inputView가 옵셔널이라서 그냥 바로 view에 넣었습니다
        self.view.addSubviews(toolbar,frequentView,backView)
        NSLayoutConstraint.activate([
            toolbar.topAnchor.constraint(equalTo: self.view.topAnchor),
            toolbar.bottomAnchor.constraint(equalTo: backView.topAnchor),
            toolbar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            toolbar.heightAnchor.constraint(equalToConstant: 25),
            backView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            backView.heightAnchor.constraint(equalToConstant: 200),
            frequentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            frequentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            frequentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            frequentView.heightAnchor.constraint(equalToConstant: 200)
        ])
        backView.firstFloor.setNextKeyboardVisible(needsInputModeSwitchKey)
    }
    
    func configureView() {
    }
    
    func bind() {
        // TODO: handleInputModeList 이 메소드는 뭐지...키보드익스텐션 구현 위해서 기본적으로 어딘가에서 불러야 하는 건가...
        //전체검색 해도 안나오는데...
        //handleInputModeList는 자체적으로 제공되는 메소드로, 지구본 버튼 눌렀을 때 다른 키보드로 전환할 수 있게 해주는 메소드입니다
        backView.firstFloor.btnNext.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        backView.firstFloor.delegate = self.model
        backView.firstFloor.info = self
        backView.secondFloor.delegate = self.model
        backView.thridFloor.delegate = self.model
        backView.forthFloor.delegate = self.model
        toolbar.delegate = self
        shortCutView.delegate = self
        frequentView.tableView.delegate = self
        
        model.insertText = { [weak self] string in
            guard let self = self else { return }
            self.textDocumentProxy.insertText(string)
        }
        
        model.deleteBackward = { [weak self] in
            guard let self = self else { return }
            self.textDocumentProxy.deleteBackward()
        }
        
        model.characterBeforeCursorClosure = { [weak self] in
            guard let self = self else { return nil }
            guard let character = self.textDocumentProxy.documentContextBeforeInput?.last else {
              return nil
            }
            return character
        }
        
        model.presentShortCut = {
            self.view.addSubviews(self.shortCutView)
            NSLayoutConstraint.activate([
                self.shortCutView.topAnchor.constraint(equalTo: self.view.topAnchor),
                self.shortCutView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                self.shortCutView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.shortCutView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            ])
        }
        
        model.dismissShortCut = {
            self.shortCutView.removeFromSuperview()
        }
    }
}




extension KeyboardViewController : ToolBarDelegate {
    func changeView() {
        if frequentView.isHidden {
            self.view.exchangeSubview(at: 1, withSubviewAt: 2)
            backView.isHidden = true
            frequentView.isHidden = false
        }else{
            self.view.exchangeSubview(at: 2, withSubviewAt: 1)
            backView.isHidden = false
            frequentView.isHidden = true
        }
    }
}

extension KeyboardViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CustomCell, let text = cell.lbl.text{
            self.textDocumentProxy.insertText(text)
        }
    }
}

extension KeyboardViewController : ProtocolForBtnGoto {
    var btnArr: [ShortCutButton] {
        [shortCutView.btn1,shortCutView.btn2,shortCutView.btn3,shortCutView.btn4,shortCutView.btn5,shortCutView.btn6,shortCutView.btn7,shortCutView.btn8,shortCutView.btn9,shortCutView.btn10]
    }
    var targetView: UIView {
        shortCutView.stackV
    }
}

extension KeyboardViewController : DelieverTitleProtocol{
    func changeTitle(_ title: String) {
        backView.firstFloor.btnGoto.setTitle(title, for: .normal)
        model.dismissShortCutView()
    }
}
