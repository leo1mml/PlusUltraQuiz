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
        self.currentState = initialState
        currentState.didEnter()
    }
    
    func enter(state: State) {
        if canEnter(state) {
            currentState = state
            currentState.didEnter()
        }
    }
    
    private func canEnter(_ nextState: State) -> Bool {
        let isDifferentType = type(of: nextState).self != type(of: currentState).self
        return isDifferentType
    }
}
