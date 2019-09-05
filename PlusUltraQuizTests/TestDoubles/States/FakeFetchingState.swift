//
//  FakeFetchingState.swift
//  PlusUltraQuizTests
//
//  Created by Leonel Menezes on 02/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import PlusUltraQuiz

final class FakeFetchingState: NSObject, State {
    
    private let dataService: DataService
    
    var hasCalledDidEnter = false
    var hasCalledWillLeave = false
    
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    func didEnter() {
        hasCalledDidEnter = true
    }
    
    func willLeave() {
        hasCalledWillLeave = true
    }
}
