//
//  ReviewListViewModel.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/08.
//

import Foundation

class PurchaseReviewListViewModel {
    
    //input
    
    //output
    var cellData: [CellModel] {
        return privateCellData
    }
    
    //properties
    
    var privateCellData : [CellModel] = []
    
    init() {
        
    }
    
    func populateData() {
        initializeCellData()
    }
    
    private func initializeCellData(){
        
        var creator = CellModel()
        creator.id = "크리에이터"
        creator.comment = "구매해주셔서 감사합니다💖"
        creator.timeString = "1일"
        creator.isCreator = true
        
        privateCellData.append(creator)
        
        var randomTimeString = ["1일", "1분", "1초"]
        
        for _ in 1...9{
            var user = CellModel()
            user.id = "₀달빔₀"
            user.comment = "아진짜 귀여워요 !!!!"
            user.isCreator = false
            user.timeString = randomTimeString.randomElement() ?? ""
            
            privateCellData.append(user)
        }
    }
}
