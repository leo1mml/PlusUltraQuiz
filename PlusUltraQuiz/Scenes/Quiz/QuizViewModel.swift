//
//  QuizViewModel.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 03/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation

struct QuizViewModel: Decodable {
    var title: String
    var keywords: [String]
    
    enum CodingKeys: String, CodingKey {
        case title = "question"
        case keywords = "answer"
    }
}
