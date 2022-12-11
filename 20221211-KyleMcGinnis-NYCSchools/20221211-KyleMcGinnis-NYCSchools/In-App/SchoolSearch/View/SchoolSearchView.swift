//
//  SchoolSearchView.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//

import SwiftUI

struct SchoolSearchView: View {
    
    @ObservedObject var viewModel: SchoolSearchViewModel
    
    init(viewModel: SchoolSearchViewModel) {
        self.viewModel = viewModel
    }
    
    var loadingView: some View {
        ProgressView()
            .controlSize(.large)
    }
    
    var failedSearchView: some View {
        Text(SchoolSearchConstants.searchFailDescription)
    }
    
    var body: some View {
        if viewModel.isLoading {
            loadingView
        } else {
            if viewModel.schools.count > 0 {
                SchoolGridView(schools: viewModel.schools, didTap: didTap)
            } else {
                failedSearchView
            }
        }
    }
    
    func didTap(school: School){
        viewModel.didTap(school)
    }
}

struct SchoolSearchView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolSearchView(viewModel: .init())
    }
}
