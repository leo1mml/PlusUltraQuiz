//
//  QuizPresenter.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 03/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation

protocol QuizPresentationLogic: AnyObject {
    func present(viewModel: QuizViewModel)
    func presentError()
    func presentLoadingView()
}
