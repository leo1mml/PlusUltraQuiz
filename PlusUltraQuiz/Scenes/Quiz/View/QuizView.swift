//
//  QuizView.swift
//  PlusUltraQuiz
//
//  Created by leonel.menezes.lima on 05/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import UIKit

final class QuizView: UIView {
    private let vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    private let searchBarDelegate: QuizSearchbarDelegate
    
    private lazy var topView: QuizTopView = {
        return QuizTopView(searchBarDelegate: searchBarDelegate)
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.alpha = 0
        return tableView
    }()
    
    private let tableViewDatasource = QuizTableViewDatasource()
    
    private let timerView = TimerView()
    
    init(frame: CGRect = .zero, delegate: WordChecker & TimerActions) {
        self.searchBarDelegate = QuizSearchbarDelegate(delegate: delegate)
        self.timerView.actionDelegate = delegate
        super.init(frame: frame)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func presentEmptyState(title: String, wordsAmount: Int) {
        topView.set(title: title)
        resetTimerView(wordsAmount: wordsAmount)
        clearTableView()
    }
    
    private func resetTimerView(wordsAmount: Int) {
        timerView.set(scoreText: "\(QuizSettings.gameDuration):00")
        timerView.set(scoreText: "0/\(wordsAmount)")
    }
    
    private func clearTableView() {
        tableView.alpha = 0
        tableViewDatasource.words = []
        tableView.reloadData()
    }
    
    func setTimer(timeLeft: String) {
        timerView.set(timerText: timeLeft)
    }
    
    func append(word: String) {
        tableView.alpha = 1
        tableViewDatasource.words.append(word)
        tableView.reloadData()
    }
}

extension QuizView: ViewCoding {
    func buildViewHierarchy() {
        [topView, tableView, timerView].forEach({vStack.addArrangedSubview($0)})
        addSubview(vStack)
    }
    
    func setupConstraints() {
        tableView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        vStack.snp.makeConstraints({
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.bottom.width.equalToSuperview()
        })
    }
    
    private enum LayoutConstants {
        static let timerHeight: CGFloat = 170
        static let horizontalInset: CGFloat = 16
    }
    
    func additionalSettings() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: QuizViewController.cellId)
        tableView.dataSource = tableViewDatasource
        backgroundColor = .white
    }
}
