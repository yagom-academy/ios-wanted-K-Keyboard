//
//  ThridViewController.swift
//  K-Keyboard
//
//  Created by so on 2022/09/30.
//

import UIKit

class ThridViewController: UIViewController {
    let key = keyboardImageView()
    let redView = UIView()
    let buleView = UIView()
    
    
    var heights: [Int] = [60, 200, 150, 30, 80, 170, 200]
    var colors: [UIColor] = [.systemRed, .systemIndigo, .systemBlue, .systemTeal, .systemYellow, .cyan, .brown]
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(redView)
//        view.addSubview(buleView)
        view.addSubview(keyboardImageView())
        var constant: [NSLayoutConstraint] = []
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = .red
        
        NSLayoutConstraint.activate(constant)
        constant += [
            redView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 100),
            redView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 100),
            redView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant:0),
            redView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: 0)]
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate(constant)
        
        constant += [
            collectionView.topAnchor.constraint(equalTo: self.redView.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: self.redView.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: self.redView.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: self.redView.bottomAnchor, constant: 0)]
        
        setupView()
        self.view.backgroundColor = .white
        title = "목록"
    }
    private func setupView() {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ThridViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {return CollectionViewCell()}
        
        cell.title.text = "\(heights[indexPath.row])"
        cell.backgroundColor = colors[indexPath.row]
        
        cell.second.text = "2"
        return cell
    }
    
    
    
}
extension ThridViewController: UICollectionViewDelegate {
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

