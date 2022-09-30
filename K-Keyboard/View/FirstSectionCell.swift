//
//  FirstSectionCell.swift
//  K-Keyboard
//
//  Created by channy on 2022/09/30.
//

import UIKit

class FirstSectionCell: UITableViewCell {
    static let identifier = "section1"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View
    
    init(_ builder: @escaping () -> View) {
        view = builder()
    }
    
    // MARK: - UIViewRepresentable
    
    func makeUIView(context: Context) -> some UIView {
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
#endif

#if canImport(SwiftUI) && DEBUG
struct FirstSectionCellPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let cell = FirstSectionCell(frame: .zero)
            return cell
        }.previewLayout(.sizeThatFits)
    }
}
#endif
