//
//  QuizTopViewSpec.swift
//  PlusUltraQuizTests
//
//  Created by Leonel Menezes on 05/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Nimble_Snapshots
@testable import PlusUltraQuiz

class QuizTopViewSpec: QuickSpec {
    override func spec() {
        describe("QuizTopView") {
            it("has the expected look and feel") {
                let size = CGSize(width: 375, height: 200)
                let frame = CGRect(origin: .zero, size: size)
                let sut = QuizTopView(frame: frame)
                expect(sut) == snapshot("QuizTopView", usesDrawRect: false)
            }
        }
    }
}