//
//  AsyncAPI.swift
//  AsyncAwaitTutorialTest
//
//  Created by Jeff Jeong on 2022/03/12.
//

import Foundation

import Foundation
import Combine

struct AsyncAPI {
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
    
    func loadTodoAsync() async throws -> Todo {
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Todo.self, from: data)
    }
    
    func loadTodoWithPublisher() -> AnyPublisher<Todo, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Todo.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
