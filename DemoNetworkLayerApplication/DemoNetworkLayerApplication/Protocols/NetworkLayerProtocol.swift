//
//  NetworkLayerProtocol.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 4/20/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol NetworkLayerDelegate:class{
    func onDataLoaded(data: Data?)
}

enum Schema:String{
    case http = "http"
    case https = "https"
    case ftp = "ftp"
}

enum RequestMethod:String{
    case GET = "GET"
    case POST = "POST"
    case DELETE = "DELETE"
    case PUT = "PUT"
}

//Older
protocol  NetworkProtocol:class {
    var urlComponent: URLComponents? {get set}
    weak var delegate: NetworkLayerDelegate? {get set}
    func setUrlComponent(urlSchema schema: Schema,urlHost host: String,urlPath path: String)
    func addQueryItem(keyItem key: String, valueItem value: String)
    func createSession(config conf: URLSessionConfiguration)->URLSession
    func createURLRequest(method: RequestMethod)->URLRequest
    func createDataTask(session: URLSession, withUrl url:URLRequest,completion _completion: @escaping (_ data:Data?,_ urlResponse: URLResponse?,_ error: Error?)->Void)->URLSessionDataTask
    func createDataTask(session: URLSession, withUrl url:URLRequest)->URLSessionDataTask?
    func getDataFromRequest(dataTask: URLSessionDataTask)
}


