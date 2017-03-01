//
//  NetworkManager.swift
//  CarSelector
//
//  Created by Hardik on 25/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation

public final class NetworkManager {
    ///Higher priority work to be processed.
    fileprivate let foregroundQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.name = "Foreground Network Queue"
        queue.qualityOfService = .userInitiated
        return queue
    }()
    
    /// Lower priority units of work to be processed.
    fileprivate let backgroundQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.name = "Background Network Queue"
        queue.qualityOfService = .background
        return queue
    }()
    
    /// The `URLSession` object you want to use to work with the API.
    private let session: URLSession
    
    // MARK: Initialization
    public init(session: URLSession) {
        self.session = session
    }
    
    /// NetworkManager shared instance
    public static let `default`: NetworkManager = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return NetworkManager(session: session)
    }()
    
    
    ///Retrieve manufacturer list.
    @discardableResult
    public func getManufacturerList(pageNo: Int = 0,
                                    pageSize: Int = Constants.pageSize,
                                    completionHandler: APIOperationCompletionHandler?) -> Operation {
        let template = GetManufacturerRequest(withPageNo: pageNo, pageSize: pageSize)
        let operation = MainAPIOperation<Manufacturer>(requestTemplate: template, session: session, completionHandler: completionHandler)
        addToQueue(operation: operation)
        return operation
    }
    
    ///Retrieve models list.
    @discardableResult
    public func getModels(forManufacturerId manufacturerId: String,
                          pageNo: Int = 0,
                          pageSize: Int = Constants.pageSize,
                          completionHandler: APIOperationCompletionHandler?) -> Operation {
        let template = GetModelsRequest(withManufacturerId: manufacturerId, pageNo: pageNo, pageSize: pageSize)
        let operation = MainAPIOperation<Model>(requestTemplate: template, session: session, completionHandler: completionHandler)
        addToQueue(operation: operation)
        return operation
    }

    
}

// MARK: Private/Convenience
private extension NetworkManager {
    ///Add the `Operation` to a prioritized operation queue.
    func addToQueue(operation: Operation) {
        if (operation.queuePriority == .low || operation.queuePriority == .veryLow) {
            backgroundQueue.addOperation(operation)
            return
        }
        
        foregroundQueue.addOperation(operation)
    }
}
