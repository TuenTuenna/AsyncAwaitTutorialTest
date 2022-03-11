//
//  TaskGroupTestVM.swift
//  AsyncAwaitTutorialTest
//
//  Created by Jeff Jeong on 2022/03/12.
//

import Foundation
import Combine
import Alamofire

class TaskGroupTestVM : ObservableObject {
    
    init(){
        
    }
    
    // 끝에 async 를 붙인다.
    func performHeavyTask() async {
        // Run some heavy tasks here...
    }
    
    func performThrowingHeavyTask() async throws -> String {
        
        // Run some heavy tasks here...
        
        return ""
    }
    
    
    
    func performTaskA() async -> Int {
        print("performTaskA")
        // Wait for 2 seconds
        await Task.sleep(2 * 1_000_000_000)
        return 2
    }

    func performTaskB() async -> Int {
        print("performTaskB")
        // Wait for 3 seconds
        await Task.sleep(3 * 1_000_000_000)
        return 3
    }

    func performTaskC() async -> Int {
        print("performTaskC")
        // Wait for 3 seconds
        await Task.sleep(4 * 1_000_000_000)
        return 4
    }

    // 순서대로
    func doSomethingSequence() {

        // 순서대로 진행됨
        Task {
            
            // 1번 끝나고
            let a = await performTaskA()
            
            // 2번 끝나고
            let b = await performTaskB()
            
            let c = await performTaskC()
            
            let sum = a + b + c
            print("doSomethingSequence sum: \(sum)")
        }
    }

    // 동시 진행
    func doSomethingParalle() {
        
        // 동시 진행
        Task {
            // async let 을 하면 안기다림
            async let a = performTaskA()
            
            // async let 을 하면 안기다림
            async let b = performTaskB()
            
            async let c = performTaskC()
            
            // await 로 async let 두놈이 끝날때 까지 기다림
    //        let sum = await(a + b)
            
            let results : [Int] = await [ a, b, c ]
            
            let sum = results.reduce(0, { x, y in
                x + y
            })
            print("doSomethingParalle sum: \(sum)")
        }
    }

    
    
}

//MARK: - alamofire
extension TaskGroupTestVM {
    
    fileprivate func apiCallA() async -> Todo? {
        print("apiCallA")
        let value = try? await AF.request("https://jsonplaceholder.typicode.com/todos/1").serializingDecodable(Todo.self).value
        return value
        print("apiCallA value: \(value)")
    }
    
    fileprivate func apiCallB() async -> Todo? {
        print("apiCallB")
        let value = try? await AF.request("https://jsonplaceholder.typicode.com/todos/1").serializingDecodable(Todo.self).value
        
        return value
        print("apiCallB value: \(value)")
    }
    
    fileprivate func apiCallC() async -> Todo? {
        print("apiCallC")
        let value = try? await AF.request("https://jsonplaceholder.typicode.com/todos/1").serializingDecodable(Todo.self).value
        
        return value
        print("apiCallV value: \(value)")
    }
    
    
    // 순서대로
    func callApisSequence() {

        // 순서대로 진행됨
        Task {
            
            // 1번 끝나고
            let a = await apiCallA()
            
            // 2번 끝나고
            let b = await apiCallB()
            
            let c = await apiCallC()
            
            print("callApisSequence a: \(a), b: \(b), c: \(c)")
        }
    }

    // 동시 진행
    func callApisParalle() {
        
        // 동시 진행
        Task {
            // async let 을 하면 안기다림
            async let a = apiCallA()
            
            // async let 을 하면 안기다림
            async let b = apiCallB()
            
            async let c = apiCallC()
            
            // await 로 async let 두놈이 끝날때 까지 기다림
    //        let sum = await(a + b)
            
//            let results : [Todo?] = await [ a, b, c ]
            let results = await (a, b, c)
            print("callApisParalle results: \(results)")
        }
    }
}
