//
//  Repository.swift
//  K-Keyboard
//
//  Created by sokol on 2022/10/01.
//

import Foundation
//UnitTest시 Repository 실제 클래스를 사용하면 안될것 같으므로(MockRepository를 만들어서 유닛테스트를 돌려야 하므로) 프로토콜을 추가함
protocol RepositoryProtocol {
    var httpClient: HTTPClientProtocol { get set }
    func fetch<T: Codable>(api: API) async throws -> T
}

//이 클래스가 들고 있는 어떠한 클래스가 dummyServerData를 받고
//이 클래스가 들고 있는 또다른 클래스가 Model이 들고있기 무겁고, 나누고 싶은 어떠한 행동들을 할 수 있게...ex.coreData, Filemanager, etc
class Repository: RepositoryProtocol {
    
    var httpClient: HTTPClientProtocol
    
    init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }
    
    func fetch<T: Codable>(api: API) async throws -> T {
        let result: T = try await httpClient.fetch(api: api)
        return result
    }
}
