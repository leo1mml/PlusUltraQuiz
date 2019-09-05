//
//  QuizSearchbarDelegate.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 05/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import UIKit

protocol WordChecker: AnyObject {
    func check(word: String)
}

final class QuizSearchbarDelegate: NSObject, UISearchBarDelegate {
    
    private weak var checkWordDelegate: WordChecker?
    
    init(delegate: WordChecker) {
        super.init()
        self.checkWordDelegate = delegate
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        checkWordDelegate?.check(word: searchText)
    }
}
