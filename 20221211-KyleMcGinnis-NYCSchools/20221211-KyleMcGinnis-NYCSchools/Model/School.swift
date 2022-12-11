//
//  School.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//

import Foundation

struct School: Identifiable, Hashable {
    
    // MARK: Properties
    
    let id: String
    let dbn: String
    var academicOpportunities: [String]
    let city: String
    let ellPrograms: [String]
    let extracurricularActivities: [String]
    var faxNumber: String?
    let phoneNumber: String
    let finalGrades: String
    let interests: [String]
    let latitude: Double?
    let longitude: Double?
    let location: String
    let zip: String
    var neighborhood: String?
    let overviewParagraph: String
    let primaryAddress: String
    let program: String
    let requirements: [String]
    let email: String?
    let name: String
    var website: String?
    let schoolSports: [String]
    let stateCode: String
    var subway: String?
    let totalStudents: Int
    
    init(id: String, dbn: String, academicOpportunities: [String], city: String, ellPrograms: [String], extracurricularActivities: [String], faxNumber: String? = nil, phoneNumber: String, finalGrades: String, interests: [String], latitude: Double?, longitude: Double?, location: String, zip: String, neighborhood: String? = nil, overviewParagraph: String, primaryAddress: String, program: String, requirements: [String], email: String?, name: String, website: String? = nil, schoolSports: [String], stateCode: String, subway: String? = nil, totalStudents: Int) {
        self.id = id
        self.dbn = dbn
        self.academicOpportunities = academicOpportunities
        self.city = city
        self.ellPrograms = ellPrograms
        self.extracurricularActivities = extracurricularActivities
        self.faxNumber = faxNumber
        self.phoneNumber = phoneNumber
        self.finalGrades = finalGrades
        self.interests = interests
        self.latitude = latitude
        self.longitude = longitude
        self.location = location
        self.zip = zip
        self.neighborhood = neighborhood
        self.overviewParagraph = overviewParagraph
        self.primaryAddress = primaryAddress
        self.program = program
        self.requirements = requirements
        self.email = email
        self.name = name
        self.website = website
        self.schoolSports = schoolSports
        self.stateCode = stateCode
        self.subway = subway
        self.totalStudents = totalStudents
    }
    
    // MARK: Lifecycle
    
    init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = (try? values.decode(String.self, forKey: .id)) ?? UUID().uuidString
        dbn = try values.decode(String.self, forKey: .dbn)
        let academicOpportunities1: String? = try? values.decode(String.self, forKey: .academicopportunities1)
        let academicOpportunities2: String? = try? values.decode(String.self, forKey: .academicopportunities2)
        academicOpportunities = []
        if let academicOpportunities1 = academicOpportunities1 {
            academicOpportunities.append(academicOpportunities1)
        }
        if let academicOpportunities2 = academicOpportunities2 {
            academicOpportunities.append(academicOpportunities2)
        }
        city = try values.decode(String.self, forKey: .city)
        ellPrograms = []
        extracurricularActivities = []
        faxNumber = try? values.decode(String.self, forKey: .fax_number)
        phoneNumber = try values.decode(String.self, forKey: .phone_number)
        finalGrades = try values.decode(String.self, forKey: .finalgrades)
        interests = []
        latitude = Double((try? values.decode(String.self, forKey: .latitude)) ?? "")
        longitude = Double((try? values.decode(String.self, forKey: .longitude)) ?? "")
        location = try values.decode(String.self, forKey: .location)
        zip = try values.decode(String.self, forKey: .zip)
        neighborhood = try? values.decode(String.self, forKey: .neighborhood)
        overviewParagraph = try values.decode(String.self, forKey: .overview_paragraph)
        primaryAddress = try values.decode(String.self, forKey: .primary_address_line_1)
        program = try values.decode(String.self, forKey: .program1)
        requirements = []
        email = try? values.decode(String.self, forKey: .school_email)
        name = try values.decode(String.self, forKey: .school_name)
        website = try? values.decode(String.self, forKey: .website)
        schoolSports = []
        stateCode = try values.decode(String.self, forKey: .state_code)
        subway = try? values.decode(String.self, forKey: .subway)
        totalStudents = Int(try values.decode(String.self, forKey: .total_students)) ?? 0
    }
    
}

extension School: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case dbn
        case academicopportunities1
        case academicopportunities2
        case city
        case ell_programs
        case extracurricular_activities
        case fax_number
        case phone_number
        case finalgrades
        case interest1
        case latitude
        case longitude
        case location
        case zip
        case neighborhood
        case overview_paragraph
        case primary_address_line_1
        case program1
        case requirement1_1
        case requirement2_1
        case requirement3_1
        case requirement4_1
        case requirement5_1
        case school_email
        case school_name
        case website
        case school_sports
        case state_code
        case subway
        case total_students
    }
    
}
