//
//  DataManager.swift
//  LoadingView
//
//  Created by Ethan Hess on 7/5/22.
//

import Foundation

class DataManager {
    static func timeTest(_ delayInSeconds: Double, completion: @escaping(_ timeUp: Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds) {
            completion(true)
        }
    }
    
    //Test pagination / only loading visible cells
    static func loadLargeDataSet(_ completion: @escaping(_ arr: [SomeObject]) -> Void) {
        var tempArray : [SomeObject] = []
        for i in 0..<1000 {
            let object = SomeObject(id: i)
            tempArray.append(object)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(tempArray)
        }
    }
}

struct SomeObject {
    var id : Int
    init(id: Int) {
        self.id = id
    }
}
