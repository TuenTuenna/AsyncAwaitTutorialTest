//
//  CombineClient.swift
//  AsyncAwaitTutorialTest
//
//  Created by Jeff Jeong on 2022/03/12.
//

import Foundation
import Combine

class CombineClient : ObservableObject {
    
    var cancellable: AnyCancellable?
    
    let api = API()
    
    func loadTodo() {
        cancellable = api.loadTodo()
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    print("finished")
                case .failure:
                    print("failed")
                }
            }, receiveValue: { todo in
                print(todo)
            })
    }
}
