//
//  MainViewModel.swift
//  K-Keyboard
//
//  Created by 김지인 on 2022/10/08.
//

final class MainViewModel {
    
    var tagList = ["이벤트", "캐릭터", "새", "동물", "앙증맞고귀여운" ,"동글동글", "마루", "귀여웡", "배고파","동글동글", "마루", "귀여웡", "배고파"]
    var keywordList = [
        KeywordModel(title: "신나 🎉", imageName: "keyword_fun"),
        KeywordModel(title: "기대 ✨", imageName: "keyword_expect"),
        KeywordModel(title: "기대 ✨", imageName: "keyword_expect"),
        KeywordModel(title: "기대 ✨", imageName: "keyword_expect")
    ]
    var themeList = [
        ThemeModel(emoji: "😄", title: "맘에들어요", count: 0),
        ThemeModel(emoji: "😍", title: "심쿵했어요", count: 0),
        ThemeModel(emoji: "😉", title: "응원해요", count: 0),
        ThemeModel(emoji: "😂", title: "갖고싶어요", count: 0)
    ]
    var reviewList = [
        ReviewModel(userType: .creater, nickname: "julia", content: "dfsdsffsd"),
        ReviewModel(userType: .user, nickname: "유저", content: "111"),
        ReviewModel(userType: .user, nickname: "유저", content: "dfsds22ffsd"),
        ReviewModel(userType: .user, nickname: "유저", content: "3333"),
    ]
    
    var reviewCollectionViewIsHidden: Bool = false

}
