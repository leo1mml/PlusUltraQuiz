//
//  QuizViewController.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 04/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import UIKit

final class QuizViewController: UIViewController {
    
    private var presentationStateMachine: StateMachine?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        let fetchState = FetchingState(dataService: JavaQuizDataService(), presenter: self)
        presentationStateMachine = StateMachine(initialState: fetchState)
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
