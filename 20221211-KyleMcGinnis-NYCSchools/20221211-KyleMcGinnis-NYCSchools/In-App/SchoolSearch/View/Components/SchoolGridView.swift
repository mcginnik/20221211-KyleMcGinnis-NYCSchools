//
//  SchoolGridView.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//

import SwiftUI

struct SchoolGridView: View {
    
    let schools: [School]
    
    var didTap: (School) -> Void
    
    init(schools: [School], didTap: @escaping (School) -> Void){
        self.schools = schools
        self.didTap = didTap
    }
    
    
    var body: some View {
        let columns = Array(repeating: GridItem(.flexible(), spacing: 2), count: 2)
        ScrollView(.vertical){
            LazyVGrid(columns: columns, alignment: .leading, spacing: 2) {
                ForEach(schools, id: \.self) { school in
                    SchoolTileView(school: school) {  school in
                        self.didTap(school)
                    }
                }
            }
        }
    }
}

struct SchoolGridView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolGridView(schools: []){_ in }
    }
}
