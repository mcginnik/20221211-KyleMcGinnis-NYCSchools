//
//  SchoolSearchService.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//

import Foundation

protocol SchoolSearchServiceProtocol {
    func findSchools(from urlString: String, completion: @escaping (Result<[School], Error>) -> Void)
//    func fetchImageURL(for breed: String, completion: @escaping (Result<String, Error>) -> Void)
}

class SchoolSearchService {
    
    static let shared = SchoolSearchService()
    
    let schoolListURLString = "\(AppConfig.shared.baseURLString)/resource/s3k6-pzi2.json"
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
    
//    func fetchImageURL(for breed: String, completion: @escaping (Result<String, Error>) -> Void) {
//        print("findAnimals start \(self.injected)")
//        self.injected?.fetchImageURL(for: breed) { res in
//            switch res {
//            case .success(let urlString):
//                print("Successfully fetchImageURL \(urlString)")
//            case .failure(let error):
//                print("Failed fetchImageURL... \(error)")
//            }
//            completion(res)
//        }
//    }
    
    static func setup(with service: SchoolSearchServiceProtocol){
        self.shared.injected = service
    }
    
    
}
