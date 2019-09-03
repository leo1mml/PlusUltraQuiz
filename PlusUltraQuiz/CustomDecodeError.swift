//
//  CustomDecodeError.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 03/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation

enum CustomDecodeError: String, Error, CustomStringConvertible {
    
    case NonCompatibleStruct = "Could not make a struct from this JSON/Data"
    
    var description: String {
        return self.rawValue
    }
}
