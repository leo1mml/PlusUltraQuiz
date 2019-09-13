//
//  QuizPresenter.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 05/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import UIKit

protocol QuizPresenter: AnyObject {
    func presentChallenge(title: String, wordsAmount: Int)
    func presentLoadingView()
    func presentErrorAlert()
    func presentLoseAlert(numberChecked: Int, total: Int)
    func updateTimer(timeLeft: Int)
    func addCheckedWord(_ word: String)
    func presentWinAlert()
    func releaseSearchBar()
}

final class QuizPresenterImp: QuizPresenter {
    
    private weak var presentationLogic: QuizPresentationLogic?
    
    private enum Messages {
        
        static let apiErrorTitle = "Server Down"
        static let apiError = "We're having some trouble, try again later..."
        static let apiButtonTitle = "Ok"
        
        static let loseTitle = "Time finished"
        static let loseMessageFormat = "Sorry, time is up! You got %d out of %d answers."
        static let loseButtonTitle = "Try Again"
        
        static let winTitle = "Congratulations"
        static let winMessage = "Good Job! You found all the answers on time. Keep up with the great work."
        static let winButtonTitle = "Play Again"
    }
    
    init(presentationLogic: QuizPresentationLogic) {
        self.presentationLogic = presentationLogic
    }
    
    func presentChallenge(title: String, wordsAmount: Int) {
        presentationLogic?.presentInitialState(challengeTitle: title, wordsAmount: wordsAmount)
    }
    
    func presentLoadingView() {
        presentationLogic?.presentLoadingView()
    }
    
    func presentErrorAlert() {
        let alertStructure = AlertStructure(title: Messages.apiErrorTitle,
                                            message: Messages.apiError,
                                            buttonTitle: Messages.apiButtonTitle)
        presentationLogic?.presentAlert(alertStructure: alertStructure)
    }
    
    func presentLoseAlert(numberChecked: Int, total: Int) {
        let message = String(format: Messages.loseMessageFormat, numberChecked, total)
        let alertStructure = AlertStructure(title: Messages.loseTitle,
                                            message: message,
                                            buttonTitle: Messages.loseButtonTitle)
        presentationLogic?.presentAlert(alertStructure: alertStructure)
    }
    
    func presentWinAlert() {
        let alertStructure = AlertStructure(title: Messages.winTitle,
                                            message: Messages.winMessage,
                                            buttonTitle: Messages.winButtonTitle)
        presentationLogic?.presentAlert(alertStructure: alertStructure)
    }
    
    func updateTimer(timeLeft: Int) {
        let minutes = (timeLeft % 3600) / 60
        let seconds = (timeLeft % 3600) % 60
        let secondsString = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        presentationLogic?.updateTime(timeLeft: "\(minutes):\(secondsString)")
    }
    
    func addCheckedWord(_ word: String) {
        presentationLogic?.append(word: word)
    }
    
    func releaseSearchBar() {
        presentationLogic?.releaseSearchBar()
    }
}
