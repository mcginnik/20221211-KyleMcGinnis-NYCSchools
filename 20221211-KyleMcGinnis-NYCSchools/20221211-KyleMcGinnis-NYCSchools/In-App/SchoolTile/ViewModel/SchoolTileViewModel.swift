//
//  SchoolTileViewModel.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//

import Foundation
import SwiftUI

class SchoolTileViewModel: ObservableObject {
    
    let school: School
    
    var title: String {
        school.name
    }
    
    var subtitle: String {
        school.program
    }
    
    var imageURL: URL? {
        return URL(string: "https://static.vecteezy.com/system/resources/previews/002/206/174/original/school-building-icon-free-vector.jpg")
    }
    
    init(school: School){
        self.school = school
    }
    
}
