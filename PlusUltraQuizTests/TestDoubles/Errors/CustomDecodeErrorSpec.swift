//
//  CustomDecodeErrorSpec.swift
//  PlusUltraQuizTests
//
//  Created by leonel.menezes.lima on 03/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import PlusUltraQuiz

final class CustomDecodeErrorSpec: QuickSpec {
    override func spec() {
        describe("CustomDecodeError") {
            var sut: CustomDecodeError?
            
            var expectedText: String {
                switch sut! {
                case .NonCompatibleStruct:
                    return "Could not make a struct from this JSON/Data"
                }
            }
            
            it("has the correct description") {
                sut = CustomDecodeError.NonCompatibleStruct
                expect(sut?.description).to(equal(expectedText))
            }
            
            it("has the correct localized description") {
                sut = CustomDecodeError.NonCompatibleStruct
                expect(sut?.localizedDescription).to(equal(expectedText))
            }
        }
    }
}
