//
//  Challenge.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 04/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation

struct Challenge: Decodable {
    var title: String
    var keywords: [String]
    
    enum CodingKeys: String, CodingKey {
        case title = "question"
        case keywords = "answer"
    }
}
