//
//  QuizViewController.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 04/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import UIKit
import SnapKit

final class QuizViewController: UIViewController {
    
    private let vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    private let overlayLoadingView = OverlayLoadingViewController()
    
    private let topView = QuizTopView()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.alpha = 0
        return tableView
    }()
    
    private let timerView = TimerView()
    
    private lazy var interactor: QuizScreenBusinessLogic = {
        let presenter = QuizPresenterImp(presentationLogic: self)
        let interactor = QuizInteractor(dataService: JavaQuizDataService(), presenter: presenter)
        return interactor
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupViews()
        view.backgroundColor = .white
        timerView.actionDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interactor.fetchChallenge()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension QuizViewController: QuizPresentationLogic {
    func presentEmptyView(challengeTitle: String, wordsAmount: Int) {
        self.overlayLoadingView.dismissView()
        self.topView.set(title: challengeTitle)
        self.timerView.set(scoreText: "\(QuizSettings.gameDuration):00")
        self.timerView.set(scoreText: "0/\(wordsAmount)")
    }
    
    private func initialSetupForViews(viewModel: QuizViewModel) {
        topView.set(title: viewModel.title)
        timerView.set(scoreText: "00/\(viewModel.keywords.count)")
        timerView.set(timerText: "\(QuizSettings.gameDuration):00")
    }
    
    func presentLoadingView() {
        present(overlayLoadingView, animated: true, completion: nil)
    }
    
    func updateTime(timeLeft: String) {
        self.timerView.set(timerText: timeLeft)
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
}

extension QuizViewController: TimerActions {
    func reset() {
        
    }
    
    func start() {
        interactor.triggerTimer()
    }
}

extension QuizViewController: ViewCoding {
    func buildViewHierarchy() {
        [topView, tableView, timerView].forEach({vStack.addArrangedSubview($0)})
        view.addSubview(vStack)
    }
    
    func setupConstraints() {
        tableView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        vStack.snp.makeConstraints({
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.width.equalToSuperview()
        })
    }
    
    private enum LayoutConstants {
        static let timerHeight: CGFloat = 170
        static let horizontalInset: CGFloat = 16
    }
}
