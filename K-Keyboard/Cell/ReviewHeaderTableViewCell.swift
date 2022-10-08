//
//  ReviewHeaderTableViewCell.swift
//  K-Keyboard
//
//  Created by 유영훈 on 2022/10/08.
//

import UIKit

class ReviewHeaderTableViewCell: UITableViewCell {

    static let identifier = "ReviewHeaderTableViewCell"
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile.png")!
        return imageView
    }()
    
    let contentbackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 242/255, green: 243/255, blue: 247/255, alpha: 1.0)
        view.layer.cornerRadius = 21
        view.layer.masksToBounds = true
        return view
    }()
    
    let textInputField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .clear
        field.placeholder = "이 테마가 마음에 드시나요?"
        field.font = .NotoSanKR(weight: .Regular, size: 12)
//        field.textColor = UIColor(red: 170/255, green: 171/255, blue: 179/255, alpha: 1.0)
        return field
    }()
    
    let writeButton: UIButton = {
        let view = UIButton()
//        view.setTitle("", for: <#T##UIControl.State#>)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        contentbackgroundView.translatesAutoresizingMaskIntoConstraints = false
        textInputField.translatesAutoresizingMaskIntoConstraints = false
        let doneButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(hideKeyboard))
        let writeButton = UIBarButtonItem(title: "작성", style: .done, target: self, action: #selector(addReview))
        let toolbar = UIToolbar()
        toolbar.setItems([writeButton, doneButton], animated: true)
        toolbar.sizeToFit()
        textInputField.inputAccessoryView = toolbar
        
        [profileImageView, contentbackgroundView].forEach {
            addSubview($0)
        }
        contentbackgroundView.addSubview(textInputField)
    }
    
    @objc func addReview() {
        NotificationCenter.default.post(name: NSNotification.Name("addReview"), object: textInputField.text!, userInfo: nil)
        textInputField.text = ""
    }
    
    @objc func hideKeyboard() {
        endEditing(true)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            profileImageView.widthAnchor.constraint(equalToConstant: 48),
            profileImageView.heightAnchor.constraint(equalToConstant: 48),
            
            contentbackgroundView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            contentbackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            contentbackgroundView.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 0),
            contentbackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            contentbackgroundView.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
            contentbackgroundView.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
            
            textInputField.leadingAnchor.constraint(equalTo: contentbackgroundView.leadingAnchor, constant: 12),
            textInputField.centerYAnchor.constraint(equalTo: contentbackgroundView.centerYAnchor),
            textInputField.trailingAnchor.constraint(equalTo: contentbackgroundView.trailingAnchor, constant: -12),
            textInputField.bottomAnchor.constraint(equalTo: contentbackgroundView.bottomAnchor, constant: -6),
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
    }

}
