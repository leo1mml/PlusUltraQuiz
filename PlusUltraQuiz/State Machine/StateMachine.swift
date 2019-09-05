//
//  StateMachine.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 02/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation

final class StateMachine {
    
    private let states: [State]
    private(set) var currentState: State?
    
    init(states: [State]) {
        self.states = states
    }
    
    func enter(_ stateType: AnyClass) {
        for state in states {
            if state.isKind(of: stateType) && isCurrentStateDifferentFrom(stateType) {
                change(to: state)
                return
            }
        }
    }
    
    private func isCurrentStateDifferentFrom(_ nextState: AnyClass) -> Bool {
        let isDifferentType = nextState != type(of: currentState).self
        return isDifferentType
    }
    
    private func change(to state: State) {
        self.currentState = state
        self.currentState?.didEnter()
    }
}
