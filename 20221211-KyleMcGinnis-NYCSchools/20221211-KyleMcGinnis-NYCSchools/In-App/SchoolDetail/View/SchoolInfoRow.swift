//
//  SchoolInfoRow.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//

import SwiftUI

struct SchoolInfoRow: View {
    
    let text: String
    var icon: String?
    
    init(text: String, icon: String? = nil) {
        self.text = text
        self.icon = icon
    }
    
    var body: some View {
        HStack {
            if let icon = icon {
                Image(systemName: icon)
            } else {
                Spacer()
                    .frame(width: 28)
            }
            Text(text)
            Spacer()
        }
    }
}

struct SchoolInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        SchoolInfoRow(text: "test", icon: "circle.fill")
    }
}
