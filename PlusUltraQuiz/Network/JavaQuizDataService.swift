//
//  DataServiceImp.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 04/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation

final class JavaQuizDataService: DataService {
    var url: URL {
        return URL(string: QuizURLs.javaQuiz.rawValue)!
    }
    
    func fetchData(handler: @escaping (Result<Data, URLError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                handler(.success(data))
            } else {
                handler(.failure(URLError(.badURL)))
            }
        }.resume()
    }
}
