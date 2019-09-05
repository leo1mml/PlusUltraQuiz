//
//  QuizColorsSpec.swift
//  PlusUltraQuizTests
//
//  Created by Leonel Menezes on 04/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import PlusUltraQuiz

final class QuizColorSpec: QuickSpec {
    override func spec() {
        it("has to return non nil values") {
            expect(QuizColor.offwhite).toNot(beNil())
            expect(QuizColor.orange).toNot(beNil())
        }
    }
}
