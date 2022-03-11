//
//  API.swift
//  AsyncAwaitTutorialTest
//
//  Created by Jeff Jeong on 2022/03/11.
//

import Foundation
import Combine

struct API {
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
    
    func loadTodo() -> AnyPublisher<Todo, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Todo.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
