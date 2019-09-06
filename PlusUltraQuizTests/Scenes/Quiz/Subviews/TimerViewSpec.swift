//
//  TimerViewSpec.swift
//  PlusUltraQuizTests
//
//  Created by Leonel Menezes on 04/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Nimble_Snapshots
@testable import PlusUltraQuiz

final class TimerViewSpec: QuickSpec {
    override func spec() {
        describe("TimerView") {
            it("has the expected look and feel") {
                let size = CGSize(width: 355, height: 180)
                let frame = CGRect(origin: .zero, size: size)
                let sut = TimerView(frame: frame)
                sut.set(scoreText: "00/50")
                sut.set(timerText: "5:00")
                expect(sut) == snapshot("TimerView", usesDrawRect: false)
            }
        }
    }
}
