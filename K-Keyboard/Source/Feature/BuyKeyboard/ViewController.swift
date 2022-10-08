//
//  ViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

class ViewController: UIViewController {
    
    let buyView: BuyView = {
       let view = BuyView()
        return view
    }()
    
    var toolbarState: Bool?
    var maxLength = 20 //글자수
    
    let commentTableView = UITableView()
    var comment = [String]()
    var height = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        buyView.viewController = self
        
        buyView.buyButton.addTarget(self, action: #selector(buyButtonPressed), for: .touchUpInside)
        buyView.commentButton.addTarget(self, action: #selector(commentButtonPressed), for: .touchUpInside)
        
        hideKeyboardWhenTappedAround() //키보드내리기
        enableKeyboardHideOnTap()
        stringNumber()//글자수제한
        
        toolbarState = true
        
        //테이블뷰
        configure()
        setupTableView()
        commentTableView.register(CommentTableViewCell.self, forCellReuseIdentifier: "cell")
        commentTableView.isScrollEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUPReturnForeground()
    }
    
    func configure() {
        buyView.contentView.addSubview(commentTableView)
        commentTableView.translatesAutoresizingMaskIntoConstraints = false
        commentTableView.topAnchor.constraint(equalTo: buyView.timeLabel.bottomAnchor).isActive = true
        commentTableView.bottomAnchor.constraint(equalTo: buyView.contentView.bottomAnchor, constant: -50).isActive = true
        commentTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        commentTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        commentTableView.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        commentTableView.rowHeight = 120
        commentTableView.separatorStyle = .none
    }
    
    func setupTableView() {
        commentTableView.delegate = self
        commentTableView.dataSource = self
    }
    
    private func stringNumber() {
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: UITextField.textDidChangeNotification, object: nil)
    }
    
    @objc private func textDidChange(_ notification: Notification) {
            if let textField = notification.object as? UITextField {
                if let text = textField.text {
                    
                    if text.count > maxLength {
                        //20글자 넘어가면 자동으로 키보드 내려가도록
                        textField.resignFirstResponder()
                    }
                    
                    //초과되는 텍스트 제거
                    if text.count >= maxLength {
                        let index = text.index(text.startIndex, offsetBy: maxLength)
                        let newString = text[text.startIndex..<index]
                        buyView.commentTextField.text = String(newString)
                    }
                }
            }
        }
    
    private func enableKeyboardHideOnTap() {
        NotificationCenter.default.addObserver(self, selector: #selector(toolbarMoveUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(toolbarMoveDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func toolbarMoveUp( notification: NSNotification){
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keybaordRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keybaordRectangle.height
            buyView.commentToolbar.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight)
        }
    }
    
    @objc func toolbarMoveDown( notification: NSNotification){
        buyView.commentToolbar.transform = CGAffineTransform(translationX: 0, y: 0)
    }
    
    func setUPReturnForeground() {
        if toolbarState == true {
            buyView.toolbar.isHidden = false
        } else {
            buyView.toolbar.isHidden = true
        }
    }
    
    @objc func buyButtonPressed() {
        let nextVC = PopUpViewController()
        nextVC.modalPresentationStyle = .overCurrentContext
        toolbarState = false
        present(nextVC, animated: false)
    }
    
    @objc func commentButtonPressed() {
        let value = buyView.commentTextField.text ?? ""
        if value == "" {
            let alert = UIAlertController(title: "댓글을 입력해주세요", message: "확인을 눌러주세요", preferredStyle: UIAlertController.Style.alert)
            let cancel = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
        } else {
            commentTableView.removeConstraints(commentTableView.constraints)
            comment.append(value)
            height += 120
            configure()
        }
        view.endEditing(true)
        buyView.reviewLabel.text = "구매 리뷰 \(comment.count)"
        buyView.commentTextField.text = ""
        buyView.commentTextField.placeholder = "댓글을 남겨보세요!"
        commentTableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentTableViewCell
        cell.selectionStyle = .none
        cell.profileImageView.image = UIImage(named: "Profile")
        cell.nicknameLabel.text = "닉네임"
        cell.commentLabel.text = comment[indexPath.row]
        cell.timeLabel.text = "1초"
        return cell
    }
    

}

// 키보드 숨기기
extension ViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = true
        self.buyView.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
