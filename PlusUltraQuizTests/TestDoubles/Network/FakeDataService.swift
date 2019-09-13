//
//  FakeDataService.swift
//  PlusUltraQuizTests
//
//  Created by Leonel Menezes on 02/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation
@testable import PlusUltraQuiz

class FakeDataService: DataService {
    
    var url: URL = URL(string: "asdfasd")!
    var hasCalledFetchData = false
    
    func fetchData(handler: (Result<Data, URLError>) -> Void) {
        hasCalledFetchData = true
        let path = Bundle.main.url(forResource: "JavaKeywords", withExtension: "json")!
        let data = try! Data(contentsOf: path, options: .mappedIfSafe)
        handler(.success(data))
    }
}
