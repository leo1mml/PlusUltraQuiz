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

class PlusUltraQuizTests: QuickSpec {

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
                    beforeEach {
                        fakeState = FakeState()
                        sut = StateMachine(initialState: fakeState!)
                    }
                    it("has to call didEnter") {
                        expect(fakeState?.hasCalledDidEnter).to(beTruthy())
                    }
                }
            }
            describe("enter(state:)") {
                let initialState = FakeState()
                let secondState = FakeState()
                beforeEach {
                    sut = StateMachine(initialState: initialState)
                    sut?.enter(state: secondState)
                }
                
                it("has to call will leave from previous state") {
                    expect(initialState.hasCalledWillLeave).to(beTruthy())
                }
                it("has to call didEnter from the current state") {
                    expect(secondState.hasCalledDidEnter).to(beTruthy())
                }
            }
        }
    }

}
