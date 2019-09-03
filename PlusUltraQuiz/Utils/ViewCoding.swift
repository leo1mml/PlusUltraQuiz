//
//  ViewCoding.swift
//  PlusUltraQuiz
//
//  Created by leonel.menezes.lima on 03/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation

protocol ViewCoding {
    func buildViewHierarchy()
    func setupConstraints()
    func additionalSettings()
}

extension ViewCoding {
    func additionalSettings(){}
    
    func setupViews() {
        buildViewHierarchy()
        setupConstraints()
        additionalSettings()
    }
}
