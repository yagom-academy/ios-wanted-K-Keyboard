//
//  BottomView.swift
//  K-Keyboard
//
//  Created by 김지인 on 2022/10/04.
//

import UIKit

protocol BottomViewDelegate: AnyObject {
    func buyJamButtonDidTap()
    func senderReviewText(_ review: String)
    func editingBeginScrollToButton()
}

class BottomView: UIView {
    
    @IBOutlet weak var jamStateStackView: UIStackView!
    @IBOutlet weak var buyJamButton: UIButton!
    @IBOutlet weak var reviewTextField: UITextField!
    @IBOutlet weak var reviewInputButton: UIButton!
    
    weak var delegate: BottomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        reviewTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
        reviewTextField.delegate = self
    }
    
    private func loadView() {
        guard let xibName = NSStringFromClass(self.classForCoder).components(separatedBy: ".").last,
              let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
    
    private func loadViewFromNib(nib: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nib, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    @IBAction func buyJamButtonDidTap(_ sender: UIButton) {
        delegate?.buyJamButtonDidTap()
    }
    
    @IBAction func reviewInputDidTap(_ sender: UIButton) {
        guard let text = self.reviewTextField.text else { return }
        self.reviewTextField.text = ""
        delegate?.senderReviewText(text)
    }
}

extension BottomView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.editingBeginScrollToButton()
    }
}
