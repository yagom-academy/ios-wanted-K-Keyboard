//
//  CommentInputView.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/05.
//

import UIKit
import SwiftUI
// 12 12 40 == 64

/*
 - 상품 구매 후, 덧글을 작성하는 바에 `텍스트를 작성하는 입력란`과 `텍스트를 저장하는 작성 버튼`을 구현합니다
 - 텍스트 작성 후 작성 버튼을 누르면 구매 리뷰에 해당 내용이 추가됩니다
     - 사진은 placeholder를 사용합니다
     - 덧글을 작성할 때마다 구매 리뷰 갯수가 그만큼 증가합니다
     - 빈 텍스트는 작성되지 않습니다
 */

class CommentInputView: UIView, FirstViewStyling {

    var commentTextField = UITextField()
    var sendCommentButton = UIButton()
    
    var viewModel: CommentInputViewModel
    
    init(viewModel: CommentInputViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: .zero)
        initViewHierarchy()
        configureView()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CommentInputView: Presentable {
    func initViewHierarchy() {
        self.backgroundColor = .white
        self.addSubview(commentTextField)
        self.addSubview(sendCommentButton)
        
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            commentTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            commentTextField.trailingAnchor.constraint(equalTo: sendCommentButton.leadingAnchor, constant: -16),
            commentTextField.centerYAnchor.constraint(equalTo: sendCommentButton.centerYAnchor)
            
        ]
        
        constraint += [
            sendCommentButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            sendCommentButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            sendCommentButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            sendCommentButton.heightAnchor.constraint(equalToConstant: 40),
            sendCommentButton.widthAnchor.constraint(equalToConstant: 64)
        ]
    }
    
    func configureView() {
        sendCommentButton.addStyles(style: sendCommentButtonStyle)
        commentTextField.addStyles(style: commentTextFieldStyle)
    }
    
    func bind() {
        commentTextField.delegate = self
        
        let action = UIAction(title: "전송버튼") { [weak self] action in
            guard let self = self else { return }
            guard let textInput = self.commentTextField.text else { return }
            self.viewModel.didReceiveTextInput(textInput)
        }
        
        sendCommentButton.addAction(action, for: .touchUpInside)
    }
}

extension CommentInputView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textInput = textField.text else { return true }
        viewModel.didReceiveTextInput(textInput)
        textField.resignFirstResponder()
        return true
    }
}




#if canImport(SwiftUI) && DEBUG
struct CommentInputViewPreview<View: UIView>: UIViewRepresentable {
    
    let view: View
    
    init(_ builder: @escaping () -> View) {
        view = builder()
    }
    
    func makeUIView(context: Context) -> some UIView {
        view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}
#endif

#if canImport(SwiftUI) && DEBUG
struct CommentInputViewPreviewProvider: PreviewProvider {
    static var previews: some View {
        CommentInputViewPreview {
            let view = CommentInputView(viewModel: CommentInputViewModel())
            return view
        }.previewLayout(.fixed(width: 375, height: 64))
    }
}

#endif

