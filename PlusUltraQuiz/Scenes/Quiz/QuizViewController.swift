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
        let presentationStateMachine = StateMachine(initialState: fetchState)
        return presentationStateMachine
    }()
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
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
