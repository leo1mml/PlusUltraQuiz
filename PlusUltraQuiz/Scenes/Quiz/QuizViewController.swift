//
//  QuizViewController.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 04/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import UIKit

final class QuizViewController: UIViewController {
    
    private lazy var stateMachine: StateMachine = {
        let fetchState = FetchingState(dataService: JavaQuizDataService(), presenter: self)
        let stateMachine = StateMachine(states: [fetchState])
        return stateMachine
    }()
    
    private let overlayLoadingView = OverlayLoadingViewController()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
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
    }
    
    func presentError() {
        
    }
    
    func presentLoadingView() {
        present(overlayLoadingView, animated: true, completion: nil)
    }
}
