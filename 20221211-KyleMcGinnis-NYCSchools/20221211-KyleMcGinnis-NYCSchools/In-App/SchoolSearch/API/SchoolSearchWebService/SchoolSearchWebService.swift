//
//  SchoolSearchWebService.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//

import Foundation



class SchoolSearchWebService: SchoolSearchServiceProtocol {
    
    func findSchools(from urlString: String, completion: @escaping (Result<[School], Error>) -> Void) {
        print("urlString \(urlString)")
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.URLFormatting))
            return
        }
        
        
        let request = Request<[School]>(url: url)
        WebService.execute(request: request) { (res) in
            switch res {
            case .failure(let error):
                completion(.failure(error))
            case .success(let school):
                //print(school)
                completion(.success(school))
            }
        }
    }
    
    
}
