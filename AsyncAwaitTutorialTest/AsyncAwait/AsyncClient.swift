//
//  AsyncClient.swift
//  AsyncAwaitTutorialTest
//
//  Created by Jeff Jeong on 2022/03/12.
//

import Foundation

class AsyncClient : ObservableObject {
    
    let api = AsyncAPI()
    
    func loadTodoAsyncPublisher() async {
        do {
            let todo = try await api.loadTodoWithPublisher().toAsync()
            print(todo)
            print("finished")
        } catch {
            print("failed")
        }
    }
    
    func loadTodoAsync() async {
        do {
            let todo = try await api.loadTodoAsync()
            print(todo)
            print("finished")
        } catch {
            print("failed")
        }
    }
}
