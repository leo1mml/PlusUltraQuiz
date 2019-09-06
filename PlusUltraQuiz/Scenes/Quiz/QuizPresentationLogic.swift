//
//  QuizPresenter.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 03/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation

protocol QuizPresentationLogic: AnyObject {
    func presentInitialState(challengeTitle: String, wordsAmount: Int)
    func presentLoadingView()
    func presentAlert(alertStructure: AlertStructure)
    func updateTime(timeLeft: String)
    func append(word: String)
    func releaseSearchBar()
}
