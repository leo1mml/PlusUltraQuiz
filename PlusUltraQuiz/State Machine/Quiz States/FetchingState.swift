//
//  FetchingState.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 02/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation

final class FetchingState: State {
    
    private var dataService: DataService
    
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    func didEnter() {
        dataService.fetchData()
    }
    
    func willLeave() {
        
    }
}
