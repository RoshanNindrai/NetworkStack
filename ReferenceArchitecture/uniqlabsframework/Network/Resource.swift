//
//  Resources.swift
//  ReferenceArchitecture
//
//  Created by Roshan Balaji Nindrai SenthilNatha on 6/25/16.
//  Copyright © 2016 uniqlabs. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: AnyObject]

/// This struct is used to represent a resource
struct Resource<R> {

    let url : URL
    let type : RequestType?
    let parse : (Data) -> R?

    var task : URLSessionTask?
    var header : [String : String]?
    private var request : URLRequest?

}

extension Resource {

    /// This method is used to create a resource object with json parser
    ///
    /// - parameter url:       url of thr request
    /// - parameter parseJSON: json parser function
    /// - parameter header:    header for the request if AnyObject
    ///
    /// - returns: returns a Resource that can be handed over to WebService
    init(url: URL,
         type : RequestType = .GET,
         parseJSON: (AnyObject) -> R?) {

        self.url = url
        self.parse = { data in
            let json = try? JSONSerialization.jsonObject(with: data,
                                                         options : [])
            return json.flatMap(parseJSON)
        }
        self.type = type
        request = URLRequest(url:url)
        request!.httpMethod = self.type!.rawValue

    }
}

extension Resource {

    /// This method creates a URLRequest for a resource
    ///
    /// - returns: a URLRequest for URLSession
    func urlRequest() -> URLRequest {
        return request!
    }
}

extension Resource {


}

