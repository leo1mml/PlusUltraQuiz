//
//  ViewCodingPartialStub.swift
//  PlusUltraQuizTests
//
//  Created by leonel.menezes.lima on 03/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation
@testable import PlusUltraQuiz

final class ViewCodingPartialStub: ViewCoding {
    var hasCalledBuildViewHierarchy = false
    var hasCalledSetupConstraints = false
    var hasCalledAdditionalSettings = false
    
    func buildViewHierarchy() {
        hasCalledBuildViewHierarchy = true
    }
    
    func setupConstraints() {
        hasCalledSetupConstraints = true
    }
    
}
