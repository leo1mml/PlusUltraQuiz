//
//  FakeInitialState.swift
//  PlusUltraQuizTests
//
//  Created by Leonel Menezes on 02/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation
@testable
import PlusUltraQuiz

final class FakeState: State {
    var hasCalledDidEnter: Bool = false
    var hasCalledWillLeave: Bool = false
    
    func didEnter() {
        hasCalledDidEnter = true
    }
    
    func willLeave() {
        hasCalledWillLeave = true
    }
    
    
}
