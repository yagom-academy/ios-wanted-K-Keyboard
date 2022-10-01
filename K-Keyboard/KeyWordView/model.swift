//
//  model.swift
//  K-Keyboard
//
//  Created by so on 2022/10/01.
//

import Foundation
import UIKit

struct Model {
    let title: String
    let image: UIImage?
    
    init(title: String, image: UIImage?) {
        self.title = title
        self.image = image
    }
}
