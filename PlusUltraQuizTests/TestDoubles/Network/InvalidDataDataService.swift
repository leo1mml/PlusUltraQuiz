//
//  InvalidDataDataService.swift
//  PlusUltraQuizTests
//
//  Created by leonel.menezes.lima on 03/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation
@testable import PlusUltraQuiz

class InvalidDataDataService: DataService {
    var url: URL = URL(string: "asdfasd")!
    var hasCalledFetchData = false
    
    func fetchData(handler: (Result<Data, URLError>) -> Void) {
        let data = "adfasdfa".data(using: .utf8)!
        handler(.success(data))
    }
}
