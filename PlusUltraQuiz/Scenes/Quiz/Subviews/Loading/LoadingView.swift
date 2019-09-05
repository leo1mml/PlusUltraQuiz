//
//  LoadingView.swift
//  PlusUltraQuiz
//
//  Created by leonel.menezes.lima on 03/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import UIKit
import SnapKit

final class LoadingView: UIView {
    private var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .white
        indicator.hidesWhenStopped = false
        return indicator
    }()
    
    private var loadingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        label.text = "Loading"
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate() {
        indicator.startAnimating()
    }
}

extension LoadingView: ViewCoding {
    func buildViewHierarchy() {
        [indicator, loadingLabel].forEach({addSubview($0)})
    }
    
    func setupConstraints() {
        let stack = createVerticalStack()
        addSubview(stack)
        stack.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalToSuperview().inset(24)
        }
    }
    
    private func createVerticalStack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        [indicator, loadingLabel].forEach({stack.addArrangedSubview($0)})
        return stack
    }
    
    func additionalSettings() {
        self.backgroundColor = .black
        self.layer.cornerRadius = 10
    }
}