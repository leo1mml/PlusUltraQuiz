//
//  FakeWordChecker.swift
//  PlusUltraQuizTests
//
//  Created by leonel.menezes.lima on 05/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Nimble
import Quick
@testable import PlusUltraQuiz

class FakeWordChecker: WordChecker {
    
    var hasCalledCheck = false
    
    func check(word: String) {
        hasCalledCheck = true
    }
}
