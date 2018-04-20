//
//  NetworkLayer.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 4/20/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit
//Refactor
enum Scheme: String {
    case HTTP = "https"
    case Proxy
}

class NetworkLayer: InteractorDelegate, NetworkProtocol{
    var urlComponent: URLComponents?
    weak var delegate: NetworkLayerDelegate?
    //Setting URL Component
    func setUrlComponent(urlSchema schema: String,urlHost host: String,urlPath path: String){
        self.urlComponent = URLComponents()
        self.urlComponent?.scheme = schema
        self.urlComponent?.host = host
        self.urlComponent?.path = path
    }
    //Adding new query item
    func addQueryItem(keyItem key: String, valueItem value: String){
        let newQueryItem = URLQueryItem(name: key, value: value)
        self.urlComponent?.queryItems?.append(newQueryItem)
    }
    //Create Session
    func createSession(config conf: URLSessionConfiguration)->URLSession{
        return URLSession(configuration: conf)
    }
    //Create URL Request
    func createURLRequest(method: String)->URLRequest{
        var urlRequest = URLRequest(url: (self.urlComponent?.url!)!)
        urlRequest.httpMethod = method
        return urlRequest
    }
    //Create data task with custom completion function
    func createDataTask(session: URLSession, withUrl url:URLRequest,completion _completion: @escaping (_ data:Data?,_ urlResponse: URLResponse?,_ error: Error?)->Void)->URLSessionDataTask{
        return session.dataTask(with: url, completionHandler: _completion)
    }
    //Create data task with default completion
    func createDataTask(session: URLSession, withUrl url:URLRequest)->URLSessionDataTask?{
        return session.dataTask(with: url, completionHandler: { (dataResponse, URLResponse, error) in
            DispatchQueue.main.async {
                if let errorResponse = error{
                    fatalError("Couldn't load data with your request. Error: \(errorResponse)")
                }
                else{
                    self.delegate?.onDataLoaded(data: dataResponse)
                }
            }
        })
    }
    //Crea
    func getDataFromRequest(dataTask: URLSessionDataTask) {
        dataTask.resume()
    }
}
