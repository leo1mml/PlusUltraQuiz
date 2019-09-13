//
//  TimerView.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 04/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import UIKit
import SnapKit

protocol TimerActions: AnyObject {
    func reset()
    func start()
}

final class TimerView: UIView {
    
    weak var actionDelegate: TimerActions?
    
    private let scoreCountLabel: UILabel = {
        let label = UILabel()
        label.font = QuizFont.largeTitle
        return label
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.font = QuizFont.largeTitle
        return label
    }()
    
    private let actionButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = QuizFont.button
        btn.backgroundColor = QuizColor.orange
        btn.setTitle(ButtonTitle.start, for: .normal)
        return btn
    }()
    
    private enum ButtonTitle {
        static let reset = "Reset"
        static let start = "Start"
    }
    
    private lazy var vStack = UIStackView()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(timerText: String) {
        self.timerLabel.text = timerText
    }
    
    func set(scoreText: String) {
        self.scoreCountLabel.text = scoreText
    }
}

extension TimerView: ViewCoding {
    func buildViewHierarchy() {
        let hStack = createLabelStack(subviews: [scoreCountLabel, timerLabel])
        configure(vStack: vStack, subviews: [hStack, actionButton])
        addSubview(vStack)
    }
    private func createLabelStack(subviews: [UIView]) -> UIStackView {
        let hStack = UIStackView()
        hStack.distribution = .equalSpacing
        subviews.forEach({hStack.addArrangedSubview($0)})
        return hStack
    }
    
    private func configure(vStack: UIStackView, subviews: [UIView]) {
        vStack.axis = .vertical
        vStack.spacing = LayoutConstants.verticalSpacing
        subviews.forEach({vStack.addArrangedSubview($0)})
    }
    
    func setupConstraints() {
        self.actionButton.snp.makeConstraints {
            $0.height.equalTo(LayoutConstants.buttonHeight)
        }
        self.vStack.snp.makeConstraints({
            $0.leading.trailing.equalToSuperview().inset(LayoutConstants.horizontalInset)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(LayoutConstants.verticalSpacing)
            $0.top.equalToSuperview().inset(LayoutConstants.verticalSpacing)
        })
    }
    
    private enum LayoutConstants {
        static let buttonHeight: CGFloat = 60
        static let buttonCornerRadius: CGFloat = 10
        static let verticalSpacing: CGFloat = 16
        static let horizontalInset: CGFloat = 16
    }
    
    func additionalSettings() {
        self.backgroundColor = QuizColor.offWhite
        self.actionButton.layer.cornerRadius = LayoutConstants.buttonCornerRadius
        self.actionButton.addTarget(self, action: #selector(beginGame), for: .touchUpInside)
    }
    
    @objc
    private func beginGame() {
        if actionButton.title(for: .normal) == ButtonTitle.start {
            startAction()
        } else {
            resetAction()
        }
    }
    
    private func startAction() {
        actionButton.setTitle(ButtonTitle.reset, for: .normal)
        actionDelegate?.start()
    }
    
    private func resetAction() {
        actionButton.setTitle(ButtonTitle.start, for: .normal)
        actionDelegate?.reset()
    }
}
