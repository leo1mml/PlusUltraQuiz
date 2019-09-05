//
//  PlusUltraQuizTests.swift
//  PlusUltraQuizTests
//
//  Created by Leonel Menezes on 02/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Quick
import Nimble
@testable import PlusUltraQuiz

class StateMachineSpec: QuickSpec {

    override func spec() {
        describe("StateMachine") {
            var sut: StateMachine?
            
            describe("init") {
                it("has to set a state") {
                    let state = FakeState()
                    sut = StateMachine(states: [state])
                    sut?.enter(FakeState.self)
                    
                }
            }
            describe("enter(state:)") {
                let dummyService = FakeDataService()
                var initialState: State?
                var secondState: State?
                beforeEach {
                    initialState = FakeState()
                    secondState = FakeFetchingState(dataService: dummyService)
                    sut = StateMachine(states: [initialState!, secondState!])
                    sut?.enter(FakeState.self)
                }
                context("when the next state is different from the current one") {
                    it("has to call didEnter from the current state") {
                        sut?.enter(FakeState.self)
                        sut?.enter(FakeFetchingState.self)
                        let secondState = secondState as? FakeFetchingState
                        expect(secondState?.hasCalledDidEnter).to(beTruthy())
                    }
                }
                
                context("when the next state is the same") {
                    
                    beforeEach {
                        sut = StateMachine(states: [initialState!])
                        sut?.enter(FakeState.self)
                    }
                    
                    it("has to not call didEnter from the next state") {
                        let state = secondState as? FakeState
                        expect(secondState).toNot(beNil())
                        expect(state?.hasCalledDidEnter).toNot(beTruthy())
                    }
                }
            }
        }
    }

}
