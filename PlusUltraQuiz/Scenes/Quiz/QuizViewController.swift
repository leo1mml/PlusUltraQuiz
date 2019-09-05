//
//  QuizViewController.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 04/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import UIKit

final class QuizViewController: UIViewController {
    
    private lazy var presentationStateMachine: StateMachine = {
        let fetchState = FetchingState(dataService: JavaQuizDataService(), presenter: self)
        let stateMachine = StateMachine(states: [fetchState])
        return stateMachine
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        presentationStateMachine.enter(FetchingState.self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension QuizViewController: QuizPresentationLogic {
    func present(viewModel: QuizViewModel) {
        
    }
    
    func presentError() {
        
    }
    
    func presentLoadingView() {
        
    }
}
