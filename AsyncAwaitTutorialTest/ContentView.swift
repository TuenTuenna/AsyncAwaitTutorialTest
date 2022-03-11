//
//  ContentView.swift
//  AsyncAwaitTutorialTest
//
//  Created by Jeff Jeong on 2022/03/11.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var combineClient : CombineClient
    @StateObject var asyncClient : AsyncClient
    
    init(){
        self._combineClient = StateObject.init(wrappedValue: CombineClient())
        self._asyncClient = StateObject.init(wrappedValue: AsyncClient())
    }
    
    var body: some View {
        
        VStack(spacing: 12){
            Text("Hello, world!")
                .padding()
            Button(action: {
                self.combineClient.loadTodo()
            }, label: {
                Text("CombineClient Api Call")
            })
            Button(action: {
                Task {
                    await self.asyncClient.loadTodoAsync()
                }
            }, label: {
                Text("AsyncClient Api async Call")
            })
            
            Button(action: {
                Task{
                    await self.asyncClient.loadTodoAsyncPublisher()
                }
            }, label: {
                Text("AsyncClient Api Publisher to async Call")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
