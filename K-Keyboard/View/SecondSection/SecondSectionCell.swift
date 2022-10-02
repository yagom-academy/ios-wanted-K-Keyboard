//
//  SecondSectionCell.swift
//  K-Keyboard
//
//  Created by channy on 2022/10/02.
//

class SecondSectionCell: UITableViewCell, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCell.identifier, for: indexPath) as! TagCell
        return cell
    }
    
    static let identifier = "section2"
    
    var items: [String] = ["TEST1", "TEST2", "TEST3"]
    
    let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8.0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = .init(width: 300, height: 300)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = true
        view.contentInset = .zero
        view.backgroundColor = .clear
        view.register(TagCell.self, forCellWithReuseIdentifier: TagCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setConstraints()
        
        self.collectionView.dataSource = self
        
        self.contentView.addSubview(self.collectionView)
        
        NSLayoutConstraint.activate([
            self.collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            self.collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SecondSectionCell {
    func addViews() {
        [].forEach {
//            contentView.addSubview($0)
        }
    }
    func setConstraints() {
        [].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
        ])
    }
}

class TagCell: UICollectionViewCell {
    static let identifier = "tagCell"
    
    let tagLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(tagLabel)
        
        tagLabel.translatesAutoresizingMaskIntoConstraints =  false
        tagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        tagLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        tagLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        tagLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct SecondSectionCellPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let cell = SecondSectionCell(frame: .zero)
            return cell
        }.previewLayout(.fixed(width: 343, height: 544))
    }
}
#endif
