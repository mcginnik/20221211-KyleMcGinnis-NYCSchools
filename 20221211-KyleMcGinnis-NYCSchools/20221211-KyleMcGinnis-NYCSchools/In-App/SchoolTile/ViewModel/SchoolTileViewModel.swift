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
        return URL(string: "https://static.vecteezy.com/system/resources/thumbnails/004/297/596/small/education-logo-open-book-dictionary-textbook-or-notebook-with-sunrice-icon-modern-emblem-idea-concept-design-for-business-libraries-schools-universities-educational-courses-vector.jpg")
    }
    
    init(school: School){
        self.school = school
    }
    
}
