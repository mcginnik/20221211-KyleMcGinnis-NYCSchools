//
//  SchoolSearchMockService.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//

import Foundation

class SchoolSearchMockService: SchoolSearchServiceProtocol {
    
    var fetchSchoolsCount: Int = 0
    var fetchSATsCount: Int = 0
    
    let schools: [School] = [
        .init(id: "1", dbn: "1", academicOpportunities: [], city: "test city", ellPrograms: [], extracurricularActivities: [], phoneNumber: "8675309", finalGrades: "6-12", interests: [], latitude: nil, longitude: nil, location: "NYC", zip: "10010", overviewParagraph: "test paragraph", primaryAddress: "test address", program: "", requirements: [], email: "test@test.com", name: "test school", schoolSports: [], stateCode: "NY", totalStudents: 0)
    ]
    
    let sats: [SAT] = [
        .init(id: "0", dbn: "1", numberOfStudents: 1, criticialReadingAvgScore: 100, mathAvgScore: 200, writingAvgScore: 300, schoolName: "test school")
    ]

    
    func fetchSchools(from urlString: String, completion: @escaping (Result<[School], Error>) -> Void) {
        fetchSchoolsCount += 1
        print("mock service")
        completion(.success(schools))
    }
    
    func fetchSATs(from urlString: String, completion: @escaping (Result<[SAT], Error>) -> Void) {
        fetchSATsCount += 1
        print("mock service")

        completion(.success(sats))
    }
    
    
    
}
