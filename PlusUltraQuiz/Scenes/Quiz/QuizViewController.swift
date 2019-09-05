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
    
    private lazy var stateMachine: StateMachine = {
        let fetchState = FetchingState(dataService: JavaQuizDataService(), presenter: self)
        let readyToPlay = ReadyToPlay()
        let stateMachine = StateMachine(states: [fetchState])
        return stateMachine
    }()
    
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
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupViews()
        view.backgroundColor = .white
        timerView.actionDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        stateMachine.enter(FetchingState.self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension QuizViewController: QuizPresentationLogic {
    func present(viewModel: QuizViewModel) {
        self.overlayLoadingView.dismissView()
        if stateMachine.currentState?.isKind(of: FetchingState.self) ?? false {
            initialSetupForViews(viewModel: viewModel)
            stateMachine.enter(ReadyToPlay.self)
        } else {
            //TODO: enter PlayingState
        }
    }
    
    private func initialSetupForViews(viewModel: QuizViewModel) {
        topView.set(title: viewModel.title)
        timerView.set(scoreText: "00/\(viewModel.keywords.count)")
        timerView.set(timerText: "\(QuizSettings.gameDuration):00")
    }
    
    func presentAlert() {
        
    }
    
    func presentLoadingView() {
        present(overlayLoadingView, animated: true, completion: nil)
    }
}

extension QuizViewController: TimerActions {
    func reset() {
        
    }
    
    func start() {
        if stateMachine.currentState?.isKind(of: ReadyToPlay.self) ?? false {
            // begin timer and allow typing
        }
    }
    
    func updateTimer(interval: TimeInterval) {
        if interval == 0 {
            presentAlert()
        }
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
