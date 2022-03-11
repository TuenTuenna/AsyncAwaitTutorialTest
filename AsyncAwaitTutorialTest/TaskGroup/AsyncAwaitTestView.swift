//
//  AsyncAwaitTestView.swift
//  AsyncAwaitTutorialTest
//
//  Created by Jeff Jeong on 2022/03/12.
//

import SwiftUI


struct AsyncAwaitTestView: View {
    
    @StateObject var viewModel : TaskGroupTestVM
    
    init(){
        self._viewModel = StateObject.init(wrappedValue: TaskGroupTestVM())
    }
    
    var body: some View {
        
        VStack(spacing: 12){
            Text("Hello, world!")
                .padding()
            Button(action: {
                Task { self.viewModel.doSomethingSequence() }
            }, label: {
                Text("doSomethingSequence")
            })
            Button(action: {
                Task { self.viewModel.doSomethingParalle() }
            }, label: {
                Text("doSomethingParalle")
            })
            
            Spacer().frame(height: 20)
            
            Button(action: {
                Task { self.viewModel.callApisSequence() }
            }, label: {
                Text("callApisSequence")
            })
            Button(action: {
                Task { self.viewModel.callApisParalle() }
            }, label: {
                Text("callApisParalle")
            })
            Spacer()
        }
    }
}

struct AsyncAwaitTestView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncAwaitTestView()
    }
}
