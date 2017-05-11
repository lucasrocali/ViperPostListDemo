//
//  DataManager.swift
//  ViperDemoProject
//
//  Created by Lucas Rocali on 5/10/17.
//  Copyright © 2017 Lucas Rocali. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON
import Alamofire
import RealmSwift

extension RealmSwift.Results {

    func toArray() -> [T] {
        return self.map{$0}
    }
}

extension RealmSwift.List {

    func toArray() -> [T] {
        return self.map{$0}
    }
}

extension RealmSwift.LinkingObjects {
    func toArray() -> [T] {
        return self.map{$0}
    }
}

class DataManager {

    static let serverUrl = "http://jsonplaceholder.typicode.com/"

    static func load(fromPath path: String) -> Promise<JSON> {

        let path = "\(serverUrl)\(path)"
        var headers = [String: String]()


        return Promise{ fulfill, reject in
            Alamofire.request(
                path,
                method: .get,
                encoding: JSONEncoding.default,
                headers: headers
                ).validate().responseJSON{ response in
                    switch response.result{
                    case .success:
                        if let value = response.result.value{
                            let json = JSON(value)
                            print (json)
                            fulfill(json)
                        }
                    case .failure(let error):
                        if let data = response.data, let errorMessage = String(data: data, encoding: String.Encoding.utf8) {
                            print (errorMessage)
                        }
                        reject(error)
                    }
            }
        }

    }

    static func loadPosts() -> Promise<JSON> {
        return DataManager.load(fromPath: "posts")
    }

    static func loadUsers() -> Promise<JSON> {
        return DataManager.load(fromPath: "users")
    }

    static func loadComments() -> Promise<JSON> {
        return DataManager.load(fromPath: "comments")
    }

}
