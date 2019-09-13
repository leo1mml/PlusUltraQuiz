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
    
    var hasCalledPresentInitialState = false
    var hasCalledPresentAlert = false
    var hasCalledPresentLoading = false
    var hasCalledUpdateTime = false
    var hasCalledAppend = false
    var hasCalledReleaseSearchBar = false
    
    func presentLoadingView() {
        hasCalledPresentLoading = true
    }
    
    func presentInitialState(challengeTitle: String, wordsAmount: Int) {
        hasCalledPresentInitialState = true
    }
    
    func presentAlert(alertStructure: AlertStructure) {
        hasCalledPresentAlert = true
    }
    
    func updateTime(timeLeft: String) {
        hasCalledUpdateTime = true
    }
    
    func append(word: String) {
        hasCalledAppend = true
    }
    
    func releaseSearchBar() {
        hasCalledReleaseSearchBar = true
    }
    
}
