//
//  CommentInputViewModel.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/07.
//

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
        // TODO: 띄어쓰기만 있는 것일때 같은 경우 예외처리
        if input.count == 0 {
            propergateEmptyTextInputReceived()
        } else {
            propergateTextInput(input)
        }
    }
}
