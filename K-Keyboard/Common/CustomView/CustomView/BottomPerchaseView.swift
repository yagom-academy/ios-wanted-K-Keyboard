//
//  BottomPerchaseView.swift
//  K-Keyboard
//
//  Created by 신병기 on 2022/09/30.
//

import UIKit

class BottomPerchaseView: UIView {
    static var identifier: String { String(describing: self) }

    @IBOutlet weak var purchaseButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadNib()
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        loadNib()
        initialize()
    }
    
    func loadNib() {
        subviews.forEach({ $0.removeFromSuperview() })
        guard Bundle(for: self.classForCoder).path(forResource: BottomPerchaseView.identifier, ofType: "nib") != nil else { return }
        guard let view = Bundle(for: self.classForCoder).loadNibNamed(BottomPerchaseView.identifier, owner: self, options: nil)?.first(where: { $0 is UIView }) as? UIView else { return }

        view.frame = bounds
        addSubview(view)
    }
    
    func initialize() {
        purchaseButton.addTarget(self, action: #selector(didTapPurchaseButton), for: .touchUpInside)
    }
    
    @objc func didTapPurchaseButton() {
        //TODO: showing popup
        print(#function, "tap purchase button")
    }
}
