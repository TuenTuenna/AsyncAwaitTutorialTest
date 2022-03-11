//
//  AnyPublisher+Ext.swift
//  AsyncAwaitTutorialTest
//
//  Created by Jeff Jeong on 2022/03/12.
//

import Foundation
import Combine


extension AnyPublisher {
    
    /// AnyPublisher -> async 로 변경
    /// - Returns:
    func toAsync() async throws -> Output {
        
        try await withCheckedThrowingContinuation { continuation in
            
            var cancellable: AnyCancellable?
            
            cancellable = first()
                .sink { result in
                    switch result {
                    case .finished:
                        break
                    case let .failure(error):
                        continuation.resume(throwing: error)
                    }
                    cancellable?.cancel()
                } receiveValue: { value in
                    continuation.resume(with: .success(value))
                }
        }
    }
}
