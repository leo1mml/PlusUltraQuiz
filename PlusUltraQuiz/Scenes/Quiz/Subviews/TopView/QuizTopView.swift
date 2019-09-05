//
//  QuizTopView.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 05/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import UIKit

final class QuizTopView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = QuizFont.largeTitle
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        return label
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundImage = UIImage()
        let textfield = searchBar.value(forKey: "searchField") as? UITextField
        textfield?.backgroundColor = QuizColor.offWhite
        searchBar.placeholder = "Insert Word"
        return searchBar
    }()
    
    private let vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    init(frame: CGRect = .zero, searchBarDelegate: UISearchBarDelegate) {
        super.init(frame: frame)
        setupViews()
        self.searchBar.delegate = searchBarDelegate
        backgroundColor = .white
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(title: String) {
        self.titleLabel.text = title
    }
    
    func enableTextField() {
        self.searchBar.isUserInteractionEnabled = true
    }
}

extension QuizTopView: ViewCoding {
    func buildViewHierarchy() {
        [titleLabel, searchBar].forEach({vStack.addArrangedSubview($0)})
        addSubview(vStack)
    }
    
    func setupConstraints() {
        vStack.snp.makeConstraints({
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(LayoutConstants.horizontalInset)
        })
    }
    
    private enum LayoutConstants {
        static let horizontalInset: CGFloat = 16
    }
}
