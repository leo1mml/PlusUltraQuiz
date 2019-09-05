//
//  OverlayLoadingViewControllerSpec.swift
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

final class OverlayLoadingViewControllerSpec: QuickSpec {
    override func spec() {
        describe("OverlayLoadingViewController") {
            let overlay = OverlayLoadingViewController()
            it("has the expected look and feel") {
                expect(overlay) == snapshot("Overlay VC", usesDrawRect: false)
            }
        }
    }
}
