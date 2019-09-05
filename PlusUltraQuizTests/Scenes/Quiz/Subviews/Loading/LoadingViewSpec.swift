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
            let size = CGSize(width: 200, height: 200)
            let frame = CGRect(origin: .zero, size: size)
            var sut: LoadingView?
            beforeEach {
                sut = LoadingView(frame: frame)
            }
            describe("init") {
                it("has the expected look and feel") {
                    expect(sut) == snapshot("Loading view", usesDrawRect: false)
                }
            }
            
            describe("animate") {
                it("has to mach snapshot on time") {
                    sut?.animate()
                    expect(sut).toEventually(haveValidSnapshot(named: "Loading View Animated", usesDrawRect: false, tolerance: 0.3))
                }
            }
        }
    }
}
