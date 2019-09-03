//
//  FetchingStateSpec.swift
//  PlusUltraQuizTests
//
//  Created by Leonel Menezes on 02/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import PlusUltraQuiz

final class FetchingStateSpec: QuickSpec {
    override func spec() {
        describe("FetchingState") {
            
            var sut: FetchingState?
            
            describe("didEnter") {
                var fakeDataService: FakeDataService?
                beforeEach {
                    fakeDataService = FakeDataService()
                    sut = FetchingState(dataService: fakeDataService!)
                }
                
                it("has to call fetchData") {
                    sut?.didEnter()
                    expect(fakeDataService).toNot(beNil())
                    expect(fakeDataService?.hasCalledFetchData).to(beTruthy())
                }
            }
            
            context("when the data is fetched successfully") {
                it("has to deliver the data through a handler") {
                    let presentationLogic: QuizPresenter
                    sut = FetchingState(dataService: FakeDataService())
                    
                }
            }
        }
    }
}
