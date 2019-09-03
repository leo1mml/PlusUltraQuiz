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
                it("has to set an initial state") {
                    let initialState = FakeState()
                    sut = StateMachine(initialState: initialState)
                    expect(sut?.currentState).toNot(beNil())
                    expect(sut?.currentState).to(be(initialState))
                }
                
                context("when enters initial state") {
                    var fakeState: FakeState?
                    it("has to call didEnter") {
                        fakeState = FakeState()
                        sut = StateMachine(initialState: fakeState!)
                        expect(fakeState?.hasCalledDidEnter).to(beTruthy())
                    }
                }
            }
            describe("enter(state:)") {
                var initialState = FakeState()
                let dummyService = FakeDataService()
                var secondState: State = FakeFetchingState(dataService: dummyService)
                beforeEach {
                    sut = StateMachine(initialState: initialState)
                    sut?.enter(state: secondState)
                }
                context("when the next state is different from the current one") {
                    it("has to call didEnter from the current state") {
                        let state = secondState as? FakeFetchingState
                        expect(state).toNot(beNil())
                        expect(state?.hasCalledDidEnter).to(beTruthy())
                    }
                }
                
                context("when the next state is the same") {
                    
                    beforeEach {
                        initialState = FakeState()
                        secondState = FakeState()
                        sut = StateMachine(initialState: initialState)
                        sut?.enter(state: secondState)
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
