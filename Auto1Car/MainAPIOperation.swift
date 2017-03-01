//
//  MainAPIOperation.swift
//  Auto1Car
//
//  Created by Hardik on 25/02/17.
//  Copyright © 2017 Auto1. All rights reserved.
//

import Foundation
import StockData


// Completion handler that fires at the end of a `StockAPIOperationCompletionHandler`
public typealias APIOperationCompletionHandler = (Result<[Any]>) -> Void

/**
 Composite class that brings together network requests (`NetworkOperation`),
 JSON parsing (`ParseJSONOperation`) as a single operation.
 */
class Auto1APIOperation<T: JSONDecode>: Operation {
    fileprivate let request: APIRequest
    fileprivate var session: URLSession!
    var completionHandler: StockAPIOperationCompletionHandler?
    fileprivate var parsedObjects: [Any]?
    fileprivate let internalQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.name = "MediumAPIOperation Internal Queue"
        return queue
    }()
    /// The last thing we do before punting out.
    fileprivate var finalOperation: BlockOperation!
    
    // MARK: Operation Property Overrides
    private var internalExecuting: Bool = false
    override dynamic var isExecuting: Bool {
        get {
            return internalExecuting
        }
        
        set(newValue) {
            willChangeValue(forKey: "isExecuting")
            internalExecuting = newValue
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    private var internalFinished: Bool = false
    override dynamic var isFinished: Bool {
        get {
            return internalFinished
        }
        set (newAnswer) {
            willChangeValue(forKey: "isFinished")
            internalFinished = newAnswer
            didChangeValue(forKey: "isFinished")
        }
    }
    
    override var isAsynchronous: Bool {
        return true
    }
    
    // MARK: Initialization
    init(requestTemplate: APIRequest,
         session: URLSession,
         qos: QualityOfService = .default,
         completionHandler: StockAPIOperationCompletionHandler?) {
        self.request = requestTemplate
        self.session = session
        self.internalQueue.qualityOfService = qos
        self.completionHandler = completionHandler
        super.init()
        
        self.qualityOfService = qos
    }
    
    // MARK: Operation
    override func start() {
        if isCancelled {
            isFinished = true
            return
        }
        
        internalQueue.isSuspended = true
        
        let requestOperation = NetworkOperation(requestTemplate: request, session: session)
        requestOperation.qualityOfService = self.qualityOfService
        requestOperation.completionHandler = { result in
            switch (result) {
            case .success(let json):
                self.parseJSON(json: json)
                break
            case .failure(let error):
                if let completion = self.completionHandler {
                    completion(Result.failure(error))
                }
                
                self.isFinished = true
                break
            }
        }
        
        internalQueue.addOperation(requestOperation)
        
        finalOperation = BlockOperation(block: {
            if let completion = self.completionHandler,
                let objects = self.parsedObjects {
                DispatchQueue.main.async {
                    completion(Result.success(objects))
                }
            }
            
            self.isFinished = true
        })
        
        internalQueue.isSuspended = false
    }
}



// MARK: Private/Convenience
private extension StockAPIOperation {
    
    //Fire off an internal operation to parse JSON object.
    func parseJSON(json: Any) {
        let jsonOperation = ParseJSONOperation<T>(json: json)
        jsonOperation.qualityOfService = self.qualityOfService
        jsonOperation.completionHandler = { result in
            switch (result) {
            case .success(let objects):
                self.parsedObjects = objects
                break
            case .failure(let error):
                if let completion = self.completionHandler {
                    completion(Result.failure(error))
                }
                self.isFinished = true
            }
        }
        
        finalOperation.addDependency(jsonOperation)
        internalQueue.addOperation(finalOperation)
        
        internalQueue.addOperation(jsonOperation)
        
    }
}
