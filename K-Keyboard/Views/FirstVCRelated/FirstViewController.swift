//
//  FirstViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

class FirstViewController: UIViewController, FirstViewControllerRoutable {

    var model: FirstModel
    
    var scrollView = UIScrollView()
    lazy var keyboardView = KeyboardView()
    lazy var descriptionView = DescriptionView()
    lazy var tagView = TagView()
    lazy var keywordView = KeywordView()
    lazy var themeOpinionView = ThemeOpinionView()
    lazy var bannerView = BannerView()
    lazy var purchaseReviewListView = PurchaseReviewView()
    lazy var purchaseButtonView = PurchaseButtonView()
    lazy var commentInputView = CommentInputView()
    
    init(viewModel: FirstModel) {
        self.model = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        initViewHierarchy()
        configureView()
        bind()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FirstViewController: Presentable {
    func initViewHierarchy() {
        self.view = UIView()
        self.view.backgroundColor = .white
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(keyboardView)
        scrollView.addSubview(descriptionView)
        scrollView.addSubview(tagView)
        
        scrollView.addSubview(keywordView)
        scrollView.addSubview(themeOpinionView)
        scrollView.addSubview(bannerView)
        scrollView.addSubview(purchaseReviewListView)
        scrollView.addSubview(purchaseButtonView)
        scrollView.addSubview(commentInputView)
     
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ]
        
        constraint += [
            keyboardView.topAnchor.constraint(equalTo: scrollView.topAnchor), //scrollView topAnchor와 첫번째 UIView의 topAnchor가 어떻게 걸렸는지가 중요함
            keyboardView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            keyboardView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            keyboardView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            keyboardView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        ]
        
        constraint += [
            descriptionView.topAnchor.constraint(equalTo: keyboardView.bottomAnchor),
            descriptionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            descriptionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            descriptionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        ]
        
        constraint += [
            tagView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor),
            tagView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            tagView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            tagView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            // TODO: fix temp value
            tagView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        ]
        
        constraint += [
            keywordView.topAnchor.constraint(equalTo: tagView.bottomAnchor),
            keywordView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            keywordView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            keywordView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            // TODO: fix temp value
            keywordView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        ]
        
        constraint += [
            themeOpinionView.topAnchor.constraint(equalTo: keywordView.bottomAnchor),
            themeOpinionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            themeOpinionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            themeOpinionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            themeOpinionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        ]
        
        constraint += [
            bannerView.topAnchor.constraint(equalTo: themeOpinionView.bottomAnchor),
            bannerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            bannerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            bannerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        ]
        
        constraint += [
            purchaseReviewListView.topAnchor.constraint(equalTo: bannerView.bottomAnchor),
            purchaseReviewListView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            purchaseReviewListView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            purchaseReviewListView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            // TODO: fix temp value
            purchaseReviewListView.heightAnchor.constraint(equalToConstant: 380)
        ]
        
        constraint += [
            purchaseButtonView.topAnchor.constraint(equalTo: purchaseReviewListView.bottomAnchor),
            purchaseButtonView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            purchaseButtonView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            purchaseButtonView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            // TODO: fix temp value
            purchaseButtonView.heightAnchor.constraint(equalToConstant: 80),
            purchaseButtonView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ]
        
        constraint += [
            commentInputView.topAnchor.constraint(equalTo: purchaseReviewListView.bottomAnchor),
            commentInputView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            commentInputView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            commentInputView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            // TODO: fix temp value
            commentInputView.heightAnchor.constraint(equalToConstant: 80),
            commentInputView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ]
        
        // TODO: fix temp value
        commentInputView.isHidden = true
        
    }
    
    func configureView() {
        scrollView.backgroundColor = .white
    }
    
    func bind() {
        model.routeSubject = { [weak self] scene in
            guard let self = self else { return }
            self.route(to: scene)
        }
    }
    
    
}

