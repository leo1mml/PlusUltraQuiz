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
    
    var hasCalledPresentViewModel = false
    var hasCalledPresentError = false
    var hasCalledPresentLoading = false
    
    func present(viewModel: QuizViewModel) {
        hasCalledPresentViewModel = true
    }
    
    func presentError() {
        hasCalledPresentError = true
    }
    
    func presentLoadingView() {
        hasCalledPresentLoading = true
    }
    
}
