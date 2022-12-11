//
//  SchoolSearchService.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//

import Foundation

protocol SchoolSearchServiceProtocol {
    func fetchSchools(from urlString: String, completion: @escaping (Result<[School], Error>) -> Void)
    func fetchSATs(from urlString: String, completion: @escaping (Result<[SAT], Error>) -> Void)

}

class SchoolSearchService {
    
    // MARK: Properties
    
    static let shared = SchoolSearchService()
    
    let schoolListURLString = "\(AppConfig.shared.baseURLString)/resource/s3k6-pzi2.json"
    let SATURLString = "\(AppConfig.shared.baseURLString)/resource/f9bf-2cp4.json"
    /// Allowing for Dependency injection here, calling the injected service instead of directly in SchoolSearchService so you can easily swap out if need be
    /// Would instead have this be an automatic static injection setup so that all services are set at complie time, but this is a simple way of doing it for now
    var injected: SchoolSearchServiceProtocol?
    
    // MARK: Lifecycle
    
    private init(){}
    
    static func setup(with service: SchoolSearchServiceProtocol){
        self.shared.injected = service
    }
    
    // MARK: API
    
    func fetchSchools(completion: @escaping (Result<[School], Error>) -> Void) {
        Logging.LogMe("...")
        self.injected?.fetchSchools(from: schoolListURLString) { res in
            switch res {
            case .success(let data):
                Logging.LogMe("Successfully.... \(data)")
            case .failure(let error):
                Logging.LogMe("Failed... \(error)", loggingLevel: .high)
            }
            completion(res)
        }
    }
    
    func fetchSATs(for school: School, completion: @escaping (Result<[SAT], Error>) -> Void) {
        let dbn = school.dbn
        let queryString = "\(SATURLString)?dbn=\(dbn)"
        Logging.LogMe("... \(queryString)")
        self.injected?.fetchSATs(from: queryString) { res in
            switch res {
            case .success(let data):
                Logging.LogMe("Successfully.... \(data)")
            case .failure(let error):
                Logging.LogMe("Failed... \(error)", loggingLevel: .high)
            }
            completion(res)
        }
    }
    
}
