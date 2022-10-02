//
//  KeyboardButton.swift
//  CustomKeyboard
//
//  Created by pablo.jee on 2022/10/02.
//

import UIKit

class KeyboardButton: UIButton {
    
  var defaultBackgroundColor: UIColor = .gray
  var highlightBackgroundColor: UIColor = .lightGray
  var originalTitle : String?
  var shiftedTitle : String?



  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    backgroundColor = isHighlighted ? highlightBackgroundColor : defaultBackgroundColor
  }
}

// MARK: - Private Methods
private extension KeyboardButton {
  func commonInit() {
    layer.cornerRadius = 5.0
    layer.masksToBounds = false
    layer.shadowOffset = CGSize(width: 0, height: 1.0)
    layer.shadowRadius = 0.0
    layer.shadowOpacity = 0.35
  }
}
