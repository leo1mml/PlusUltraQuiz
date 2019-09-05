//
//  QuizTableViewDataSource.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 05/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import UIKit

class QuizTableViewDatasource: NSObject, UITableViewDataSource {
    
    var words: [String] = []
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: QuizViewController.cellId) else {
                return UITableViewCell()
        }
        cell.textLabel?.text = words[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
}
