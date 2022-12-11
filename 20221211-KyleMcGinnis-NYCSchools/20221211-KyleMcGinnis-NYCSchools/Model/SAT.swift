//
//  SAT.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//

import Foundation

struct SAT: Identifiable {
    let id: String
    let dbn: String
    let numberOfStudents: Int
    let criticialReadingAvgScore: Int
    let mathAvgScore: Int
    let writingAvgScore: Int
    let schoolName: String

    // MARK: Lifecycle

    init(id: String, dbn: String, numberOfStudents: Int, criticialReadingAvgScore: Int, mathAvgScore: Int, writingAvgScore: Int, schoolName: String) {
        self.id = id
        self.dbn = dbn
        self.numberOfStudents = numberOfStudents
        self.criticialReadingAvgScore = criticialReadingAvgScore
        self.mathAvgScore = mathAvgScore
        self.writingAvgScore = writingAvgScore
        self.schoolName = schoolName
    }
    
    
    init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = (try? values.decode(String.self, forKey: .id)) ?? UUID().uuidString
        dbn = try values.decode(String.self, forKey: .dbn)
        numberOfStudents = Int(try values.decode(String.self, forKey: .num_of_sat_test_takers)) ?? 0
        criticialReadingAvgScore = Int(try values.decode(String.self, forKey: .sat_critical_reading_avg_score)) ?? 0
        mathAvgScore = Int(try values.decode(String.self, forKey: .sat_math_avg_score)) ?? 0
        writingAvgScore = Int(try values.decode(String.self, forKey: .sat_writing_avg_score)) ?? 0
        schoolName = try values.decode(String.self, forKey: .school_name)
    }
    
    
}


extension SAT: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case dbn
        case num_of_sat_test_takers
        case sat_critical_reading_avg_score
        case sat_math_avg_score
        case sat_writing_avg_score
        case school_name
    }
    
}
