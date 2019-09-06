//
//  QuizViewController.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 04/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import UIKit

final class QuizViewController: UIViewController {
    
    static let cellId = "SimpleCell"
    
    private lazy var quizView = QuizView(delegate: self)
    private let overlayLoadingView = OverlayLoadingViewController()
    
    private lazy var interactor: QuizScreenBusinessLogic = {
        let presenter = QuizPresenterImp(presentationLogic: self)
        let interactor = QuizInteractor(dataService: JavaQuizDataService(), presenter: presenter)
        return interactor
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view = quizView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interactor.fetchChallenge()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension QuizViewController: QuizPresentationLogic {
    
    func presentInitialState(challengeTitle: String, wordsAmount: Int) {
        if !overlayLoadingView.isBeingDismissed {
            overlayLoadingView.dismissView()
        }
        quizView.presentEmptyState(title: challengeTitle, wordsAmount: wordsAmount)
        quizView.setSearchBarUserInteractionEnabled(to: false)
    }
    
    func presentLoadingView() {
        present(overlayLoadingView, animated: true, completion: nil)
    }
    
    func updateTime(timeLeft: String) {
        quizView.setTimer(timeLeft: timeLeft)
    }
    
    func presentAlert(alertStructure: AlertStructure) {
        createAlert(alertStructure: alertStructure) { [weak self] in
            self?.interactor.fetchChallenge()
        }
    }
    
    private func createAlert(alertStructure: AlertStructure, handler: @escaping () -> Void) {
        let alert = UIAlertController(title: alertStructure.title,
                                      message: alertStructure.message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: alertStructure.buttonTitle, style: .default) { _ in
            handler()
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func append(word: String) {
        quizView.append(word: word)
    }
    
    func releaseSearchBar() {
        quizView.setSearchBarUserInteractionEnabled(to: true)
    }
}

extension QuizViewController: TimerActions {
    func reset() {
        interactor.fetchChallenge()
    }
    
    func start() {
        interactor.triggerTimer()
    }
}

extension QuizViewController: WordChecker {
    func check(word: String) {
        interactor.checkForCorrectWord(text: word)
    }
}
