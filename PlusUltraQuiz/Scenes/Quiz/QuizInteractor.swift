//
//  QuizBusiness.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 05/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation

protocol QuizScreenBusinessLogic: AnyObject {
    func fetchChallenge()
    func checkForCorrectWord(text: String)
    func triggerTimer()
}

final class QuizInteractor: QuizScreenBusinessLogic {
    
    private let dataService: DataService
    private var presenter: QuizPresenter
    private var challengeWords: [String] = []
    private var checkedWords: [String] = []
    private var timer: Timer?
    private var timeLeft = 10//QuizSettings.gameDuration * 60
    
    init(dataService: DataService, presenter: QuizPresenter) {
        self.dataService = dataService
        self.presenter = presenter
    }
    
    func fetchChallenge() {
        presenter.presentLoadingView()
        if challengeWords.isEmpty {
            fetchData()
        } else {
            
        }
    }
    
    private func fetchData() {
        dataService.fetchData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    self?.tryToHandle(data: data)
                case .failure(_):
                    self?.presenter.presentErrorAlert()
                }
            }
        }
    }
    
    private func tryToHandle(data: Data) {
        if let challenge = try? self.tryToGetChallenge(from: data) {
            handle(challenge: challenge)
        } else {
            self.presenter.presentErrorAlert()
        }
    }
    
    private func tryToGetChallenge(from data: Data) throws -> Challenge {
        if let challenge = try? JSONDecoder().decode(Challenge.self, from: data) {
            return challenge
        }
        throw CustomDecodeError.NonCompatibleStruct
    }
    
    private func handle(challenge: Challenge) {
        self.challengeWords = challenge.keywords.map({$0.lowercased()})
        self.presenter.presentChallenge(title: challenge.title, wordsAmount: challenge.keywords.count)
    }
    
    func checkForCorrectWord(text: String) {
        let textLowercased = text.lowercased()
        if challengeWords.contains(textLowercased) && !checkedWords.contains(textLowercased) {
            append(word: textLowercased)
        }
    }
    
    private func append(word: String) {
        checkedWords.append(word)
        presenter.addCheckedWord(word)
        if checkedWords.count == challengeWords.count {
            winGame()
        }
    }
    
    private func winGame() {
        presenter.presentWinAlert()
    }
    
    func triggerTimer() {
        guard timer == nil else { return }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(passTime), userInfo: nil, repeats: true)
    }
    
    @objc
    private func passTime() {
        if timeLeft <= 0 {
            loseGame()
            return
        }
        updateTimer()
    }
    
    private func loseGame() {
        timer?.invalidate()
        timer = nil
        presenter.presentLoseAlert(numberChecked: checkedWords.count, total: challengeWords.count)
    }
    
    private func updateTimer() {
        timeLeft -= 1
        presenter.updateTimer(timeLeft: timeLeft)
    }
    
}
