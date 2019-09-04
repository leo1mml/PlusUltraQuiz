//
//  DataService.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 02/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation

protocol DataService {
    var url: URL { get }
    func fetchData(handler: (Result<Data, URLError>) -> Void)
}