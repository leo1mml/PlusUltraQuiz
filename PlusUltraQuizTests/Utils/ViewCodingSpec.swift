//
//  ViewCodingSpec.swift
//  PlusUltraQuizTests
//
//  Created by leonel.menezes.lima on 03/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import PlusUltraQuiz

final class ViewCodingSpec: QuickSpec {
    override func spec() {
        describe("ViewCoding") {
            context("when additionalSettings is implemented") {
                it("has to call all the methods") {
                    let viewCoding = ViewCodingStub()
                    viewCoding.setupViews()
                    let hasCalledMethods = viewCoding.hasCalledAdditionalSettings && viewCoding.hasCalledSetupConstraints && viewCoding.hasCalledBuildViewHierarchy
                    expect(hasCalledMethods).to(beTruthy())
                }
            }
        }
        
        context("when additionalSettings is not implemented") {
            it("has to call all methods exept for additionalSettings") {
                let viewCoding = ViewCodingPartialStub()
                viewCoding.setupViews()
                let hasCalledMethods = !viewCoding.hasCalledAdditionalSettings && viewCoding.hasCalledSetupConstraints && viewCoding.hasCalledBuildViewHierarchy
                expect(hasCalledMethods).to(beTruthy())
            }
        }
    }
}
