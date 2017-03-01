//
//  ParseOperation.swift
//  Auto1Car
//
//  Created by Hardik on 25/02/17.
//  Copyright © 2017 CarSelector. All rights reserved.
//

import Foundation

/// Completion handler that fires at the end of a `ParseJSONOperation`
typealias JSONParsingCompletionHandler = (Result<[JSONDecodable]>) -> Void

/**
 /// Operation to parse `JSON` into objects of `T` type.
 
 - Note: `T` must be a a class that conforms to the `JSONDecodable` protocol.
 */
internal final class ParseJSONOperation<T: JSONDecodable>: Operation {
    var completionHandler: JSONParsingCompletionHandler?
    private let json: Any
    /// The resulting parsed objects after parsing.
    private var parsedObjects = [JSONDecodable]()
    
    // MARK: Operation Property Overrides
    private var internalFinished: Bool = false
    override var isFinished: Bool {
        get {
            return internalFinished
        }
        set (newValue) {
            willChangeValue(forKey: "isFinished")
            internalFinished = newValue
            didChangeValue(forKey: "isFinished")
        }
    }
    
    override var isAsynchronous: Bool {
        return true
    }
    
    // MARK: Initialization
    init(json: Any) {
        self.json = json
        super.init()
    }
    
    // MARK: Operation gets started
    override func start() {
        if isCancelled {
            isFinished = true
            return
        }
        
        if let internalDict = json as? [String : Any] {
            //Parse pagination info
            T.parsePaginationInfo(fromResponse: internalDict)
            
            //Parse results into respective Model object
            if let manufDict = internalDict[Constants.WebserviceResponseKey.wkda] as? [String : Any] {
                for (key, name) in manufDict {
                    let car = T(response: [key: name])
                    parsedObjects.append(car)
                }
            }
        }
        
        if parsedObjects.isEmpty {
            isFinished = true
            return
        }
        
        completionHandler?(Result.success(parsedObjects))
        isFinished = true
    }
}
