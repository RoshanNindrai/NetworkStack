//
//  Request.swift
//  ReferenceArchitecture
//
//  Created by Roshan Balaji Nindrai SenthilNatha on 6/25/16.
//  Copyright © 2016 uniqlabs. All rights reserved.
//

import Foundation

/// This represent the kind of network activity that is gonna takes place
///
/// - POST:   used for a post request
/// - GET:    used for a get request
/// - DELETE: used for a delete request
/// - PUT:    used for a put request
enum RequestType : String {
    case POST
    case GET
    case DELETE
    case PUT
}

