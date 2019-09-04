//
//  LoadingViewSpec.swift
//  PlusUltraQuizTests
//
//  Created by Leonel Menezes on 03/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Nimble_Snapshots
@testable import PlusUltraQuiz

final class LoadingViewSpec: QuickSpec {
    override func spec() {
        describe("LoadingView") {
            describe("init") {
                let size = CGSize(width: 200, height: 200)
                let frame = CGRect(origin: .zero, size: size)
                let sut = LoadingView(frame: frame, alpha: 0.7)
                it("has the expected look and feel") {
                    expect(sut) == recordSnapshot("Loading view", usesDrawRect: true)
                }
            }
        }
    }
}
