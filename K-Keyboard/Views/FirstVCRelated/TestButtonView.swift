//
//  TestButtonView.swift
//  K-Keyboard
//
//  Created by sokol on 2022/10/01.
//

import UIKit
import SwiftUI

class TestButtonView: UIView, FirstViewStyling {
    
    var viewModel: TestButtonViewModel
    
    var testButton: UIButton = UIButton()
    
    init(viewModel: TestButtonViewModel) {
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

extension TestButtonView: Presentable {
    func initViewHierarchy() {
        self.addSubview(testButton)
        
        testButton.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            testButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            testButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ]
    }
    
    func configureView() {
        testButton.addStyles(style: testButtonStyling)
    }
    
    func bind() {
        
        //TODO: 이렇게 액션을 넣어줘도 되나 싶은데 일단 뷰모델로 신호가 가나 확인만 해보기...
        let action = UIAction(title: "테스트액션") { [weak self] _ in
            guard let self = self else { return }
            self.viewModel.propergateDidTouchButton()
        }
        testButton.addAction(action, for: .touchUpInside)
    }
    
    @objc func buttonAction() {
        viewModel.didReceiveDidTouchButton()
    }
    
    
}

#if canImport(SwiftUI) && DEBUG
struct TestButtonViewPreview<View: UIView>: UIViewRepresentable {
    
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
struct TestButtonViewPreviewProvider: PreviewProvider {
    static var previews: some View {
        TestButtonViewPreview {
            let view = TestButtonView(viewModel: TestButtonViewModel())
            return view
        }.previewLayout(.fixed(width: 100, height: 100))
    }
}

#endif
