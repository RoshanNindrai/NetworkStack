//
//  ViewController.swift
//  ReferenceArchitecture
//
//  Created by Roshan Balaji Nindrai SenthilNatha on 6/25/16.
//  Copyright © 2016 uniqlabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let test = Resource<testresource>(url: URL(string:"https://httpbin.org/get")!,
                                          type:.GET,
                                          parseJSON: {json in
            guard let dictionaries = json as? JSONDictionary else { return nil }
                                return testresource.init(dataDict: dictionaries)
        })

        _ = Webservice.load(resource: test, completion: {data in
            print("1")
        })
        _ = Webservice.load(resource: test, completion: {data in
            print("2")
        })
        _ = Webservice.load(resource: test, completion: {data in
            print("3")
        })
        _ = Webservice.load(resource: test, completion: {data in
            print("4")
        })
        _ = Webservice.load(resource: test, completion: {data in
            print("5")
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

