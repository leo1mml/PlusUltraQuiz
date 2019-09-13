//
//  OverlayLoadingViewController.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 03/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import UIKit

class OverlayLoadingViewController: UIViewController {
    
    private let loadingView = LoadingView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        setupPresentationMode()
        loadingView.animate()
        setupViews()
    }
    
    private func setupPresentationMode() {
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}

extension OverlayLoadingViewController: ViewCoding {
    func buildViewHierarchy() {
        view.addSubview(self.loadingView)
    }
    
    func setupConstraints() {
        let expectedWidth = UIScreen.main.bounds.width * LayoutConstants.loadingSizeRatio
        loadingView.snp.makeConstraints({
            $0.center.equalToSuperview()
            $0.height.width.equalTo(expectedWidth)
        })
    }
    
    private enum LayoutConstants {
        static let loadingSizeRatio: CGFloat = 0.5
        
        static let alphaOverlay: CGFloat = 0.7
    }
}
