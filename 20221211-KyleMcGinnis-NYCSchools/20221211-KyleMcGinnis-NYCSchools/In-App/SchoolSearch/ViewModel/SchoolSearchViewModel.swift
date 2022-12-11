//
//  SchoolSearchViewModel.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//

import Foundation
import SwiftUI

class SchoolSearchViewModel: ObservableObject {
    
    @Published var schools: [School] = []
    @Published var isLoading: Bool = false
    
    init(){
        fetchSchools()
    }
    
    private func fetchSchools(){
        isLoading = true
        SchoolSearchService.shared.findSchools { [weak self] res in
            DispatchQueue.main.async {
                switch res {
                case .success(let schools):
                    self?.schools = schools
                case .failure(let error):
                    print(error)
                }
                self?.isLoading = false
            }
        }
    }
    
    func didTap(_ school: School){
        Logging.LogMe("... \(school.name)")
    }
    
}
