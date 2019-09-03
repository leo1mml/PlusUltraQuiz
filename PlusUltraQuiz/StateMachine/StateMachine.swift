//
//  StateMachine.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 02/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation

final class StateMachine {
    
    private(set) var currentState: State
    
    init(initialState: State) {
        currentState = initialState
        enter(state: currentState)
    }
    
    func enter(state: State) {
        currentState.willLeave()
        state.didEnter()
    }
}
