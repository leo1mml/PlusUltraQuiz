//
//  QuizPresenterImp.swift
//  PlusUltraQuiz
//
//  Created by leonel.menezes.lima on 03/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import UIKit

final class QuizPresenterImp: QuizPresenter {
    
    private weak var presentedViewController: UIViewController?
    private let overlayView = OverlayLoadingViewController()
    
    init(viewController: UIViewController) {
        self.presentedViewController = viewController
    }
    
    func present(viewModel: QuizViewModel) {
        overlayView.dismiss(animated: true, completion: nil)
    }
    
    func presentError() {
        
    }
    
    func presentLoadingView() {
        presentedViewController?.present(overlayView, animated: true, completion: nil)
    }
}
