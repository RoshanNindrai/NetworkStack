//
//  TestResource.swift
//  ReferenceArchitecture
//
//  Created by Roshan Balaji Nindrai SenthilNatha on 6/26/16.
//  Copyright © 2016 uniqlabs. All rights reserved.
//

import Foundation

struct testresource {
    let origin : String
}

extension testresource {

    init?(dataDict : JSONDictionary) {
        guard let origin = dataDict["origin"] as? String else {
            return nil
        }
        self.origin = origin
    }
}
