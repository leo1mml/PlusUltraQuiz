//
//  FailingDataService.swift
//  PlusUltraQuizTests
//
//  Created by leonel.menezes.lima on 03/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation
@testable import PlusUltraQuiz

class FailingDataService: DataService {
    
    var url: URL = URL(string: "asdfasd")!
    var hasCalledFetchData = false
    
    func fetchData(handler: (Result<Data, URLError>) -> Void) {
        handler(.failure(URLError(.badURL)))
    }
}
