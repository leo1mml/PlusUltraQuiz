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
        label.text = "What are all the java keywords?"
        return label
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.barTintColor = QuizColor.offWhite
        return searchBar
    }()
}
