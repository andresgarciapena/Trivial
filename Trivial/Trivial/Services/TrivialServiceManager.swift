//
//  TrivialServiceManager.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import Foundation

class TrivialServiceManager {
    
    static let sharedService = TrivialServiceManager()
    
    func requestApi(numberQuestions: String, category: String, completionHandler: @escaping (TrivialResponse?, Error?) -> Void) {
        let newUrl = String(format: Constants.apiUrl, numberQuestions, category)
        if let url = URL(string: newUrl) {
            URLSession.shared.dataTask(with: url) { (result) in
                DispatchQueue.main.async {
                    switch result {
                        case .success(let response, let data):
                            let decoder = JSONDecoder()
                            decoder.dataDecodingStrategy = .base64
                            do {
                                let questionData = try decoder.decode(TrivialResponse.self, from: data)
                                completionHandler(questionData, nil)
                            } catch let err {
                                print("Error", err)
                            }
                        case .failure(let error):
                            print(error)
                     }
                }
            }.resume()
        }
    }
}

extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        
    return dataTask(with: url) { (data, response, error) in
        if let error = error {
            result(.failure(error))
            return
        }
        guard let response = response, let data = data else {
            let error = NSError(domain: "error", code: 0, userInfo: nil)
            result(.failure(error))
            return
        }
        result(.success((response, data)))
    }
}
}
