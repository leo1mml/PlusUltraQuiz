//
//  DummyQuizPresenter.swift
//  PlusUltraQuizTests
//
//  Created by Leonel Menezes on 03/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import PlusUltraQuiz

class FakeQuizPresenter: QuizPresentationLogic {
    
    var hasCalledPresentEmptyView = false
    var hasCalledPresentError = false
    var hasCalledPresentLoading = false
    
    func presentAlert() {
        hasCalledPresentError = true
    }
    
    func presentLoadingView() {
        hasCalledPresentLoading = true
    }
    
    func presentEmptyView(challengeTitle: String, wordsAmount: Int) {
        hasCalledPresentEmptyView = true
    }
    
}
