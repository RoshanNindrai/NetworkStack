//
//  Service.swift
//  ReferenceArchitecture
//
//  Created by Roshan Balaji Nindrai SenthilNatha on 6/25/16.
//  Copyright © 2016 uniqlabs. All rights reserved.
//

import Foundation

final class Webservice {

//  The configuration for the session that is to be handled
    private var sessionConfig : URLSessionConfiguration = .default()
//  The actual session object
    private var session : URLSession?
//  shared object for performing all WebService calls
    static let shared : Webservice = Webservice()

    init() {
        self.session = URLSession(configuration: sessionConfig)
    }
}

extension Webservice {

    /// To add custom session configuration to the URLSession
    ///
    /// - parameter config: configuration for the session configuration
    func sessionConfiguration(config : URLSessionConfiguration) {
        self.sessionConfig = config
    }

}

extension Webservice {

    /// This method is used to perfrom the url request and call the completion
    /// handler with the aquired resources
    ///
    /// - parameter resource:   The request resource that was asked by the user
    /// - parameter completion: The completion handler takes in a resource
    class func load<A>(resource: Resource<A>, completion: (A?) -> ()) -> URLSessionTask? {
        
        let task = self.shared.session?.dataTask(with: resource.urlRequest()) { data, _, _ in
                        if let data = data {
                            completion(resource.parse(data))
                        } else {
                            completion(nil)
                        }
                    }

        task?.resume()
        return task

    }
}


