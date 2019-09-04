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
                    sut = FetchingState(dataService: fakeDataService!, presenter: FakeQuizPresenter())
                }
                
                it("has to call fetchData") {
                    sut?.didEnter()
                    expect(fakeDataService).toNot(beNil())
                    expect(fakeDataService?.hasCalledFetchData).to(beTruthy())
                }
                
                context("when fetching data") {
                    var presenter: QuizPresentationLogic?
                    beforeEach {
                        presenter = FakeQuizPresenter()
                    }
                    context("when the data is fetched successfully") {
                        it("has to deliver the data through a handler") {
                            sut = FetchingState(dataService: FakeDataService(), presenter: presenter!)
                            sut?.didEnter()
                            let presenter = presenter as! FakeQuizPresenter
                            expect(presenter.hasCalledPresentViewModel).toEventually(beTruthy())
                        }
                    }
                    
                    context("when the data is not fetched successfully") {
                        it("has to send error presentation handler") {
                            sut = FetchingState(dataService: FailingDataService(), presenter: presenter!)
                            sut?.didEnter()
                            let presenter = presenter as! FakeQuizPresenter
                            expect(presenter.hasCalledPresentError).toEventually(beTruthy())
                        }
                    }
                    
                    context("when the data is invalid") {
                        it("has to send error presentation handler") {
                            sut = FetchingState(dataService: InvalidDataDataService(), presenter: presenter!)
                            sut?.didEnter()
                            let presenter = presenter as! FakeQuizPresenter
                            expect(presenter.hasCalledPresentError).toEventually(beTruthy())
                        }
                    }
                }
            }
            
            
        }
    }
}
