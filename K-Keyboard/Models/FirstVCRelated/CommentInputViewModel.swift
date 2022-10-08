//
//  CommentInputViewModel.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/07.
//
/*
 - 상품 구매 후, 덧글을 작성하는 바에 `텍스트를 작성하는 입력란`과 `텍스트를 저장하는 작성 버튼`을 구현합니다
 - 텍스트 작성 후 작성 버튼을 누르면 구매 리뷰에 해당 내용이 추가됩니다
     - 사진은 placeholder를 사용합니다
     - 덧글을 작성할 때마다 구매 리뷰 갯수가 그만큼 증가합니다
     - 빈 텍스트는 작성되지 않습니다
 */
import Foundation

class CommentInputViewModel {
    
    //input
    var didReceiveTextInput: (String) -> () = { string in }
    
    //output
    var propergateTextInput: (String) -> () = { string in }
    
    var propergateEmptyTextInputReceived = { }
    
    //properties
    
    init() {
        bind()
        
    }
    
    private func bind() {
        didReceiveTextInput = { [weak self] string in
            guard let self = self else { return }
            self.isValidTextInput(input: string)
        }
    }
    
    
    private func isValidTextInput(input: String) {
        
        let text = input.trimmingCharacters(in: CharacterSet.whitespaces)
            
        if text.count == 0 {
            propergateEmptyTextInputReceived()
        } else {
            propergateTextInput(input)
        }
    }
}
