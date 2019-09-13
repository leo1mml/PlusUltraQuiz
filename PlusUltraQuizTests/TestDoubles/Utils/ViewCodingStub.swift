//
//  ViewCodingStub.swift
//  PlusUltraQuizTests
//
//  Created by leonel.menezes.lima on 03/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Nimble
import Quick
@testable import PlusUltraQuiz

final class ViewCodingStub: ViewCoding {
    
    var hasCalledBuildViewHierarchy = false
    var hasCalledSetupConstraints = false
    var hasCalledAdditionalSettings = false
    
    func buildViewHierarchy() {
        hasCalledBuildViewHierarchy = true
    }
    
    func setupConstraints() {
        hasCalledSetupConstraints = true
    }
    
    func additionalSettings() {
        hasCalledAdditionalSettings = true
    }
    
    
}
