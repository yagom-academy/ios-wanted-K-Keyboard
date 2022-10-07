//
//  ReviewListViewModel.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/08.
//

import Foundation

class PurchaseReviewListViewModel {
    
    //input
    var didReceiveCommentData: (CellModel) -> () = { model in }
    
    //output
    var cellData: [CellModel] {
        return privateCellData
    }
    
    var populateReviewCommentCount: (String) -> () = { string in }
    
    var populateCommentData: (CellModel) -> () = { model in }
    
    //properties
    
    private var privateReviewCommentCount: String = "" {
        didSet {
            populateReviewCommentCount(privateReviewCommentCount)
        }
    }
    
    private var privateCellData : [CellModel] = [] {
        didSet {
            privateReviewCommentCount = "\(privateCellData.count)"
        }
    }
    
    init() {
        bind()
    }
    
    func populateData() {
        initializeCellData()
    }
    
    private func bind() {
        didReceiveCommentData = { [weak self] model in
            guard let self = self else { return }
            self.updateDataSource(model: model)
        }
    }
    
    private func updateDataSource(model: CellModel) {
        privateCellData.append(model)
        populateCommentData(model)
    }
    
    private func initializeCellData(){
        
        var creator = CellModel()
        creator.id = "크리에이터"
        creator.comment = "구매해주셔서 감사합니다💖"
        creator.timeString = "1일"
        creator.isCreator = true
        
        privateCellData.append(creator)
        
        let randomTimeString = ["1일", "1분", "1초"]
        
        for _ in 1...20{
            var user = CellModel()
            user.id = "₀달빔₀"
            user.comment = "아진짜 귀여워요 !!!!"
            user.isCreator = false
            user.timeString = randomTimeString.randomElement() ?? ""
            
            privateCellData.append(user)
        }
    }
}
