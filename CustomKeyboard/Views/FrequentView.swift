//
//  FrequentView.swift
//  CustomKeyboard
//
//  Created by 엄철찬 on 2022/10/05.
//

import UIKit

class FrequentView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(tableView,footer)
        footer.addSubviews(keyboardImgView,lbl1,lbl2,lbl3,lbl4)
        setConstraints()
        configuration()
        setHeader()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: footer.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            footer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            footer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            footer.heightAnchor.constraint(equalToConstant: 30),
            keyboardImgView.centerYAnchor.constraint(equalTo: footer.centerYAnchor),
            keyboardImgView.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: 10),
            lbl1.centerYAnchor.constraint(equalTo: footer.centerYAnchor),
            lbl1.leadingAnchor.constraint(equalTo: keyboardImgView.trailingAnchor, constant: 20),
            lbl2.centerYAnchor.constraint(equalTo: footer.centerYAnchor),
            lbl2.leadingAnchor.constraint(equalTo: lbl1.trailingAnchor, constant: 10),
            lbl3.centerYAnchor.constraint(equalTo: footer.centerYAnchor),
            lbl3.leadingAnchor.constraint(equalTo: lbl2.trailingAnchor, constant: 10),
            lbl4.centerYAnchor.constraint(equalTo: footer.centerYAnchor),
            lbl4.trailingAnchor.constraint(equalTo: footer.trailingAnchor, constant: -10),
        ])
    }
    
    func configuration(){
        tableView.backgroundColor = .clear
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.cellId)
        tableView.dataSource = self
        tableView.rowHeight = 40
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        tableView.separatorColor = .lightGray
    }

    func setHeader(){
        let header = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 30))
        let headerLabel = UILabel(frame: header.frame)
        headerLabel.text = "자주 쓰는 말"
        headerLabel.textColor = .cyan
        headerLabel.font = .boldSystemFont(ofSize: 15)
        header.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: header.topAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: header.bottomAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: header.leadingAnchor,constant: 10),
            headerLabel.trailingAnchor.constraint(equalTo: header.trailingAnchor)
        ])
        tableView.tableHeaderView = header
    }
        
    let tableView = UITableView()
    
    let footer = UIView()
    
    let keyboardImgView : UIImageView = {
        let imgView = UIImageView()
        let img = UIImage(systemName: "keyboard")
        imgView.image = img
        imgView.tintColor = .cyan
        return imgView
    }()
    let lbl1 : UILabel = {
        let lbl = UILabel()
        lbl.text = "날짜"
        lbl.font = .boldSystemFont(ofSize: 15)
        return lbl
    }()
    let lbl2 : UILabel = {
        let lbl = UILabel()
        lbl.text = "시간"
        lbl.font = .boldSystemFont(ofSize: 15)
        return lbl
    }()
    let lbl3 : UILabel = {
        let lbl = UILabel()
        lbl.text = "날짜/시간"
        lbl.font = .boldSystemFont(ofSize: 15)
        return lbl
    }()
    let lbl4 : UILabel = {
        let lbl = UILabel()
        lbl.text = "편집"
        lbl.font = .boldSystemFont(ofSize: 15)
        lbl.textColor = .cyan
        return lbl
    }()
}

extension FrequentView : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellId) as? CustomCell else { return UITableViewCell()}
        if indexPath.row == 0{
            cell.lbl.text = "안녕하세요~"
        }else if indexPath.row == 1{
            cell.lbl.text = "감사합니다!"
        }else{
            cell.lbl.text = "지금 가는 중이야!"
        }
        return cell
    }

}


class CustomCell : UITableViewCell {
    
    static let cellId = "cell"
    
    let lbl : UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 15)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(){
        self.addSubview(lbl)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lbl.topAnchor.constraint(equalTo: self.topAnchor),
            lbl.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            lbl.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            lbl.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
}




