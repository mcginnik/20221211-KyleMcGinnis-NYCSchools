//
//  SchoolSearchService.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//

import Foundation

protocol SchoolSearchServiceProtocol {
    func findSchools(from urlString: String, completion: @escaping (Result<[School], Error>) -> Void)
}

class SchoolSearchService {
    
    static let shared = SchoolSearchService()
    
    let schoolListURLString = "\(AppConfig.shared.baseURLString)/resource/s3k6-pzi2.json"
    /// Allowing for Dependency injection here, calling the injected service instead of directly in SchoolSearchService so you can easily swap out if need be
    /// Would instead have this be an automatic static injection setup so that all services are set at complie time, but this is a simple way of doing it for now
    var injected: SchoolSearchServiceProtocol?
    
    private init(){}
    
    func findSchools(completion: @escaping (Result<[School], Error>) -> Void) {
        Logging.LogMe("...")
        self.injected?.findSchools(from: schoolListURLString) { res in
            switch res {
            case .success(let data):
                Logging.LogMe("Successfully.... \(data)")
            case .failure(let error):
                Logging.LogMe("Failed... \(error)", loggingLevel: .high)
            }
            completion(res)
        }
    }
    
    static func setup(with service: SchoolSearchServiceProtocol){
        self.shared.injected = service
    }
    
    
}
